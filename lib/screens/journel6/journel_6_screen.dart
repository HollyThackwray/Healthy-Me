import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class Journel6Scren extends StatelessWidget {
  Journel6Scren({Key? key}) : super(key: key);
  final List<String> clients = [
    'HThack_02',
    'EBaguley',
    'Jamie.Smit',
    'Gym.Bud',
    'Com_Fit',
    'Micheal_88',
  ];
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
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.lightBlue.withOpacity(0.20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Image.asset(
                    Images.pencil_extra_large,
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                TopBannerSubHeadingWidget(
                  size: size,
                  title: 'HEALTHY ME',
                  subTitle: 'JOURNAL',
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0, left: 20, bottom: 30),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Clients: 52',
                        style: AppConstants.buttonTextStyle,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
