import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class MoreInformationScreen extends StatelessWidget {
  const MoreInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        elevation: 0,
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBannerSubHeadingWidget(
              size: size,
              title: 'HEALTHY ME',
              subTitle: 'INFORMATION',
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
