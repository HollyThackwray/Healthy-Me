import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/gym_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/platform_dialogue.dart';
import 'package:hollythackwray/screens/change_program/change_program_screen.dart';
import 'package:hollythackwray/screens/notPurchasedJournel/not_purchased_journel_screen.dart';
import 'package:hollythackwray/widgets/button_widget.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:provider/provider.dart';

class GetProfAccScreen extends StatefulWidget {
  GetProfAccScreen({Key? key}) : super(key: key);

  @override
  _GetProfAccScreenState createState() => _GetProfAccScreenState();
}

class _GetProfAccScreenState extends State<GetProfAccScreen> {
  GymModel? selectedGym;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<FirebaseProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppBar().preferredSize.height,
                  width: double.infinity,
                  color: AppColors.lightBlue,
                ),
                TopBannerSubHeadingWidget(
                  isCongo: false,
                  size: size,
                  title: 'HEALTHY ME',
                  subTitle: 'PROFESSIONAL ACCOUNT',
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Which gym do work for?',
                    style: AppConstants.buttonTextStyle,
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('gyms').snapshots(),
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
                          child: Text("No Gyms.", style: AppConstants.labelStyle),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: DropdownButton<GymModel>(
                          items: snapshot.data!.docs.map((e) {
                            GymModel gym = GymModel.fromMap(e.data() as Map<String, dynamic>);
                            return DropdownMenuItem<GymModel>(
                                value: gym,
                                child: ListTile(
                                  tileColor: Theme.of(context).primaryColor,
                                  title: Text(
                                    gym.name!,
                                    style: AppConstants.switchProfAccStyle,
                                  ),
                                ));
                          }).toList(),
                          isExpanded: true,
                          hint: Text('Select One'),
                          value: selectedGym,
                          onChanged: (value) {
                            setState(() {
                              selectedGym = value;
                            });
                          },
                        ),
                      );
                    }),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: ButtonWidget(
                    size: size,
                    onTap: () async {
                      if (selectedGym != null) {
                        await FirebaseFirestore.instance.collection('users').doc(value.user!.userId!).update({
                          'professionalAccount': true,
                        });
                        Get.to(() => ChangeProgramScreen());
                      } else
                        showPlatformDialogue(title: 'Please Select a gym');
                    },
                    title: 'Create',
                    isTransparent: false,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
