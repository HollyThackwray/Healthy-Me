import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:hollythackwray/widgets/top_banner_widget.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        elevation: 0,
        leading: Container(),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Image.asset(
                Images.setting,
                color: AppColors.lightBlue.withOpacity(0.20),
                height: 150,
                width: 150,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                TopBannerSubHeadingWidget(
                  size: size,
                  title: 'HEALTHY ME',
                  subTitle: 'SETTINGS',
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
                Container(
                  height: 177,
                  width: 177,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Images.me,
                      ),
                      fit: BoxFit.contain,
                    ),
                    border: Border.all(
                      color: AppColors.lightBlue,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Holly Thackwray',
                  style: AppConstants.nameTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
