import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import 'package:hollythackwray/models/user_model.dart';
import 'package:hollythackwray/models/user_program_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/scan/scan_screen.dart';
import 'package:hollythackwray/screens/tradeMil/trade_mil_screen.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class Journel7Screen extends StatefulWidget {
  Journel7Screen({
    Key? key,
    required this.date,
    required this.userModel,
    required this.userProgramModel,
  }) : super(key: key);
  final DateTime date;
  final UserModel? userModel;
  final UserProgramModel userProgramModel;

  @override
  _Journel7ScreenState createState() => _Journel7ScreenState();
}

class _Journel7ScreenState extends State<Journel7Screen> {
  getTrainersNames() async {
    for (var i = 0; i < widget.userModel!.programs.notes.length; i++) {
      var doc =
          await FirebaseFirestore.instance.collection('users').doc(widget.userModel!.programs.notes[i].userId).get();
      UserModel userModel = UserModel.fromMap(doc.data() as Map<String, dynamic>);
      trainerNames.add(userModel.firstName!);
    }
    FirebaseFirestore.instance.collection("users").doc(widget.userModel!.userId).snapshots().listen((document) {
      print("USER STREAM WMITTING VALUE");
      if (document.exists) {
        userStream = UserModel.fromMap(document.data()!);
        print("NOTIFTING LISTENERS");
        setState(() {
          initialLoading = false;
        });
      }
    });
  }

  getUserStream() {}
  UserModel? userStream;
  int notesName = 0;
  @override
  void initState() {
    getTrainersNames();
    super.initState();
  }

  bool isLoading = false;
  List<String> trainerNames = [];
  TextEditingController _weightController = TextEditingController();
  // PanelController _panelController = PanelController();
  updateWeight(double weight) async {
    setState(() {
      isLoading = true;
    });
    await FirebaseFirestore.instance.collection('users').doc(userStream!.userId).update({
      'weight': FieldValue.arrayUnion([weight]),
    });
    setState(() {
      isLoading = false;
    });
  }

  bool initialLoading = true;
  int days = 7;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return initialLoading
        ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Center(child: CircularProgressIndicator()),
          )
        : LoadingOverlay(
            isLoading: isLoading,
            child: Scaffold(
              // body: SlidingUpPanel(
              //   controller: _panelController,
              //   panel: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         GestureDetector(
              //           onTap: () {
              //             setState(() {
              //               _panelController.close();
              //             });
              //           },
              //           child: Image.asset(
              //             Images.up_arrow,
              //             color: Theme.of(context).dividerColor,
              //             height: 30,
              //             width: 30,
              //           ),
              //         ),
              //         Text('Notes', style: AppConstants.nameTextStyle.copyWith(color: AppColors.darkerBlueBorder)),
              //         SizedBox(height: 30),
              //         Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             GestureDetector(
              //               onTap: () {
              //                 setState(() {
              //                   if (days == 7 && widget.userModel!.weight!.length > 7)
              //                     days = 100;
              //                   else
              //                     days = 7;
              //                 });
              //               },
              //               child: Image.asset(
              //                 Images.back_arrow,
              //                 color: Theme.of(context).dividerColor,
              //                 height: 30,
              //                 width: 30,
              //               ),
              //             ),
              //             SizedBox(
              //               width: 10,
              //             ),
              //             Text(
              //               '$days Days',
              //               style: AppConstants.labelStyle,
              //             ),
              //             SizedBox(
              //               width: 10,
              //             ),
              //             GestureDetector(
              //               onTap: () {
              //                 setState(() {
              //                   if (days == 7 && widget.userModel!.weight!.length > 7)
              //                     days = 100;
              //                   else
              //                     days = 7;
              //                 });
              //               },
              //               child: Image.asset(
              //                 Images.forward_arrow,
              //                 color: Theme.of(context).dividerColor,
              //                 height: 30,
              //                 width: 30,
              //               ),
              //             ),
              //           ],
              //         ),
              //         widget.userModel!.weight!.length == 0
              //             ? Container(
              //                 height: size.height * 0.25,
              //                 child: Center(child: Text('No Weight Added')),
              //               )
              //             : Padding(
              //                 padding: const EdgeInsets.all(20),
              //                 child: Chart(
              //                   state: ChartState.bar(
              //                     ChartData.fromList(
              //                       days == 7 && widget.userModel!.weight!.length > 7
              //                           ? widget.userModel!.weight!.sublist(0, 7).map((e) => BarValue<void>(e)).toList()
              //                           : widget.userModel!.weight!.map((e) => BarValue<void>(e)).toList(),
              //                     ),
              //                     foregroundDecorations: [
              //                       BorderDecoration(color: AppColors.lightBlue, borderWidth: 0, endWithChart: false),
              //                     ],
              //                     backgroundDecorations: [
              //                       GridDecoration(
              //                         showHorizontalValues: true,
              //                         textStyle: AppConstants.labelStyle.copyWith(
              //                           fontSize: 10,
              //                           color: Theme.of(context).dividerColor,
              //                         ),
              //                         horizontalAxisValueFromValue: (value) {
              //                           if (value % 10 == 0) {
              //                             return value.toString();
              //                           }
              //                           return '';
              //                         },
              //                         horizontalLegendPosition: HorizontalLegendPosition.start,
              //                         horizontalValuesPadding: EdgeInsets.only(right: 10),
              //                         gridColor: Colors.transparent,
              //                       ),
              //                       BorderDecoration(
              //                         color: Colors.transparent,
              //                         borderWidth: 0,
              //                       ),
              //                     ],
              //                     itemOptions: BarItemOptions(
              //                       padding: const EdgeInsets.symmetric(horizontal: 2.0),
              //                       radius: BorderRadius.circular(40),
              //                       color: AppColors.lightBlue,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //         SizedBox(
              //           height: 30,
              //         ),
              //         Column(
              //           children: widget.userModel!.programs.notes.map((e) {
              //             notesName++;
              //             return Column(
              //               children: [
              //                 Text(
              //                   'Personal Trainer (${trainerNames[notesName]})',
              //                   style: AppConstants.labelStyle.copyWith(
              //                     color: AppColors.darkerBlueBorder,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(20),
              //                   child: Text(
              //                     e.note,
              //                     style: AppConstants.bulkinDaysTextStyle,
              //                     textAlign: TextAlign.center,
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   height: 30,
              //                 ),
              //               ],
              //             );
              //           }).toList(),
              //         ),
              //         SizedBox(
              //           height: 30,
              //         ),
              //       ],
              //     ),
              //   ),
              //   maxHeight: size.height * 0.85,
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.withOpacity(0.5),
              //       spreadRadius: 5,
              //       blurRadius: 7,
              //       offset: Offset(0, 3),
              //     ),
              //   ],
              //   collapsed: Container(
              //     child: Column(
              //       children: [
              //         Image.asset(
              //           Images.up_arrow,
              //           color: Theme.of(context).dividerColor,
              //           height: 30,
              //           width: 30,
              //         ),
              //         Text('Notes', style: AppConstants.nameTextStyle.copyWith(color: AppColors.darkerBlueBorder))
              //       ],
              //     ),
              //   ),
              //   isDraggable: true,
              //   borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
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
                                  child: Icon(
                                    Icons.qr_code_scanner,
                                    // Images.setting,
                                    size: 25,
                                    color: AppColors.darkerBlueBorder,
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
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              )),
                          child: Center(
                            child: TextFormField(
                              controller: _weightController,
                              maxLines: 1,
                              onFieldSubmitted: (newValue) {
                                if (newValue.isNotEmpty) {
                                  if (newValue.isNotEmpty) {
                                    updateWeight(double.parse(newValue));
                                  }
                                }
                              },
                              // initialValue: (value.user?.weight?.length ?? 0) == 0
                              //     ? null
                              //     : value.user?.weight?.last.toString() ?? null,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: (userStream?.weight?.length ?? 0) == 0
                                    ? 'Weight'
                                    : userStream?.weight?.last.toString() ?? 'Weight',
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Weight: ',
                                    style: AppConstants.labelStyle,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    userStream!.weight!.length == 0 ? '0.0' : userStream!.weight!.last.toString(),
                                    style: AppConstants.labelStyle.copyWith(color: AppColors.lightBlue),
                                  )
                                ],
                              ),
                              SizedBox(height: 30),
                              Text(
                                'Stretches:',
                                style: AppConstants.labelStyle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => TradeMilScreen(type: 'Stretch', userProgramModel: widget.userProgramModel));
                                },
                                child: Text(
                                  '+ Stretches',
                                  style: AppConstants.bulkinDaysTextStyle.copyWith(color: AppColors.darkerBlueBorder),
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: widget.userProgramModel.streches
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Duration:', style: AppConstants.bulkinDaysTextStyle),
                                                    Text(
                                                      'Held for ${printDuration(Duration(seconds: e.duration ?? 0))} \n${e.reps} Reps\n${e.sets} Sets',
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
                              Row(
                                children: [
                                  Text(
                                    'Exercises',
                                    style: AppConstants.labelStyle,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => ScanScreen());
                                    },
                                    child: Icon(
                                      Icons.qr_code_scanner,
                                      // Images.setting,
                                      size: 25,
                                      color: AppColors.darkerBlueBorder,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      TradeMilScreen(type: 'Exercise', userProgramModel: widget.userProgramModel));
                                },
                                child: Text(
                                  '+ Exercises',
                                  style: AppConstants.bulkinDaysTextStyle.copyWith(color: AppColors.darkerBlueBorder),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: widget.userProgramModel.exercises
                                      .map(
                                        (e) => ExcersizeBlockWidget(
                                          excersize: e.name!,
                                          sets: e.sets.toString(),
                                          duration: e.duration ?? 0,
                                          size: size,
                                          reps: e.reps!.toString(),
                                          notes: e.notes!,
                                        ),
                                      )
                                      .toList()),
                              SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // ),
            ),
          );
  }
}

class ExcersizeBlockWidget extends StatelessWidget {
  const ExcersizeBlockWidget({
    Key? key,
    required this.excersize,
    required this.sets,
    required this.duration,
    required this.reps,
    required this.size,
    required this.notes,
  }) : super(key: key);
  final String excersize;
  final String sets;
  final int duration;
  final String reps;
  final Size size;
  final String notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Text('Duration:  ', style: AppConstants.labelStyle),
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
                Text('${printDuration(Duration(seconds: duration))}',
                    style: AppConstants.labelStyle.copyWith(color: AppColors.darkerBlueBorder)),
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
