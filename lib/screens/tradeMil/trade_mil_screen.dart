import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:hollythackwray/models/user_program_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/congratulations/congratulations_screen.dart';
import 'package:hollythackwray/widgets/button_widget.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class TradeMilScreen extends StatefulWidget {
  TradeMilScreen({
    Key? key,
    required this.type,
    required this.userProgramModel,
  }) : super(key: key);
  final String type;
  final UserProgramModel userProgramModel;
  @override
  _TradeMilScreenState createState() => _TradeMilScreenState();
}

class _TradeMilScreenState extends State<TradeMilScreen> {
  TextEditingController _setsController = TextEditingController();
  TextEditingController _repsController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  Duration? pickedTime = Duration();
  late UserProgramModel userProgramModel;
  @override
  void initState() {
    super.initState();
    userProgramModel = widget.userProgramModel;
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Consumer<FirebaseProvider>(
        builder: (context, value, child) => SingleChildScrollView(
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
                isCongo: false,
                subTitle: 'HThack_02',
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              Text(
                'TREDMILL',
                style: AppConstants.nameTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                Images.running_person,
                height: 44,
                fit: BoxFit.fill,
                color: AppColors.lightBlue,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Sets: ',
                          style: AppConstants.updateStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Reps: ',
                          style: AppConstants.updateStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Duration: ',
                          style: AppConstants.updateStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Notes: ',
                          style: AppConstants.updateStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              )),
                          child: Center(
                            child: TextField(
                              maxLines: 1,
                              controller: _setsController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: '0',
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              )),
                          child: Center(
                            child: TextField(
                              maxLines: 1,
                              controller: _repsController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: '0',
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              )),
                          child: Center(
                            child: TextField(
                              maxLines: 1,
                              onTap: () async {
                                pickedTime = await showDurationPicker(
                                  context: context,
                                  initialTime: Duration(minutes: 30),
                                );
                                setState(() {
                                  _durationController.text = pickedTime.toString().substring(0, 8);
                                });
                              },
                              textAlign: TextAlign.center,
                              controller: _durationController,
                              decoration: InputDecoration(
                                hintText: '00.00',
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              )),
                          child: Center(
                            child: TextField(
                              controller: _notesController,
                              maxLines: 5,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                  size: size,
                  onTap: () async {
                    if (await value.addNewExcercise(widget.type, userProgramModel)) {}
                    Get.to(() => CongratulationsScreen());
                  },
                  title: 'Contine',
                  isTransparent: false),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
