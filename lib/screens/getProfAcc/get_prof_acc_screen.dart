import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/widgets/button_widget.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class GetProfAccScreen extends StatefulWidget {
  GetProfAccScreen({Key? key}) : super(key: key);

  @override
  _GetProfAccScreenState createState() => _GetProfAccScreenState();
}

class _GetProfAccScreenState extends State<GetProfAccScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBannerSubHeadingWidget(
              size: size,
              title: 'HEALTHY ME',
              subTitle: 'PROFESSIONAL ACCOUNT',
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Which gym do work for?',
                style: AppConstants.buttonTextStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: DropdownButton(
                items: [],
                isExpanded: true,
                hint: Text('Select One'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ButtonWidget(
                size: size,
                onTap: () {},
                title: 'Create',
                isTransparent: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
