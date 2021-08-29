import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';

class TopBannerSubHeadingWidget extends StatelessWidget {
  const TopBannerSubHeadingWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.size,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
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
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      Images.back_arrow,
                      color: Theme.of(context).iconTheme.color,
                      height: 20,
                      width: 20,
                    ),
                  ),
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    Images.back_arrow,
                    color: Colors.transparent,
                    height: 20,
                    width: 20,
                  ),
                )
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
