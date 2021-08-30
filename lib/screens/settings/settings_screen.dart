import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/getProfAcc/get_prof_acc_screen.dart';
import 'package:hollythackwray/screens/login/login_screen.dart';
import 'package:hollythackwray/widgets/custom_text_form_field_widget.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController _userNameController = TextEditingController();
  bool switchVal = false;
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                    Images.settings_large,
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: CustomTextField(
                      obs: false,
                      showForgetPass: false,
                      label: 'Change Username',
                      hint: 'John.Smith',
                      controller: _userNameController,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: CustomTextField(
                      obs: false,
                      showForgetPass: false,
                      label: 'Change Email',
                      hint: 'John.Smith@gmail.com',
                      controller: _emailController,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Change Password',
                              style: AppConstants.labelStyle,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'John.smith@gmail.com',
                              style: AppConstants.bulkinDaysTextStyle,
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.lightBlue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Send',
                                  style: AppConstants.bulkinDaysTextStyle.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  Images.forward_arrow,
                                  height: 15,
                                  width: 15,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(thickness: 1, color: Theme.of(context).dividerColor),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Row(
                      children: [
                        Text(
                          'Switch to Professional Account',
                          style: AppConstants.switchProfAccStyle,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => GetProfAccScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightBlue,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                              child: Image.asset(
                                Images.forward_arrow,
                                height: 15,
                                width: 15,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Notifications',
                          style: AppConstants.switchProfAccStyle,
                        ),
                        Spacer(),
                        CupertinoSwitch(
                          value: switchVal,
                          onChanged: (val) {
                            setState(() {
                              switchVal = val;
                            });
                          },
                          activeColor: AppColors.lightBlue,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => LoginScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.lightBlue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35),
                        child: Text('Sign-Out', style: AppConstants.labelStyle),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
