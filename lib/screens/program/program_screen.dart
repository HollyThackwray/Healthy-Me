import 'package:flutter/material.dart';
import 'package:hollythackwray/models/program_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/journel7/journel_7_screen.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:provider/provider.dart';

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
  // getTrainersNames() async {
  //   for (var i = 0; i < widget.programModel.notes.length; i++) {
  //     var doc = await FirebaseFirestore.instance.collection('users').doc(widget.programModel.notes[i].userId).get();
  //     UserModel userModel = UserModel.fromMap(doc.data() as Map<String, dynamic>);
  //     trainerNames.add(userModel.firstName!);
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // List<String> trainerNames = [];
  // // PanelController _panelController = PanelController();
  // // int days = 7;
  // bool isLoading = true;
  // @override
  // void initState() {
  //   // getTrainersNames();
  //   super.initState();
  // }

  int notesName = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<FirebaseProvider>(
        builder: (context, value, child) => Stack(
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
                                    duration: e.duration ?? 0,
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
    );
  }
}
