import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/plan_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/disclaimer/disclaimer_screen.dart';
import 'package:hollythackwray/screens/journel2/journel_2_screen.dart';
import 'package:hollythackwray/screens/journel6/journel_6_screen.dart';
import 'package:hollythackwray/screens/notPurchasedJournel/not_purchased_journel_screen.dart';
import 'package:hollythackwray/screens/program_details/program_details_screen.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:provider/provider.dart';

class ChangeProgramScreen extends StatelessWidget {
  const ChangeProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<FirebaseProvider>(
      builder: (context, value, child) => Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('plans').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: size.height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.data!.docs.length == 0) {
                return Center(
                  child: Text("No Plans."),
                );
              }
              return ListView(
                children: [
                  Container(
                    height: AppBar().preferredSize.height,
                    width: double.infinity,
                    color: AppColors.lightBlue,
                  ),
                  TopBannerSubHeadingWidget(
                    size: size,
                    isCongo: false,
                    title: 'HEALTHY ME',
                    subTitle: 'CHANGE PROGRAM',
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  value.user!.professionalAccount!
                      ? Container()
                      : GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: size.height * 0.35,
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor == Colors.black
                                  ? AppColors.lightBlackHeading
                                  : Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Images.lock,
                                    height: 49,
                                    width: 49,
                                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AutoSizeText(
                                    'JOURNAL',
                                    maxFontSize: 48,
                                    minFontSize: 30,
                                    style: AppConstants.journelStyle.copyWith(
                                      color: AppColors.lightBlue,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Update',
                                        style: AppConstants.updateStyle.copyWith(
                                          color: AppColors.darkerBlueBorder,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                        Images.forward_arrow,
                                        height: 18,
                                        color: AppColors.darkerBlueBorder,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      value.user!.professionalAccount! ? Get.to(() => Journel6Scren()) : Get.to(() => Journel2Screen());
                    },
                    child: Container(
                      height: size.height * 0.35,
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.pencil_large,
                              height: 49,
                              width: 49,
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              'JOURNAL',
                              maxFontSize: 48,
                              minFontSize: 30,
                              style: AppConstants.journelStyle.copyWith(
                                color: Theme.of(context).dividerColor == Colors.black
                                    ? AppColors.lightBlackHeading
                                    : Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Update',
                                  style: AppConstants.updateStyle.copyWith(
                                    color: Theme.of(context).dividerColor == Colors.black
                                        ? AppColors.lightBlackHeading
                                        : Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  Images.forward_arrow,
                                  height: 18,
                                  color: Theme.of(context).dividerColor == Colors.black
                                      ? AppColors.lightBlackHeading
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                      children: snapshot.data!.docs.map((e) {
                    PlanModel plan = PlanModel.fromMap(e.data() as Map<String, dynamic>);
                    return RoundedContainerWidget(
                        title: plan.title,
                        size: size,
                        top: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: plan.icons
                              .map(
                                (e) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Image.asset(
                                    e,
                                    height: 20,
                                    width: 16,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        onTap: () {
                          Get.to(
                            () => ProgramDetailsScreen(
                              planModel: plan,
                            ),
                          );
                        });
                  }).toList()),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => DisclaimerScreen());
                        },
                        child: Text(
                          'Healthy Me disclaimer',
                          style: AppConstants.bulkinDaysTextStyle.copyWith(color: AppColors.darkerBlueBorder),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            }),
      ),
    );
  }
}
