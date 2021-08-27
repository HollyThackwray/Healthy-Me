import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';

class HealthMeMainScreen extends StatelessWidget {
  const HealthMeMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        elevation: 0,
      ),
    );
  }
}