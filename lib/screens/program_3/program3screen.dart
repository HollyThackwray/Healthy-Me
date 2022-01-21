import 'package:charts_painter/chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/exercise_model.dart';
import 'package:hollythackwray/models/notes_model.dart';
import 'package:hollythackwray/models/strech_model.dart';
import 'package:hollythackwray/models/user_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/add_exercise/add_exercise_screen.dart';
import 'package:hollythackwray/screens/add_stretch/add_strech_screen.dart';
import 'package:hollythackwray/screens/journel7/journel_7_screen.dart';
import 'package:hollythackwray/widgets/button_widget.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Program3screen extends StatefulWidget {
  final UserModel userModel;
  Program3screen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  _Program3screenState createState() => _Program3screenState();
}

class _Program3screenState extends State<Program3screen> {
  List<StrechModel> newStreches = [];
  List<ExerciseModel> newExercises = [];
  ScrollController _scrollController = ScrollController();
  PanelController _panelController = PanelController();
  TextEditingController _notesController = TextEditingController();
  int days = 7;
  late UserModel user;
  @override
  void initState() {
    super.initState();
    user = widget.userModel;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        color: Theme.of(context).primaryColor,
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
                        if (days == 7 && widget.userModel.weight!.length > 7)
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
                        if (days == 7 && widget.userModel.weight!.length > 7)
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
                child: widget.userModel.weight!.length == 0
                    ? Container(
                        height: size.height * 0.3,
                        width: double.infinity,
                        child: Center(
                          child: Text('No Weight Added'),
                        ),
                      )
                    : Chart(
                        state: ChartState.bar(
                          ChartData.fromList(
                            widget.userModel.weight!.length == 0
                                ? [0.0].map((e) => BarValue<void>(e)).toList()
                                : days == 7 && widget.userModel.weight!.length > 7
                                    ? widget.userModel.weight!.sublist(0, 7).map((e) => BarValue<void>(e)).toList()
                                    : widget.userModel.weight!.map((e) => BarValue<void>(e)).toList(),
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
                              horizontalAxisStep: 10,
                              // showHorizontalGrid: true,
                              // horizontalAxisValueFromValue: (value) {
                              //   if (value % 10 == 0) {
                              //     print(value);
                              //     return value.toString();
                              //   }
                              //   return '';
                              // },
                              horizontalLegendPosition: HorizontalLegendPosition.start,
                              horizontalValuesPadding: EdgeInsets.only(right: 50),
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: _notesController,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Notes'),
                  maxLines: 15,
                ),
              ),
              Consumer<FirebaseProvider>(
                builder: (context, value, child) => ButtonWidget(
                  size: size,
                  onTap: () async {
                    if (_notesController.text.isNotEmpty) {
                      user.programs.notes.add(
                        NotesModel(note: _notesController.text, userId: value.user!.userId!),
                      );
                      await value.addStretch(
                        user.userId!,
                        user.programs,
                      );
                      Get.back();
                    }
                  },
                  title: 'Update',
                  isTransparent: false,
                ),
              ),
              SizedBox(
                height: 10,
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
        body: SingleChildScrollView(
          controller: _scrollController,
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
                subTitle: widget.userModel.username!,
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              Center(
                child: Text(
                  'Edit Program',
                  style: AppConstants.nameTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('users').doc(widget.userModel.userId!).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: size.height * 0.3,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (!(snapshot.data!.exists)) {
                    return Center(
                      child: Text("No User Found.", style: AppConstants.labelStyle),
                    );
                  }
                  UserModel user = UserModel.fromMap(snapshot.data!.data() as Map<String, dynamic>);
                  return Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          'Stretches:',
                          style: AppConstants.labelStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => AddStretchScreen(userModel: widget.userModel));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.darkerBlueBorder,
                              ),
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.lightBlue,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              child: Text(
                                'Add stretch',
                              ),
                            ),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: user.programs.streches
                                .map(
                                  (e) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Text(
                                          e.name ?? '',
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
                                              'Held for ${printDuration(Duration(seconds: e.duration ?? 0))} \n${e.reps} Reps\n${e.sets} Sets\n${e.notes}',
                                              style: AppConstants.bulkinDaysTextStyle.copyWith(
                                                color: AppColors.darkerBlueBorder,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList()),
                        SizedBox(height: 40),
                        Text(
                          'Exercises:',
                          style: AppConstants.labelStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => AddExerciseScreen(userModel: widget.userModel));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.darkerBlueBorder,
                              ),
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.lightBlue,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              child: Text(
                                'Add Exercise',
                              ),
                            ),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: user.programs.exercises
                                .map(
                                  (e) => ExcersizeBlockWidget(
                                    excersize: e.name!,
                                    sets: e.sets.toString(),
                                    size: size,
                                    duration: e.duration ?? 0,
                                    reps: e.reps!.toString(),
                                    notes: e.notes!,
                                  ),
                                )
                                .toList()),
                        SizedBox(
                          height: size.height * 0.2,
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
