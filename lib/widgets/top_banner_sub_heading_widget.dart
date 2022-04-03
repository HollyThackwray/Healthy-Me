import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';

class TopBannerSubHeadingWidget extends StatelessWidget {
  const TopBannerSubHeadingWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.size,
    this.afterGym,
    required this.isCongo,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final Size size;
  final bool? afterGym;
  final bool isCongo;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isCongo
            ? Container()
            : Transform.scale(
                scale: 1.7,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.38,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(size.width),
                      bottomRight: Radius.circular(size.width),
                    ),
                  ),
                ),
              ),
        Column(
          children: [
            Center(
              child: SizedBox(
                height: 15,
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Container(
              color: AppColors.lightBlue,
              child: Center(
                child: Text(
                  title,
                  style: AppConstants.topBarTextStyle.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 15,
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (afterGym != null) {
                      Get.back();
                      Get.back();
                      Get.back();
                    }
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                  color: Theme.of(context).iconTheme.color,
                ),
                Expanded(
                  child: Text(
                    subTitle,
                    style: AppConstants.labelStyle.copyWith(
                      color: Theme.of(context).primaryColor,
                      // fontSize: 34,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                    color: Colors.transparent),
              ],
            ),
            Center(
              child: SizedBox(
                height: 5,
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
