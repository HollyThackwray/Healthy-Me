import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/disclaimer/disclaimer_screen.dart';
import 'package:hollythackwray/screens/journel6/journel_6_screen.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class NotPurchasedJournelScreen extends StatefulWidget {
  NotPurchasedJournelScreen({Key? key}) : super(key: key);

  @override
  _NotPurchasedJournelScreenState createState() => _NotPurchasedJournelScreenState();
}

class _NotPurchasedJournelScreenState extends State<NotPurchasedJournelScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.lightBlue,
      //   elevation: 0,
      //   leading: Container(),
      // ),
      body: SingleChildScrollView(
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
              subTitle: 'CHANGE PROGRAM',
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => Journel6Scren());
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
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.dumble,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    Images.running_person,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'BULK',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.running_person,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'SLIM',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.running_person,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'TONE',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'GAIN',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.running_person,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'FITNESS',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'FOOD',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'VEGAN',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'VEGERARIAN',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'PESCATARIAN',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'GLUTEN FREE',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {},
              title: 'KETO',
            ),
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
        ),
      ),
    );
  }
}

class RoundedContainerWidget extends StatelessWidget {
  const RoundedContainerWidget({
    Key? key,
    required this.size,
    required this.top,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final Size size;
  final Widget top;
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        height: size.height * 0.3,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          shape: BoxShape.circle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            top,
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AutoSizeText(
                title,
                maxFontSize: 48,
                minFontSize: 20,
                maxLines: 1,
                style: AppConstants.journelStyle.copyWith(
                  color: Theme.of(context).dividerColor == Colors.black ? AppColors.lightBlackHeading : Colors.white,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View Calendar',
                  style: AppConstants.bulkinDaysTextStyle.copyWith(
                    color: Theme.of(context).dividerColor == Colors.black ? AppColors.lightBlackHeading : Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  Images.forward_arrow,
                  height: 18,
                  color: Theme.of(context).dividerColor == Colors.black ? AppColors.lightBlackHeading : Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
