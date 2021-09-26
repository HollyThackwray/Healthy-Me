import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/screens/tradeMil/trade_mil_screen.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightBlackHeading,
      body: Column(
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
            subTitle: 'SCAN',
          ),
          SizedBox(
            height: size.height * 0.2,
          ),
          GestureDetector(
            onTap: () {
              // Get.to(() => TradeMilScreen());
            },
            child: Text(
              'Scanning',
              style: AppConstants.labelStyle.copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
