import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/day_model.dart';
import 'package:hollythackwray/models/plan_model.dart';
import 'package:hollythackwray/models/user_model.dart';
import 'package:hollythackwray/res/images.dart';
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
        await addingPlans();
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
      currentProgram: [],
      firstName: fName,
      lastName: lName,
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

  addingPlans() async {
    var ref;
    ref = FirebaseFirestore.instance.collection('plans').doc().id;

    await FirebaseFirestore.instance.collection('plans').doc(ref).set(
          PlanModel(
            id: ref,
            title: 'BULK',
            days: [
              DayModel(
                name: 'Monday',
                data: [
                  DataModel(
                    notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                    title: 'Take a brisk run/walk to start your day!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                    title: 'Breakfast: Eggs any style',
                    icon: Images.spoons,
                    subtitle: 'Include: cheese, lentils and a glass of milk',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                    title: 'Lunch: Tuna or Salmon sandwich',
                    icon: Images.spoons,
                    subtitle: 'Include: Ezekiel bread',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                    title: 'Gym: Chest + Shoulders',
                    icon: Images.dumble,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                    title: 'Dinner: Chicken without the skin',
                    icon: Images.spoons,
                    subtitle: 'Include: Broccoli and Quinoa',
                  ),
                ],
              ),
              DayModel(
                name: 'Tuesday',
                data: [
                  DataModel(
                    notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                    title: 'Take a brisk run/walk to start your day!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                    title: 'Breakfast: Oats ',
                    icon: Images.spoons,
                    subtitle: 'Include: and greek yogurt, quinoa, almonds and milk',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                    title: 'Lunch: Salad with shrimp',
                    icon: Images.spoons,
                    subtitle: 'Include: pumkin seeds and quinoa',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                    title: 'Gym: Back + Legs',
                    icon: Images.dumble,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                    title: 'Dinner: Lean beef',
                    icon: Images.spoons,
                    subtitle: 'Include: Brussels sprouts',
                  ),
                ],
              ),
              DayModel(
                name: 'Wednesday',
                data: [
                  DataModel(
                    notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                    title: 'Take a brisk run/walk to start your day!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                    title: 'Breakfast: Eggs any style ',
                    icon: Images.spoons,
                    subtitle: 'Include: cheese, lentils and a glass of milk',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                    title: 'Lunch: Smoothie',
                    icon: Images.spoons,
                    subtitle: 'Include: Fresh fruits, avocado and milk',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                    title: 'Gym: Arms + Abdominals',
                    icon: Images.dumble,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                    title: 'Dinner: Tuna or salmon',
                    icon: Images.spoons,
                    subtitle: 'Include: Potato, Kumara, carrots and Quinoa ',
                  ),
                ],
              ),
              DayModel(
                name: 'Thursday',
                data: [
                  DataModel(
                    notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                    title: 'Take a brisk run/walk to start your day!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                    title: 'Breakfast: Oats',
                    icon: Images.spoons,
                    subtitle: 'Include: and greek yoghurt, quinoa, almonds and milk',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                    title: 'Lunch: Tuna or Salmon sandwich',
                    icon: Images.spoons,
                    subtitle: 'Include: Ezekiel bread ',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                    title: 'Gym: Chest + Shoulders',
                    icon: Images.dumble,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                    title: 'Dinner: Pork tenderloin',
                    icon: Images.spoons,
                    subtitle: 'Include: Beans and broccoli ',
                  ),
                ],
              ),
              DayModel(
                name: 'Friday',
                data: [
                  DataModel(
                    notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                    title: 'Take a brisk run/walk to start your day!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                    title: 'Breakfast: Eggs any style ',
                    icon: Images.spoons,
                    subtitle: 'Include: cheese, lentils and a glass of milk',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                    title: 'Lunch: Chicken breast',
                    icon: Images.spoons,
                    subtitle: 'Include: Soybeans and Cottage cheese',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                    title: 'Gym: Back + Legs',
                    icon: Images.dumble,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                    title: 'Dinner: Lean beef',
                    icon: Images.spoons,
                    subtitle: 'Include: Brussels sprouts',
                  ),
                ],
              ),
              DayModel(
                name: 'Satday',
                data: [
                  DataModel(
                    notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                    title: 'Take a brisk run/walk to start your day!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                    title: 'Breakfast: Chicken omlette ',
                    icon: Images.spoons,
                    subtitle: 'Include: Glass of milk / soya milk',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                    title: 'Lunch: Tuna or Salmon sandwich',
                    icon: Images.spoons,
                    subtitle: 'Include: Ezekiel bread ',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
                    title: 'Reminder: Try to stay active!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                    title: 'Gym: Arms + Abdominals',
                    icon: Images.dumble,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                    title: 'Dinner: Chicken without the skin',
                    icon: Images.spoons,
                    subtitle: 'Include: Broccoli and Quinoa',
                  ),
                ],
              ),
              DayModel(
                name: 'sunday',
                data: [
                  DataModel(
                    notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                    title: 'Take a brisk run/walk to start your day!',
                    icon: Images.running_person,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                    title: 'Breakfast: Anything!',
                    icon: Images.spoons,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                    title: 'Lunch: Anything!',
                    icon: Images.spoons,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                    title: 'Gym: Optional',
                    icon: Images.dumble,
                    subtitle: '',
                  ),
                  DataModel(
                    notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                    title: 'Dinner: Anything!',
                    icon: Images.spoons,
                    subtitle: '',
                  ),
                ],
              ),
            ],
            description:
                'Bulking is the muscle gaining phase. In this program you will intentionally consume more calories than your body needs. These extra calories provide your body with the necessary fuel to boost muscle size and strength.',
            icons: [
              Images.dumble,
              Images.running_person,
              Images.spoons,
            ],
          ).toMap(),
        );
    ref = FirebaseFirestore.instance.collection('plans').doc().id;
    await FirebaseFirestore.instance.collection('plans').doc(ref).set(PlanModel(
        title: 'SLIM',
        id: ref,
        days: [
          DayModel(
            name: 'Monday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                title: 'Take a brisk run/walk to start your day!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Eggs any style',
                icon: Images.spoons,
                subtitle: 'Include: a glass of milk',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                title: 'Reminder: Try to stay active!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Salmon',
                icon: Images.spoons,
                subtitle: 'Include: Broccoli, cauliflower and cabbage',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                title: 'Cardio: Run/walk 10 - 60 minutes ',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Chicken without the skin',
                icon: Images.spoons,
                subtitle: 'Include: Broccoli and potatoes',
              ),
            ],
          ),
          DayModel(name: 'Tuesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Green tea',
              icon: Images.spoons,
              subtitle: 'Include: Fruit',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Eggs',
              icon: Images.spoons,
              subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Cardio: Run/walk 10 - 60 minutes ',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Lean beef',
              icon: Images.spoons,
              subtitle: 'Include: Brussels sprouts',
            ),
          ]),
          DayModel(name: 'Wednesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Smoothie',
              icon: Images.spoons,
              subtitle: 'Include: Vegetables, berries and fruit',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Eggs',
              icon: Images.spoons,
              subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Cardio: Run/walk 10 - 60 minutes ',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Avocado and salad',
              icon: Images.spoons,
              subtitle: 'Include: Kale and chickpeas',
            ),
          ]),
          DayModel(name: 'Thursday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Coffee',
              icon: Images.spoons,
              subtitle: 'Include: Grapefruit',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Tuna',
              icon: Images.spoons,
              subtitle: 'Include: Ezekiel Bread',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Cardio: Run/walk 10 - 60 minutes ',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Bean and Vegetable Soup',
              icon: Images.spoons,
              subtitle: 'Include: Black beans',
            ),
          ]),
          DayModel(name: 'Friday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Bananas and greek yoghurt',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Soup',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Cardio: Run/walk 10 - 60 minutes ',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Chicken',
              icon: Images.spoons,
              subtitle: '',
            ),
          ]),
          DayModel(name: 'Satday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oatmeal',
              icon: Images.spoons,
              subtitle: 'Include: Chia seeds, flax seeds, greek yogurt and nuts',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Soup',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Cardio: Run/walk 10 - 60 minutes ',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Steak',
              icon: Images.spoons,
              subtitle: 'Include: Broccoli',
            ),
          ]),
          DayModel(
            name: 'sunday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                title: 'Take a brisk run/walk to start your day!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                title: 'Cardio: Run/walk 10 - 60 minutes',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
            ],
          ),
        ],
        description:
            'Slimming is loosing weight healthily without gaining muscle. You will be consuming less calories than your body needs without feeling hungry so you use more energy than your providing and therefore loosing weight.',
        icons: [
          Images.running_person,
          Images.spoons,
        ]).toMap());
    ref = FirebaseFirestore.instance.collection('plans').doc().id;

    await FirebaseFirestore.instance.collection('plans').doc(ref).set(PlanModel(
        title: 'TONE',
        id: ref,
        days: [
          DayModel(
            name: 'Monday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                title: 'Take a brisk run/walk to start your day!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Eggs any style',
                icon: Images.spoons,
                subtitle: 'Include: a glass of milk',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                title: 'Reminder: Try to stay active!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Tuna or Salmon sandwich',
                icon: Images.spoons,
                subtitle: 'Include: Ezekiel bread',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
                title: 'Reminder: Try to stay active!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                title: 'Gym: Chest + Shoulders',
                icon: Images.dumble,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Chicken without the skin',
                icon: Images.dumble,
                subtitle: 'Include: Broccoli and Quinoa',
              ),
            ],
          ),
          DayModel(name: 'Tuesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Green tea',
              icon: Images.spoons,
              subtitle: 'Include: Fruit',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Salad with shrimp',
              icon: Images.spoons,
              subtitle: 'Include: pumkin seeds and quinoa',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Gym: Back + Legs',
              icon: Images.dumble,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Lean beef',
              icon: Images.spoons,
              subtitle: 'Include: Brussels sprouts',
            ),
          ]),
          DayModel(name: 'Wednesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Eggs any style ',
              icon: Images.spoons,
              subtitle: 'Include: cheese, lentils and a glass of milk',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Smoothie',
              icon: Images.spoons,
              subtitle: 'Include: Fresh fruits, avocado and milk',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Gym: Arms + Abdominals',
              icon: Images.dumble,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Avocado and salad',
              icon: Images.spoons,
              subtitle: 'Include: Kale and chickpeas',
            ),
          ]),
          DayModel(name: 'Thursday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Coffee',
              icon: Images.spoons,
              subtitle: 'Include: Grapefruit',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Tuna or Salmon sandwich',
              icon: Images.spoons,
              subtitle: 'Include: Ezekiel Bread',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Gym: Chest + Shoulders',
              icon: Images.dumble,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Bean and Vegetable Soup',
              icon: Images.spoons,
              subtitle: 'Include: Black beans',
            ),
          ]),
          DayModel(name: 'Friday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Bananas and greek yoghurt',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Soup',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Gym: Back + Legs',
              icon: Images.dumble,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Chicken',
              icon: Images.spoons,
              subtitle: 'Include: Cayenne pepper and salad',
            ),
          ]),
          DayModel(name: 'Satday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oatmeal',
              icon: Images.spoons,
              subtitle: 'Include: Chia seeds, flax seeds, greek yogurt and nuts',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Soup',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Gym: Arms + Abdominals',
              icon: Images.dumble,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Steak',
              icon: Images.spoons,
              subtitle: 'Include: Broccoli',
            ),
          ]),
          DayModel(
            name: 'sunday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                title: 'Take a brisk run/walk to start your day!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                title: 'Breakfast: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
                title: 'Lunch: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                title: 'Gym: Optional',
                icon: Images.dumble,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
            ],
          ),
        ],
        description:
            'Toning leads to a reduction in body fat and weight. The loss of weight on the body’s frame results in better health and can reduce the appearance of body fat by tightening up the muscles and giving them shape.',
        icons: [
          Images.dumble,
          Images.running_person,
          Images.spoons,
        ]).toMap());
    ref = FirebaseFirestore.instance.collection('plans').doc().id;

    await FirebaseFirestore.instance.collection('plans').doc(ref).set(PlanModel(
        title: 'GAIN',
        id: ref,
        days: [
          DayModel(
            name: 'Monday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                title: 'Take a brisk run/walk to start your day!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Eggs any style',
                icon: Images.spoons,
                subtitle: 'Include: cheese, lentils and a glass of milk',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                title: 'Reminder: Try to stay active!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Roast potatoes and kumara',
                icon: Images.spoons,
                subtitle: 'Include: Salad',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                title: 'Reminder: Try to stay active!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Chicken',
                icon: Images.dumble,
                subtitle: 'Include: Broccoli and Quinoa',
              ),
            ],
          ),
          DayModel(name: 'Tuesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oats ',
              icon: Images.spoons,
              subtitle: 'Include: and greek yogurt, quinoa, almonds and milk',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Pasta',
              icon: Images.spoons,
              subtitle: 'Include: Cheese and milk',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Red meat',
              icon: Images.spoons,
              subtitle: 'Include: Rice',
            ),
          ]),
          DayModel(name: 'Wednesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Chicken omlette',
              icon: Images.spoons,
              subtitle: 'Include: Glass of milk / soya milk',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Eggs',
              icon: Images.spoons,
              subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Fish',
              icon: Images.spoons,
              subtitle: 'Include: Kale, chickpeas and avocado',
            ),
          ]),
          DayModel(name: 'Thursday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Eggs any style ',
              icon: Images.spoons,
              subtitle: 'Include: cheese, lentils and a glass of milk',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Lunch: Roast potatoes and kumara',
              icon: Images.spoons,
              subtitle: 'Include: Salad',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Chicken',
              icon: Images.spoons,
              subtitle: 'Include: Broccoli and Quinoa',
            ),
          ]),
          DayModel(name: 'Friday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oats',
              icon: Images.spoons,
              subtitle: 'Include: and greek yogurt, quinoa, almonds and milk',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Pasta',
              icon: Images.spoons,
              subtitle: 'Include: Cheese and milk',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Red meat',
              icon: Images.spoons,
              subtitle: 'Include: Rice',
            ),
          ]),
          DayModel(name: 'Satday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Chicken omlette',
              icon: Images.spoons,
              subtitle: 'Include: Glass of milk / soya milk',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Eggs',
              icon: Images.spoons,
              subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Steak',
              icon: Images.spoons,
              subtitle: 'Include: Broccoli',
            ),
          ]),
          DayModel(
            name: 'sunday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                title: 'Take a brisk run/walk to start your day!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
            ],
          ),
        ],
        description:
            'Gaining is a healthy increase in body weight. This can involve an increase in muscle mass, fat deposits.',
        icons: [
          Images.running_person,
          Images.spoons,
        ]).toMap());
    ref = FirebaseFirestore.instance.collection('plans').doc().id;
    await FirebaseFirestore.instance.collection('plans').doc(ref).set(PlanModel(
        title: 'FITNESS',
        id: ref,
        days: [
          DayModel(
            name: 'Monday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                title: 'Take a brisk run/walk to start your day!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 10).millisecondsSinceEpoch,
                title: 'Reminder: Try to stay active!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
                title: 'Reminder: Try to stay active!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                title: 'Gym: Chest + Shoulders',
                icon: Images.dumble,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Healthy Me Challenge',
                icon: Images.running_person,
                subtitle: '',
              ),
            ],
          ),
          DayModel(name: 'Tuesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Gym: Arms + Abdominals',
              icon: Images.dumble,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Healthy Me Challenge',
              icon: Images.running_person,
              subtitle: '',
            ),
          ]),
          DayModel(name: 'Wednesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Gym: Back + Legs',
              icon: Images.dumble,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Healthy Me Challenge',
              icon: Images.running_person,
              subtitle: '',
            ),
          ]),
          DayModel(name: 'Thursday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Gym: Chest + Shoulders',
              icon: Images.dumble,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Healthy Me Challenge',
              icon: Images.running_person,
              subtitle: '',
            ),
          ]),
          DayModel(name: 'Friday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Gym: Back + Legs',
              icon: Images.dumble,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Healthy Me Challenge',
              icon: Images.running_person,
              subtitle: '',
            ),
          ]),
          DayModel(name: 'Saturday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Take a brisk run/walk to start your day!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 14).millisecondsSinceEpoch,
              title: 'Reminder: Try to stay active!',
              icon: Images.running_person,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
              title: 'Gym: Arms + Abdominals',
              icon: Images.dumble,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Healthy Me Challenge',
              icon: Images.running_person,
              subtitle: '',
            ),
          ]),
          DayModel(
            name: 'sunday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
                title: 'Take a brisk run/walk to start your day!',
                icon: Images.running_person,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 5).millisecondsSinceEpoch,
                title: 'Gym: Optional',
                icon: Images.dumble,
                subtitle: '',
              ),
            ],
          ),
        ],
        description:
            'This program includes overall fitness and can help you achieve cardiorespiratory endurance, muscular strength, endurance, body composition, and flexibility through correct diet and activity.',
        icons: [
          Images.running_person,
          Images.spoons,
        ]).toMap());
    ref = FirebaseFirestore.instance.collection('plans').doc().id;
    await FirebaseFirestore.instance.collection('plans').doc(ref).set(PlanModel(
        title: 'FOOD',
        days: [
          DayModel(
            name: 'Monday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Eggs any style ',
                icon: Images.spoons,
                subtitle: 'Include: a glass of milk',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Salmon',
                icon: Images.spoons,
                subtitle: 'Include: Broccoli, cauliflower and cabbage',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Chicken without the skin',
                icon: Images.spoons,
                subtitle: 'Include: Broccoli and Quinoa',
              ),
            ],
          ),
          DayModel(name: 'Tuesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Green tea',
              icon: Images.spoons,
              subtitle: 'Include: Fruit',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Eggs',
              icon: Images.spoons,
              subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Lean beef',
              icon: Images.spoons,
              subtitle: 'Include: Brussels sprouts',
            ),
          ]),
          DayModel(name: 'Wednesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Smoothie',
              icon: Images.spoons,
              subtitle: 'Include: Vegetables, berries and fruit',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Eggs',
              icon: Images.spoons,
              subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Avocado and salad',
              icon: Images.spoons,
              subtitle: 'Include: Kale and chickpeas',
            ),
          ]),
          DayModel(name: 'Thursday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Coffee',
              icon: Images.spoons,
              subtitle: 'Include: Grapefruit',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Tuna',
              icon: Images.spoons,
              subtitle: 'Include: Ezekiel Bread',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Bean and Vegetable Soup',
              icon: Images.spoons,
              subtitle: 'Include: Black beans',
            ),
          ]),
          DayModel(name: 'Friday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Bananas and greek yoghurt',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Soup',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Chicken',
              icon: Images.spoons,
              subtitle: 'Include: Cayenne pepper and salad',
            ),
          ]),
          DayModel(name: 'Saturday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 6).millisecondsSinceEpoch,
              title: 'Breakfast: Oatmeal',
              icon: Images.spoons,
              subtitle: 'Include: Chia seeds, flax seeds, greek yogurt and nuts',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Soup',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Steak',
              icon: Images.spoons,
              subtitle: 'Include: Broccoli ',
            ),
          ]),
          DayModel(
            name: 'sunday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
            ],
          ),
        ],
        id: ref,
        description:
            'This program includes a healthy and affordable general meal plan that will keep you healthy without having to do specific physical activities',
        icons: [
          Images.spoons,
        ]).toMap());

    ref = FirebaseFirestore.instance.collection('plans').doc().id;
    await FirebaseFirestore.instance.collection('plans').doc(ref).set(PlanModel(
        title: 'VEGAN',
        days: [
          DayModel(
            name: 'Monday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Coconut yogurt',
                icon: Images.spoons,
                subtitle: 'Include: Berries, walnuts, and chia seeds',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Whole-grain pasta ',
                icon: Images.spoons,
                subtitle: 'Include: Lentils and a salad',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Cauliflower and chickpea tacos',
                icon: Images.spoons,
                subtitle: 'Include: Guacamole',
              ),
            ],
          ),
          DayModel(name: 'Tuesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oats',
              icon: Images.spoons,
              subtitle: 'Include: Apple slices, pumpkin seeds, cinnamon, and nut butter',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Sweet potato wedges',
              icon: Images.spoons,
              subtitle: 'Include: Steamed broccoli',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Mediterranean lentil salad',
              icon: Images.spoons,
              subtitle: 'Include: Cucumbers, olives, peppers and sun-dried tomatoes',
            ),
          ]),
          DayModel(name: 'Wednesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: sweet potato toast',
              icon: Images.spoons,
              subtitle: 'Include: Peanut butter and banana',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Salad',
              icon: Images.spoons,
              subtitle: 'Include: Quinoa, avocados, tomatoes, onions, beans, and cilantro',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Baked tofu',
              icon: Images.spoons,
              subtitle: 'Include: Sautéed red cabbage, Brussels sprouts, and couscous',
            ),
          ]),
          DayModel(name: 'Thursday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Coconut yogurt',
              icon: Images.spoons,
              subtitle: 'Include: Berries, walnuts, and chia seeds',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Whole-grain pasta',
              icon: Images.spoons,
              subtitle: 'Include: Lentils and a salad',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Bean salad',
              icon: Images.spoons,
              subtitle: 'Include: Black-eyed peas, tomatoes, corn, bell peppers, and onions',
            ),
          ]),
          DayModel(name: 'Friday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oats',
              icon: Images.spoons,
              subtitle: 'Include: Apple slices, pumpkin seeds, cinnamon, and nut butter',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Sweet potato wedges',
              icon: Images.spoons,
              subtitle: 'Include: Steamed broccoli ',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Lunch: Sweet potato wedges',
              icon: Images.spoons,
              subtitle: 'Include: Steamed broccoli ',
            ),
          ]),
          DayModel(name: 'Saturday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: sweet potato toast ',
              icon: Images.spoons,
              subtitle: 'Include: Peanut butter and banana',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Lunch: Salad',
              icon: Images.spoons,
              subtitle: 'Include: Quinoa, avocados, tomatoes, onions, beans, and cilantro',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Mediterranean lentil salad',
              icon: Images.spoons,
              subtitle: 'Include: Cucumbers, olives, peppers and sun-dried tomatoes',
            ),
          ]),
          DayModel(
            name: 'sunday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
            ],
          ),
        ],
        id: ref,
        description:
            'The vegan meal plan excludes any food derived from animals and no animal products such as eggs or dairy.\nVegan diets are associated with many benefits, including improved heart health, faster short-term weight loss, enhanced blood sugar control, less joint pain, and a decreased risk of cancer.',
        icons: [
          Images.spoons,
        ]).toMap());

    ref = FirebaseFirestore.instance.collection('plans').doc().id;
    await FirebaseFirestore.instance.collection('plans').doc(ref).set(PlanModel(
        title: 'VEGERARIAN',
        days: [
          DayModel(
            name: 'Monday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Coconut yogurt',
                icon: Images.spoons,
                subtitle: 'Include: Berries, walnuts, and chia seeds',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Whole-grain pasta ',
                icon: Images.spoons,
                subtitle: 'Include: Lentils and a salad',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Cauliflower and chickpea tacos',
                icon: Images.spoons,
                subtitle: 'Include: Guacamole',
              ),
            ],
          ),
          DayModel(name: 'Tuesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oatmeal',
              icon: Images.spoons,
              subtitle: 'Include: Fruit and flaxseeds',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch:  Veggie and hummus wrap',
              icon: Images.spoons,
              subtitle: 'Include: Sweet potato fries',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Eggplant parmesan',
              icon: Images.spoons,
              subtitle: 'Include: A side salad',
            ),
          ]),
          DayModel(name: 'Wednesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Scrambled eggs',
              icon: Images.spoons,
              subtitle: 'Include: Tomatoes, garlic and mushrooms',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Zucchini boats',
              icon: Images.spoons,
              subtitle: 'Include: Veggies and feta',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Chickpea curry',
              icon: Images.spoons,
              subtitle: 'Include: Basmati rice',
            ),
          ]),
          DayModel(name: 'Thursday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Greek yogurt',
              icon: Images.spoons,
              subtitle: 'Include: Chia seeds and berries',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Salad',
              icon: Images.spoons,
              subtitle: 'Include: Tomatoes, cucumber and feta with spiced lentil soup',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Flatbread',
              icon: Images.spoons,
              subtitle: 'Include: Grilled garden vegetables and pesto',
            ),
          ]),
          DayModel(name: 'Friday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Coconut yogurt ',
              icon: Images.spoons,
              subtitle: 'Include: Berries, walnuts, and chia seeds',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Burrito bowl',
              icon: Images.spoons,
              subtitle: 'Include: Brown rice, beans, avocado, salsa and veggies',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Cauliflower and chickpea tacos',
              icon: Images.spoons,
              subtitle: 'Include: Guacamole',
            ),
          ]),
          DayModel(name: 'Saturday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oatmeal',
              icon: Images.spoons,
              subtitle: 'Include: Fruit and flaxseeds',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch:  Veggie and hummus wrap',
              icon: Images.spoons,
              subtitle: 'Include: Sweet potato fries',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Eggplant parmesan',
              icon: Images.spoons,
              subtitle: 'Include: A side salad',
            ),
          ]),
          DayModel(
            name: 'sunday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Anything!',
                icon: Images.spoons,
                subtitle: '',
              ),
            ],
          ),
        ],
        id: ref,
        description:
            'The vegetarian meal plan excludes animal meat but includes products derived from animals such as eggs and dairy.',
        icons: [
          Images.spoons,
        ]).toMap());

    ref = FirebaseFirestore.instance.collection('plans').doc().id;
    await FirebaseFirestore.instance.collection('plans').doc(ref).set(PlanModel(
        title: 'PESCATARIAN',
        days: [
          DayModel(
            name: 'Monday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Eggs',
                icon: Images.spoons,
                subtitle: 'Include: Avocado and seasonings',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Salmon salad',
                icon: Images.spoons,
                subtitle: 'Include: Lentils, tomato, spinnach and pumkin seeds',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Cauliflower and chickpea tacos',
                icon: Images.spoons,
                subtitle: 'Include: Guacamole',
              ),
            ],
          ),
          DayModel(name: 'Tuesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Coconut yogurt',
              icon: Images.spoons,
              subtitle: 'Include: Berries, walnuts, and chia seeds',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch:  Veggie and hummus wrap',
              icon: Images.spoons,
              subtitle: 'Include: Sweet potato fries',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Eggplant parmesan',
              icon: Images.spoons,
              subtitle: 'Include: A side salad',
            ),
          ]),
          DayModel(name: 'Wednesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oatmeal',
              icon: Images.spoons,
              subtitle: 'Include: Fruit and flaxseeds',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Salad',
              icon: Images.spoons,
              subtitle: 'Include: Tomatoes, cucumber and feta with spiced lentil soup',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Seafood curry',
              icon: Images.spoons,
              subtitle: 'Include: Basmati rice',
            ),
          ]),
          DayModel(name: 'Thursday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Eggs',
              icon: Images.spoons,
              subtitle: 'Include: Avocado and seasonings',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Tuna sandwich',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Shrimp Salad',
              icon: Images.spoons,
              subtitle: 'Include: Tomatoes, cucumber and feta with spiced lentils',
            ),
          ]),
          DayModel(name: 'Friday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Coconut yogurt',
              icon: Images.spoons,
              subtitle: 'Include: Berries, walnuts, and chia seeds',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Salmon salad',
              icon: Images.spoons,
              subtitle: 'Include: Lentils, tomato, spinnach and pumkin seeds',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Salmon',
              icon: Images.spoons,
              subtitle: 'Include: Smoky spinach and chickpeas',
            ),
          ]),
          DayModel(name: 'Saturday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oatmeal',
              icon: Images.spoons,
              subtitle: 'Include: Fruit and flaxseeds',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch:  Veggie and hummus wrap',
              icon: Images.spoons,
              subtitle: 'Include: Sweet potato fries',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Shrimp Salad',
              icon: Images.spoons,
              subtitle: 'Include: Tomatoes, cucumber and feta with spiced lentils',
            ),
          ]),
          DayModel(
            name: 'sunday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Anything pescatarian!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Anything pescatarian!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Anything pescatarian!',
                icon: Images.spoons,
                subtitle: '',
              ),
            ],
          ),
        ],
        id: ref,
        description:
            'The pescatarian meal plan follows the vegetarian diet as it excludes animal meat but includes fish and all other sea foods.',
        icons: [
          Images.spoons,
        ]).toMap());

    ref = FirebaseFirestore.instance.collection('plans').doc().id;
    await FirebaseFirestore.instance.collection('plans').doc(ref).set(PlanModel(
        title: 'GLUTEN FREE',
        days: [
          DayModel(
            name: 'Monday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Greek yogurt ',
                icon: Images.spoons,
                subtitle: 'Include: vanilla extract with sliced fruits',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Chicken, lentil and veggie soup',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner:  Steak tacos',
                icon: Images.spoons,
                subtitle: 'Include: mushroom and spinach in gluten-free corn tortillas',
              ),
            ],
          ),
          DayModel(name: 'Tuesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Omelet',
              icon: Images.spoons,
              subtitle: 'Include: veggies',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Quinoa salad',
              icon: Images.spoons,
              subtitle: 'Include: Sliced tomatoes, cucumber, spinach and avocado',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Shrimp skewers ',
              icon: Images.spoons,
              subtitle: 'Include: Garden salad',
            ),
          ]),
          DayModel(name: 'Wednesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oatmeal',
              icon: Images.spoons,
              subtitle: 'Include: Berries',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Tuna Salad',
              icon: Images.spoons,
              subtitle: 'Include: Boiled egg',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Chicken and broccoli stir-fry',
              icon: Images.spoons,
              subtitle: 'Include: Rice',
            ),
          ]),
          DayModel(name: 'Thursday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Gluten free toast',
              icon: Images.spoons,
              subtitle: 'Include: Egg and avocado',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Chicken, lentil and veggie soup',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner:  Steak tacos',
              icon: Images.spoons,
              subtitle: 'Include: mushroom and spinach in gluten-free corn tortillas',
            ),
          ]),
          DayModel(name: 'Friday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Omelet',
              icon: Images.spoons,
              subtitle: 'Include: veggies',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Quinoa salad ',
              icon: Images.spoons,
              subtitle: 'Include: Sliced tomatoes, cucumber, spinach and avocado',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Shrimp skewers',
              icon: Images.spoons,
              subtitle: 'Include: Garden salad',
            ),
          ]),
          DayModel(name: 'Saturday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Oatmeal',
              icon: Images.spoons,
              subtitle: 'Include: Berries',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Tuna salad',
              icon: Images.spoons,
              subtitle: 'Include: Boiled egg',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Chicken and broccoli stir-fry',
              icon: Images.spoons,
              subtitle: 'Include: Rice',
            ),
          ]),
          DayModel(
            name: 'sunday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Anything gluten-free!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Anything gluten-free!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Anything gluten-free!',
                icon: Images.spoons,
                subtitle: '',
              ),
            ],
          ),
        ],
        id: ref,
        description:
            'The Gluten free meal plan follows a healthy diet that excludes all gluten and is for people who are intolerant to gluten.',
        icons: [
          Images.spoons,
        ]).toMap());

    ref = FirebaseFirestore.instance.collection('plans').doc().id;
    await FirebaseFirestore.instance.collection('plans').doc(ref).set(PlanModel(
        title: 'KETO',
        days: [
          DayModel(
            name: 'Monday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Eggs',
                icon: Images.spoons,
                subtitle: 'Include: Sautéed greens',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Tuna salad',
                icon: Images.spoons,
                subtitle: 'Include: Celery, tomato and greens',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Beef',
                icon: Images.spoons,
                subtitle: 'Include: Mushrooms, avocado and a salad',
              ),
            ],
          ),
          DayModel(name: 'Tuesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Mushroom omelet',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Green salad',
              icon: Images.spoons,
              subtitle: 'Include: Mushroom and avocado',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Roast chicken',
              icon: Images.spoons,
              subtitle: 'Include: cream sauce and broccoli',
            ),
          ]),
          DayModel(name: 'Wednesday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Stuffed bell pepper',
              icon: Images.spoons,
              subtitle: 'Include: Cheese and eggs',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Arugula salad',
              icon: Images.spoons,
              subtitle: 'Include: Hard-boiled eggs, turkey, avocado and blue cheese',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Grilled Salmon',
              icon: Images.spoons,
              subtitle: 'Include: Spinnach',
            ),
          ]),
          DayModel(name: 'Thursday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Eggs',
              icon: Images.spoons,
              subtitle: 'Include: Sautéed greens',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Tuna salad',
              icon: Images.spoons,
              subtitle: 'Include: Celery, tomato and greens',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Beef',
              icon: Images.spoons,
              subtitle: 'Include: Mushrooms, avocado and a salad',
            ),
          ]),
          DayModel(name: 'Friday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Mushroom omelet',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Green salad',
              icon: Images.spoons,
              subtitle: 'Include: Mushroom and avocado',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Roast chicken',
              icon: Images.spoons,
              subtitle: 'Include: cream sauce and broccoli',
            ),
          ]),
          DayModel(name: 'Saturday', data: [
            DataModel(
              notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
              title: 'Breakfast: Baked avocado egg boats',
              icon: Images.spoons,
              subtitle: '',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
              title: 'Lunch: Caesar salad',
              icon: Images.spoons,
              subtitle: 'Include: Chicken',
            ),
            DataModel(
              notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
              title: 'Dinner: Pork chops',
              icon: Images.spoons,
              subtitle: 'Include: Vegetables',
            ),
          ]),
          DayModel(
            name: 'sunday',
            data: [
              DataModel(
                notification: DateTime(2021, 1, 1, 8).millisecondsSinceEpoch,
                title: 'Breakfast: Anything keto!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 12).millisecondsSinceEpoch,
                title: 'Lunch: Anything keto!',
                icon: Images.spoons,
                subtitle: '',
              ),
              DataModel(
                notification: DateTime(2021, 1, 1, 18).millisecondsSinceEpoch,
                title: 'Dinner: Anything keto!',
                icon: Images.spoons,
                subtitle: '',
              ),
            ],
          ),
        ],
        id: ref,
        description:
            'The Ketogenic diet is a high-fat, adequate protein, low carbohydrate diet. It forces the body to burn fats rather than carbohydrates.',
        icons: [
          Images.spoons,
        ]).toMap());
  }
}
