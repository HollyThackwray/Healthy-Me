import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/journel8/journel_8_screen.dart';
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
                Container(
                  height: AppBar().preferredSize.height,
                  width: double.infinity,
                  color: AppColors.lightBlue,
                ),
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => Journel8Screen());
                      },
                      child: Text(
                        '+',
                        style: AppConstants.buttonTextStyle,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: clients
                      .map(
                        (e) => Column(
                          children: [
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle, color: AppColors.darkerBlueBorder),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    e,
                                    style: AppConstants.buttonTextStyle,
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors.lightBlue,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 40, top: 10, bottom: 10, right: 10),
                                      child: Image.asset(
                                        Images.forward_arrow,
                                        height: 12,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
