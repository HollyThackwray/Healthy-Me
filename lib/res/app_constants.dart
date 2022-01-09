import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
String printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}
class AppConstants {
  static TextStyle topBarTextStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w300,
  );
  static TextStyle forgetPassTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: AppColors.darkerBlueBorder,
  );

  static TextStyle buttonTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w300,
  );

  static TextStyle nameTextStyle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w300,
  );

  static TextStyle bulkinDaysTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w300,
  );

  static TextStyle toneTextStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w300,
  );
  static TextStyle labelStyle = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w300,
  );

  static TextStyle switchProfAccStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );
  static TextStyle updateStyle = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w300,
  );
  static TextStyle moreInfo = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
  static TextStyle journelStyle = TextStyle(
    fontSize: 48,
  );
}
