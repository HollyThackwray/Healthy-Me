import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hollythackwray/models/user_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class Journel8Screen extends StatefulWidget {
  Journel8Screen({Key? key}) : super(key: key);

  @override
  _Journel8ScreenState createState() => _Journel8ScreenState();
}

class _Journel8ScreenState extends State<Journel8Screen> {
  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<FirebaseProvider>(
      builder: (context, value, child) => LoadingOverlay(
        isLoading: value.isLoading,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.lightBlue.withOpacity(0.20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset(
                        Images.pencil_extra_large,
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: AppBar().preferredSize.height,
                      width: double.infinity,
                      color: AppColors.lightBlue,
                    ),
                    TopBannerSubHeadingWidget(
                      size: size,
                      title: 'HEALTHY ME',
                      isCongo: false,
                      subTitle: 'JOURNAL',
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).dividerColor == Colors.black
                              ? AppColors.lightBlackHeading
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CupertinoSearchTextField(
                          itemColor: Theme.of(context).dividerColor,
                          controller: _searchController,
                          placeholder: 'Search With Username',
                          backgroundColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          onChanged: (val) {
                            setState(() {});
                          },
                          placeholderStyle: AppConstants.bulkinDaysTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: _searchController.text.isEmpty
                            ? FirebaseFirestore.instance.collection('users').snapshots()
                            : FirebaseFirestore.instance
                                .collection('users')
                                .where('username', isEqualTo: _searchController.text)
                                .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Container(
                              height: size.height * 0.3,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          if (snapshot.data!.docs.length == 0) {
                            return Center(
                              child: Text("No Users Found.", style: AppConstants.labelStyle),
                            );
                          }
                          return Column(
                            children: snapshot.data!.docs.map((e) {
                              UserModel user = UserModel.fromMap(e.data() as Map<String, dynamic>);
                              return value.user!.userId! == user.userId! || user.trainers!.contains(value.user!.userId!)
                                  ? Container()
                                  : Column(
                                      children: [
                                        Divider(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle, color: AppColors.darkerBlueBorder),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                user.firstName!,
                                                style: AppConstants.buttonTextStyle,
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      value.addTrainer(user.userId!);
                                                    },
                                                    child: Text(
                                                      '+',
                                                      style: AppConstants.buttonTextStyle,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                            }).toList(),
                          );
                        }),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
