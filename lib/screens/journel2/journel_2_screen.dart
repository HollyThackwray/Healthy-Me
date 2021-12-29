import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/user_program_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/journel7/journel_7_screen.dart';
import 'package:hollythackwray/screens/program/program_screen.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:provider/provider.dart';

class Journel2Screen extends StatefulWidget {
  Journel2Screen({Key? key}) : super(key: key);

  @override
  _Journel2ScreenState createState() => _Journel2ScreenState();
}

class _Journel2ScreenState extends State<Journel2Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController _scrollController = ScrollController();
    return Scaffold(
      body: Consumer<FirebaseProvider>(
        builder: (context, value, child) => StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('userPrograms')
              .where('userId', isEqualTo: value.user!.userId)
              .snapshots(),
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
            List<UserProgramModel> userPrograms =
                snapshot.data!.docs.map((e) => UserProgramModel.fromMap(e.data() as Map<String, dynamic>)).toList();
            return Stack(
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
                  controller: _scrollController,
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
                        height: size.height * 0.85,
                        width: double.infinity,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _scrollController.animateTo(0,
                                      duration: Duration(milliseconds: 300), curve: Curves.easeIn);
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
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ProgramScreen(programModel: value.user!.programs));
                              },
                              child: Text(
                                'View Program',
                                style: AppConstants.buttonTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              child: PagedVerticalCalendar(
                                dayBuilder: (context, date) {
                                  UserProgramModel today = getToday(date, userPrograms);
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => Journel7Screen(
                                            date: date,
                                            userModel: value.user!,
                                            userProgramModel: getToday(date, userPrograms)),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.darkerBlueBorder,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              date.day.toString(),
                                              maxLines: 1,
                                            ),
                                            if (today.professionalUpdate ?? false)
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColors.darkerBlueBorder,
                                                  ),
                                                  shape: BoxShape.circle,
                                                  color: AppColors.darkerBlueBorder,
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  UserProgramModel getToday(DateTime date, List<UserProgramModel> programs) {
    print(date);
    if (programs.any((element) =>
        DateTime.fromMillisecondsSinceEpoch(element.date).day == date.day &&
        DateTime.fromMillisecondsSinceEpoch(element.date).month == date.month &&
        DateTime.fromMillisecondsSinceEpoch(element.date).year == date.year)) {
      return programs[programs.indexWhere((element) =>
          DateTime.fromMillisecondsSinceEpoch(element.date).day == date.day &&
          DateTime.fromMillisecondsSinceEpoch(element.date).month == date.month &&
          DateTime.fromMillisecondsSinceEpoch(element.date).year == date.year)];
    } else {
      return UserProgramModel(
          exercises: [],
          myNotes: [],
          streches: [],
          userId: '',
          notes: [],
          programId: '',
          date: DateTime(2020).millisecondsSinceEpoch);
    }
  }
}
