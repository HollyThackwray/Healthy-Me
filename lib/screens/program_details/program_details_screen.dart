import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/current_plan_model.dart';

import 'package:hollythackwray/models/day_model.dart';
import 'package:hollythackwray/models/plan_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/challenge/challenge_screen.dart';
import 'package:hollythackwray/screens/more_information/bulk_more_information_screen.dart';
import 'package:hollythackwray/screens/more_information/fitness_more_information_screen.dart';
import 'package:hollythackwray/screens/more_information/food_more_information_screen.dart';
import 'package:hollythackwray/screens/more_information/gain_more_information_screen.dart';
import 'package:hollythackwray/screens/more_information/gluten_free_more_information_screen.dart';
import 'package:hollythackwray/screens/more_information/keto_more_information_screen.dart';
import 'package:hollythackwray/screens/more_information/pescetarian_more_information_screen.dart';
import 'package:hollythackwray/screens/more_information/slim_more_information.dart';
import 'package:hollythackwray/screens/more_information/tone_more_information_screen.dart';
import 'package:hollythackwray/screens/more_information/vegan_more_information_screen.dart';
import 'package:hollythackwray/screens/more_information/vegetarian_more_information_screen.dart';
import 'package:provider/provider.dart';

class ProgramDetailsScreen extends StatefulWidget {
  final PlanModel planModel;
  const ProgramDetailsScreen({
    Key? key,
    required this.planModel,
  }) : super(key: key);

  @override
  _ProgramDetailsScreenState createState() => _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState extends State<ProgramDetailsScreen> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<FirebaseProvider>(
      builder: (context, value, child) => PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.lightBlue,
              iconTheme: IconTheme.of(context),
              actions: [
                GestureDetector(
                  onTap: () async {
                    if (value.user!.currentProgram!.any((element) => element!.id == widget.planModel.id)) {
                      await FirebaseFirestore.instance.collection("users").doc(value.user!.userId!).update({
                        "currentProgram": FieldValue.arrayRemove([
                          value
                              .user!
                              .currentProgram![value.user!.currentProgram!
                                  .indexWhere((element) => element!.id == widget.planModel.id)]!
                              .toMap(),
                        ])
                      });
                    } else {
                      await FirebaseFirestore.instance.collection("users").doc(value.user!.userId!).update({
                        "currentProgram": FieldValue.arrayUnion([
                          CurrentPlanModel(id: widget.planModel.id, date: DateTime.now().millisecondsSinceEpoch).toMap()
                        ])
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      value.user!.currentProgram!.any((element) => element!.id == widget.planModel.id)
                          ? 'Remove'
                          : 'Set',
                      style: AppConstants.labelStyle.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
              elevation: 0,
            ),
            body: Transform.scale(
              scale: 1.2,
              child: Container(
                height: size.height * 0.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(300),
                    bottomRight: Radius.circular(300),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    Text(
                      widget.planModel.title,
                      style: AppConstants.toneTextStyle.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.planModel.icons
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Image.asset(
                                  e,
                                  height: 30,
                                  fit: BoxFit.fill,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            )
                            .toList()),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                        });
                      },
                      child: Image.asset(
                        Images.down_arrow,
                        color: Theme.of(context).primaryColor,
                        height: 15,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
          Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                        });
                      },
                      child: Image.asset(
                        Images.up_arrow,
                        color: Theme.of(context).dividerColor,
                        height: 13,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Remember:',
                      style: AppConstants.nameTextStyle.copyWith(
                        color: AppColors.darkerBlueBorder,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Have a glass of water\nbefore and after every meal',
                      style: AppConstants.bulkinDaysTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'It helps you digest your meal and leaves you\nfeeling more full!',
                      style: AppConstants.bulkinDaysTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        widget.planModel.description,
                        style: AppConstants.bulkinDaysTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.info,
                          fit: BoxFit.fill,
                          color: AppColors.darkerBlueBorder,
                          height: 26,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => widget.planModel.title == 'BULK'
                                  ? BulkMoreInformationScreen()
                                  : widget.planModel.title == 'SLIM'
                                      ? SlimMoreInformation()
                                      : widget.planModel.title == 'TONE'
                                          ? ToneMoreInformationScreen()
                                          : widget.planModel.title == 'GAIN'
                                              ? GainMoreInformationScreen()
                                              : widget.planModel.title == 'FITNESS'
                                                  ? FitnessMoreInformationScreen()
                                                  : widget.planModel.title == 'FOOD'
                                                      ? FoodMoreInformationScreen()
                                                      : widget.planModel.title == 'VEGAN'
                                                          ? VeganMoreInformationScreen()
                                                          : widget.planModel.title == 'VEGETARIAN'
                                                              ? VegetarianMoreInformationScreen()
                                                              : widget.planModel.title == 'PESCETARIAN'
                                                                  ? PescetarianMoreInformationScreen()
                                                                  : widget.planModel.title == 'GLUTEN FREE'
                                                                      ? GlutenFreeMoreInformationScreen()
                                                                      : widget.planModel.title == 'KETO'
                                                                          ? KetoMoreInformationScreen()
                                                                          : Container(),
                            );
                          },
                          child: Text(
                            'More information',
                            style: AppConstants.labelStyle.copyWith(
                              color: AppColors.darkerBlueBorder,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: widget.planModel.days
                          .map(
                            (e) => DayRoutineWidget(
                              size: size,
                              day: e,
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DayRoutineWidget extends StatelessWidget {
  const DayRoutineWidget({
    Key? key,
    required this.day,
    required this.size,
  }) : super(key: key);
  final DayModel day;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      margin: EdgeInsets.only(
        bottom: 30,
      ),
      child: Column(
        children: [
          Text(
            day.name!,
            style: AppConstants.labelStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            Images.calender,
            color: Theme.of(context).dividerColor,
            height: 22,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: day.data!
                .map(
                  (e) => Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_right,
                              size: 25,
                              color: AppColors.lightBlackHeading,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Image.asset(
                              e.icon!,
                              height: 22,
                              width: 20,
                              fit: BoxFit.contain,
                              color: AppColors.lightBlackHeading,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (e.title! == 'Healthy Me Challenge') {
                                      Get.to(() => ChallengeScreen());
                                    }
                                  },
                                  child: Text(
                                    e.title!,
                                    style: AppConstants.bulkinDaysTextStyle.copyWith(
                                      color: e.title! == 'Healthy Me Challenge'
                                          ? AppColors.darkerBlueBorder
                                          : Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                                e.subtitle!.isNotEmpty
                                    ? Text(e.subtitle!,
                                        style: AppConstants.bulkinDaysTextStyle.copyWith(
                                          fontSize: 12,
                                        ))
                                    : Container(),
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
