import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/user_model.dart';
import 'package:hollythackwray/res/platform_dialogue.dart';
import 'package:hollythackwray/screens/healthyMe/healthy_me_screen.dart';
import 'package:hollythackwray/screens/login/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'base_provider.dart';

class FirebaseProvider extends BaseProvider {
  late FirebaseStorage firebaseStorage;
  FirebaseProvider() {
    _auth = FirebaseAuth.instance;
    firebaseStorage = FirebaseStorage.instance;
    firebaseStorage.setMaxUploadRetryTime(Duration(seconds: 3));
    Timer(
      Duration(seconds: 3),
      () async {
        _user = _auth.currentUser;
        if (_user == null) {
          Get.offAll(() => LoginScreen());
        } else {
          await getUserData(_user!);
          userDataStream(_user!);
          navigateToTabsPage(_user);
        }
      },
    );
  }

  late FirebaseAuth _auth;
  auth.User? _user;
  auth.User? get firebaseUser => _user;
  UserModel? user;
  String? name;

  Future<void> signIn({required String email, required String password}) async {
    try {
      setLoadingState(true);
      final authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _user = authResult.user;
      await getUserData(_user!);
      userDataStream(_user!);
      setLoadingState(false);
      navigateToTabsPage(_user);
    } on SocketException catch (_) {
      showPlatformDialogue(title: "Network Connection Error");
    } on FirebaseAuthException catch (e) {
      setLoadingState(false);
      if (e.code == "wrong-password") {
        showPlatformDialogue(title: "Wrong Password");
      } else if (e.code == "user-not-found") {
        showPlatformDialogue(
          title: "User Not Found",
          content: Text(
            "Please Check Your Email, Or Try Signing up",
          ),
        );
      } else {
        showPlatformDialogue(title: e.code);
      }
    }
  }

  Future<bool> updatePassword(String newPass) async {
    try {
      if (_user != null) {
        await _user!.updatePassword(newPass).then((value) => showPlatformDialogue(title: 'Password Updated'));
      }
    } on SocketException catch (_) {
      return false;
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<bool> updateEmail(String newMail) async {
    try {
      if (_user != null) {
        await _user!.updateEmail(newMail).then((value) => showPlatformDialogue(title: 'Email Updated'));
      }
    } on SocketException catch (_) {
      return false;
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String fName,
    required String lName,
    required String? name,
  }) async {
    try {
      setLoadingState(true);
      final authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = authResult.user;
      this.name = name;
      await addUserDataToFirebase(name, email, fName, lName);
      setLoadingState(false);
    } on SocketException catch (_) {
      setLoadingState(false);
      showPlatformDialogue(title: "Network Connection Error");
    } on FirebaseAuthException catch (e) {
      setLoadingState(false);
      if (e.code == "email-already-in-use") {
        showPlatformDialogue(title: "Email Already In Use");
      } else {
        showPlatformDialogue(title: e.code);
      }
    }
  }

  Future<void> addUserDataToFirebase(
    String? name,
    String email,
    String fName,
    String lName,
  ) async {
    user = UserModel(
      username: name,
      trainers: [],
      currentProgram: [],
      firstName: fName,
      weight: [],
      programs: [],
      lastName: lName,
      professionalAccount: false,
      profilePic: null,
      email: email,
      userId: _user!.uid,
      notifications: true,
    );
    await FirebaseFirestore.instance.collection("users").doc(_user!.uid).set(
          user!.toMap(),
        );
    setLoadingState(false);
    userDataStream(_user!);
    navigateToTabsPage(_user);
  }

  void navigateToTabsPage(auth.User? firebaseUser) {
    if (firebaseUser != null) {
      Get.offAll(() => HealtthyMeScreen());
    }
  }

  Future<bool> getUserData(User firebaseUser) async {
    final document = await FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).get();

    if (document.exists) {
      user = UserModel.fromMap(document.data()!);
      return true;
    }
    user = null;
    return false;
  }

  void userDataStream(auth.User firebaseUser) {
    FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).snapshots().listen((document) {
      print("USER STREAM WMITTING VALUE");

      if (document.exists) {
        user = UserModel.fromMap(document.data()!);
        print("NOTIFTING LISTENERS");
        notifyListeners();
      }
    });
  }

  signOut() async {
    // await _removeToken(_user.uid);
    _user = null;
    name = null;
    user = null;
    // UserModel.users.clear();
    _auth.signOut();
    Get.offAll(() => LoginScreen());
  }

  PickedFile? image;
  var ref;
  uploadProfilePicture(ImageSource source) async {
    try {
      image = (await ImagePicker().getImage(source: source));
      if (image == null) return;
      setLoadingState(true);
      final filename = image!.path.split("/").last;
      Directory tempDir = await getTemporaryDirectory();
      final compressedImage = await (FlutterImageCompress.compressAndGetFile(image!.path, tempDir.path + ".jpg"));
      final storageReference = firebaseStorage.ref().child("profile_pictures").child(filename);
      await storageReference.putFile(compressedImage!);
      final imageUrl = await FirebaseStorage.instance
          .ref(
            firebaseStorage.ref().child("profile_pictures").child(filename).fullPath,
          )
          .getDownloadURL();
      await updateProfilePicture(imageUrl);
      print("DOWNLOAD URL $imageUrl");
      setLoadingState(false);
    } on SocketException catch (_) {
      image = null;
      setLoadingState(false);
      showPlatformDialogue(title: "Network Connection Error");
      return false;
    } catch (e) {
      print(e);
      image = null;
      setLoadingState(false);
    }
  }

  Future<void> updateProfilePicture(String imageUrl) async {
    await FirebaseFirestore.instance.collection("users").doc(user!.userId).update({"profilePic": imageUrl});
  }

  // Future<void> addPost({
  //   required PickedFile image,
  //   List<String>? hashTags,
  // }) async {
  //   try {
  //     setLoadingState(true);
  //     final filename = image.path.split("/").last;
  //     Directory tempDir = await getTemporaryDirectory();
  //     final compressedImage = await (FlutterImageCompress.compressAndGetFile(image.path, tempDir.path + ".jpg"));
  //     final storageReference = firebaseStorage.ref().child("postsImages").child(filename);
  //     await storageReference.putFile(compressedImage!);
  //     final imageUrl = await FirebaseStorage.instance
  //         .ref(
  //           firebaseStorage.ref().child("postsImages").child(filename).fullPath,
  //         )
  //         .getDownloadURL();
  //     var ref = FirebaseFirestore.instance.collection("posts").doc().id;

  //     PostModel post = PostModel(
  //       picUrl: imageUrl,
  //       postId: ref,
  //       hashTags: hashTags,
  //       userId: _user!.uid,
  //       bookmarkedBy: [],
  //     );
  //     await FirebaseFirestore.instance.collection("users").doc(user!.userId).update(
  //       {
  //         "postIds": FieldValue.arrayUnion(
  //           [ref],
  //         ),
  //       },
  //     );
  //     await FirebaseFirestore.instance.collection("posts").doc(ref).set(
  //           post.toMap(),
  //         );
  //     setLoadingState(false);
  //     navigateToTabsPage(_user);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  updateUsername(String name) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(user!.userId).update(
        {
          "username": name,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<bool> addTrainer(String id) async {
    try {
      setLoadingState(true);
      await FirebaseFirestore.instance.collection('users').doc(id).update({
        'trainers': FieldValue.arrayUnion([user!.userId!]),
      });
      setLoadingState(false);
    } on SocketException catch (_) {
      setLoadingState(false);
      showPlatformDialogue(title: "Network Connection Error");
      return false;
    } catch (e) {
      setLoadingState(false);
      showPlatformDialogue(title: 'Something went wrong');
    }
    setLoadingState(false);
    return true;
  }
}
