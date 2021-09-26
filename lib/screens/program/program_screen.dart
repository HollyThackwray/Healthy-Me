import 'package:charts_painter/chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hollythackwray/models/program_model.dart';
import 'package:hollythackwray/models/user_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/journel7/journel_7_screen.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProgramScreen extends StatefulWidget {
  ProgramScreen({
    Key? key,
    required this.programModel,
  }) : super(key: key);
  final ProgramModel programModel;

  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  getTrainersNames() async {
    for (var i = 0; i < widget.programModel.notes.length; i++) {
      var doc = await FirebaseFirestore.instance.collection('users').doc(widget.programModel.notes[i].userId).get();
      UserModel userModel = UserModel.fromMap(doc.data() as Map<String, dynamic>);
      trainerNames.add(userModel.firstName!);
    }
    setState(() {
      isLoading = false;
    });
  }

  List<String> trainerNames = [];
  PanelController _panelController = PanelController();
  int days = 7;
  bool isLoading = true;
  @override
  void initState() {
    getTrainersNames();
    super.initState();
  }

  int notesName = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<FirebaseProvider>(
        builder: (context, value, child) => LoadingOverlay(
          isLoading: isLoading,
          child: SlidingUpPanel(
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
                            if (days == 7 && value.user!.weight!.length > 7)
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
                            if (days == 7 && value.user!.weight!.length > 7)
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
                  value.user!.weight!.length == 0
                      ? Container(
                          height: size.height * 0.25,
                          child: Center(child: Text('No Weight Added')),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20),
                          child: Chart(
                            state: ChartState.bar(
                              ChartData.fromList(
                                days == 7 && value.user!.weight!.length > 7
                                    ? value.user!.weight!.sublist(0, 7).map((e) => BarValue<void>(e)).toList()
                                    : value.user!.weight!.map((e) => BarValue<void>(e)).toList(),
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
                  Column(
                    children: value.user!.programs.notes.map((e) {
                      notesName++;
                      return Column(
                        children: [
                          Text(
                            'Personal Trainer (${trainerNames[notesName]})',
                            style: AppConstants.labelStyle.copyWith(
                              color: AppColors.darkerBlueBorder,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              e.note,
                              style: AppConstants.bulkinDaysTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      );
                    }).toList(),
                  )
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
                        subTitle: value.user!.username!,
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      Center(
                        child: Text(
                          'View Program',
                          style: AppConstants.nameTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Stretches:',
                              style: AppConstants.labelStyle,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: value.user!.programs.streches
                                    .map((e) => Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                left: 10,
                                              ),
                                              child: Text(
                                                e.name!,
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
                                                    'Held for ${e.duration!} seconds, ${e.reps} Times',
                                                    style: AppConstants.bulkinDaysTextStyle.copyWith(
                                                      color: AppColors.darkerBlueBorder,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ))
                                    .toList()),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Exercises:',
                              style: AppConstants.labelStyle,
                            ),
                            // SizedBox(
                            //   height: 40,
                            // ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: value.user!.programs.exercises
                                    .map(
                                      (e) => ExcersizeBlockWidget(
                                        excersize: e.name!,
                                        sets: e.sets.toString(),
                                        size: size,
                                        reps: e.reps!.toString(),
                                        notes: e.notes!,
                                      ),
                                    )
                                    .toList()),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
