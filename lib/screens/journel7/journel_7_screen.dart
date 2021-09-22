import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:hollythackwray/models/user_model.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/scan/scan_screen.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class Journel7Screen extends StatefulWidget {
  Journel7Screen({
    Key? key,
    required this.date,
    this.userModel,
  }) : super(key: key);
  final DateTime date;
  final UserModel? userModel;

  @override
  _Journel7ScreenState createState() => _Journel7ScreenState();
}

class _Journel7ScreenState extends State<Journel7Screen> {
  PanelController _panelController = PanelController();
  int days = 7;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        controller: _panelController,
        panel: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _panelController.close();
                  });
                },
                child: Image.asset(
                  Images.up_arrow,
                  color: Theme.of(context).dividerColor,
                  height: 30,
                  width: 30,
                ),
              ),
              Text('Notes', style: AppConstants.nameTextStyle.copyWith(color: AppColors.darkerBlueBorder)),
              SizedBox(height: 30),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (days == 7 && widget.userModel!.weight!.length > 7)
                          days = 100;
                        else
                          days = 7;
                      });
                    },
                    child: Image.asset(
                      Images.back_arrow,
                      color: Theme.of(context).dividerColor,
                      height: 30,
                      width: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$days Days',
                    style: AppConstants.labelStyle,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (days == 7 && widget.userModel!.weight!.length > 7)
                          days = 100;
                        else
                          days = 7;
                      });
                    },
                    child: Image.asset(
                      Images.forward_arrow,
                      color: Theme.of(context).dividerColor,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Chart(
                  state: ChartState.bar(
                    ChartData.fromList(
                      days == 7 && widget.userModel!.weight!.length > 7
                          ? widget.userModel!.weight!.sublist(0, 7).map((e) => BarValue<void>(e)).toList()
                          : widget.userModel!.weight!.map((e) => BarValue<void>(e)).toList(),
                    ),
                    foregroundDecorations: [
                      BorderDecoration(color: AppColors.lightBlue, borderWidth: 0, endWithChart: false),
                    ],
                    backgroundDecorations: [
                      GridDecoration(
                        showHorizontalValues: true,
                        textStyle: AppConstants.labelStyle.copyWith(
                          fontSize: 10,
                          color: Theme.of(context).dividerColor,
                        ),
                        horizontalAxisValueFromValue: (value) {
                          if (value % 10 == 0) {
                            return value.toString();
                          }
                          return '';
                        },
                        horizontalLegendPosition: HorizontalLegendPosition.start,
                        horizontalValuesPadding: EdgeInsets.only(right: 10),
                        gridColor: Colors.transparent,
                      ),
                      BorderDecoration(
                        color: Colors.transparent,
                        borderWidth: 0,
                      ),
                    ],
                    itemOptions: BarItemOptions(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      radius: BorderRadius.circular(40),
                      color: AppColors.lightBlue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Personal Trainer (Micheal)',
                style: AppConstants.labelStyle.copyWith(
                  color: AppColors.darkerBlueBorder,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Great job so far! Keep doing that for the next week, but add lunges - 3 reps of 10 sets. Then next week, add another set to each exercise.',
                  style: AppConstants.bulkinDaysTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Physiotherapist (Robin)',
                style: AppConstants.labelStyle.copyWith(
                  color: AppColors.darkerBlueBorder,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Add an ankle and hamstring stretch to your routine to help with your leg pain.',
                  style: AppConstants.bulkinDaysTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        maxHeight: size.height * 0.85,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        collapsed: Container(
          child: Column(
            children: [
              Image.asset(
                Images.up_arrow,
                color: Theme.of(context).dividerColor,
                height: 30,
                width: 30,
              ),
              Text('Notes', style: AppConstants.nameTextStyle.copyWith(color: AppColors.darkerBlueBorder))
            ],
          ),
        ),
        isDraggable: true,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
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
                    isCongo: false,
                    title: 'HEALTHY ME',
                    subTitle: DateFormat.MMMM().format(widget.date),
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ScanScreen());
                            },
                            child: Image.asset(
                              Images.qr_code,
                              color: AppColors.darkerBlueBorder,
                              height: 21,
                              width: 21,
                            ),
                          ),
                          Text(
                            'Log in',
                            style: AppConstants.bulkinDaysTextStyle.copyWith(
                              color: AppColors.darkerBlueBorder,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    DateFormat.MMMM().format(widget.date) + '\n' + DateFormat.d().format(widget.date),
                    style: AppConstants.labelStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DisplayRow(
                          title: 'Weight:',
                          des: '55',
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Stretches:',
                          style: AppConstants.labelStyle,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            'Lunge with Spinal twist',
                            style: AppConstants.labelStyle.copyWith(
                              color: AppColors.darkerBlueBorder,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Row(
                            children: [
                              Text('Duration:', style: AppConstants.bulkinDaysTextStyle),
                              Text(
                                'Held for 30 seconds, twice',
                                style: AppConstants.bulkinDaysTextStyle.copyWith(
                                  color: AppColors.darkerBlueBorder,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 20,
                          ),
                          child: Text(
                            'Triceps stretch',
                            style: AppConstants.labelStyle.copyWith(
                              color: AppColors.darkerBlueBorder,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 30),
                          child: Row(
                            children: [
                              Text('Duration:', style: AppConstants.bulkinDaysTextStyle),
                              Text(
                                'Held for 30 seconds, twice',
                                style: AppConstants.bulkinDaysTextStyle.copyWith(
                                  color: AppColors.darkerBlueBorder,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '+ Stretch',
                          style: AppConstants.bulkinDaysTextStyle.copyWith(
                            color: AppColors.darkerBlueBorder,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              'Exercises',
                              style: AppConstants.labelStyle,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Image.asset(
                              Images.qr_code,
                              color: AppColors.darkerBlueBorder,
                              height: 21,
                              width: 21,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '+ Exercises',
                          style: AppConstants.bulkinDaysTextStyle.copyWith(color: AppColors.darkerBlueBorder),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ExcersizeBlockWidget(
                          excersize: 'Push-ups',
                          sets: '3',
                          size: size,
                          reps: '15',
                          notes: 'I got tired after 2 sets, and had a  longer break than usual.',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExcersizeBlockWidget extends StatelessWidget {
  const ExcersizeBlockWidget({
    Key? key,
    required this.excersize,
    required this.sets,
    required this.reps,
    required this.size,
    required this.notes,
  }) : super(key: key);
  final String excersize;
  final String sets;
  final String reps;
  final Size size;
  final String notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.6,
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Exercise:  ',
                style: AppConstants.labelStyle,
              ),
              Text(
                'Sets:  ',
                style: AppConstants.labelStyle,
              ),
              Text(
                'Reps:  ',
                style: AppConstants.labelStyle,
              ),
              Text(
                'Notes:  ',
                style: AppConstants.labelStyle,
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  excersize,
                  style: AppConstants.labelStyle.copyWith(color: AppColors.darkerBlueBorder),
                ),
                Text(
                  sets,
                  style: AppConstants.labelStyle.copyWith(color: AppColors.darkerBlueBorder),
                ),
                Text(
                  reps,
                  style: AppConstants.labelStyle.copyWith(color: AppColors.darkerBlueBorder),
                ),
                Text(
                  notes,
                  style: AppConstants.labelStyle.copyWith(color: AppColors.darkerBlueBorder),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DisplayRow extends StatelessWidget {
  const DisplayRow({
    Key? key,
    required this.title,
    required this.des,
  }) : super(key: key);
  final String title;
  final String des;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppConstants.labelStyle,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          des,
          style: AppConstants.labelStyle.copyWith(color: AppColors.lightBlue),
        )
      ],
    );
  }
}
