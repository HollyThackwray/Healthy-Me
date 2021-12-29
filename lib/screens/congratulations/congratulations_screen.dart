import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/screens/change_program/change_program_screen.dart';
import 'package:hollythackwray/widgets/button_widget.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

class CongratulationsScreen extends StatefulWidget {
  CongratulationsScreen({Key? key}) : super(key: key);

  @override
  _CongratulationsScreenState createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  playAudio() {
    final player = AudioPlayer();
    player.setAsset('assets/sound/Done.wav');
    player.play();
  }

  @override
  void initState() {
    playAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              isCongo: true,
              subTitle: 'HThack_02',
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              'CONGRATULATIONS',
              style: AppConstants.buttonTextStyle.copyWith(
                color: AppColors.greenColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You have completed this\nexercise for today!',
              style: AppConstants.bulkinDaysTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Lottie.asset(
              'assets/images/tick.json',
              repeat: false,
              fit: BoxFit.fill,
              height: 250,
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
                size: size,
                onTap: () {
                  Get.back();
                  Get.back();
                  Get.back();
                  Get.back();
                },
                title: 'Contine',
                isTransparent: false),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
