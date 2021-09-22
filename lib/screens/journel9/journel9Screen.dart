import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/screens/journel7/journel_7_screen.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

import 'package:hollythackwray/models/user_model.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class Journel9Screen extends StatefulWidget {
  final UserModel userModel;
  Journel9Screen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  _Journel9ScreenState createState() => _Journel9ScreenState();
}

class _Journel9ScreenState extends State<Journel9Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController _scrollController = ScrollController();
    return Scaffold(
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
                  subTitle: widget.userModel.username!,
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
                            _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                          });
                        },
                        child: Image.asset(
                          Images.up_arrow,
                          color: Theme.of(context).dividerColor,
                          height: 13,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                          child: GestureDetector(
                        child: Text(
                          'Edit Program',
                          style: AppConstants.nameTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: PagedVerticalCalendar(
                          dayBuilder: (context, date) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => Journel7Screen(
                                    date: date,
                                    userModel: widget.userModel,
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.darkerBlueBorder,
                                    ),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      date.day.toString(),
                                    ),
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
      ),
    );
  }
}
