import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/exercise_model.dart';
import 'package:hollythackwray/models/user_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/widgets/button_widget.dart';
import 'package:hollythackwray/widgets/custom_text_form_field_widget.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class AddExerciseScreen extends StatefulWidget {
  final UserModel userModel;
  AddExerciseScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  _AddExerciseScreenState createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  TextEditingController _setsController = TextEditingController();
  TextEditingController _repsController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late UserModel user;
  void initState() {
    super.initState();

    secondsListPop();
    user = widget.userModel;
  }

  List<int> secondsList = [];
  int selectedSeconds = 0;
  secondsListPop() {
    for (var i = 1; i < 60; i++) {
      secondsList.add(i);
    }
  }
  Duration? pickedTime = Duration();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<FirebaseProvider>(
      builder: (context, value, child) => LoadingOverlay(
        isLoading: value.isLoading,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                    subTitle: 'Add Exercise',
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: CustomTextField(
                      obs: false,
                      showForgetPass: false,
                      label: 'Title',
                      hint: 'Plank',
                      controller: _nameController,
                      keyBoardType: TextInputType.text,
                    ),
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
                                child: TextFormField(
                                  controller: _setsController,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
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
                                child: TextFormField(
                                  controller: _repsController,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
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
                            GestureDetector(
                              onTap: showPicker,
                              child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.lightGrey,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Theme.of(context).dividerColor,
                                    )),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      TextField(
                                        maxLines: 1,
                                        // onTap: () async {
                                        //   // pickedTime = await showDurationPicker(
                                        //   //   context: context,
                                        //   //   initialTime: Duration(minutes: 1),
                                        //   // );
                                        //   // setState(() {
                                        //   //   _durationController.text = pickedTime.toString().substring(0, 8);
                                        //   // });
                                        // },
                                        textAlign: TextAlign.center,
                                        controller: timeinput,
                                        decoration: InputDecoration(
                                          hintText: '00.00',
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
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        width: 100,
                                        height: 40,
                                      ),
                                    ],
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
                                ),
                              ),
                              child: Center(
                                child: TextField(
                                  maxLines: 5,
                                  controller: _notesController,
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
                  SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                      size: size,
                      onTap: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          user.programs.exercises.add(
                            ExerciseModel(
                              duration: selectedSeconds,
                              name: _nameController.text,
                              isCompleted: false,
                              notes: _notesController.text,
                              reps: int.parse(_repsController.text),
                              sets: int.parse(_setsController.text),
                            ),
                          );
                          await value.addStretch(
                            user.userId!,
                            user.programs,
                          );
                          Get.back();
                        }
                      },
                      title: 'Add',
                      isTransparent: false),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400,
            child: CupertinoPicker(
              looping: true,
              backgroundColor: Theme.of(context).primaryColor,
              onSelectedItemChanged: (value) {
                value++;
                setState(() {
                  timeinput.text = '00:${(value.toString().length > 1) ? value.toString() : '0' + value.toString()}';
                  selectedSeconds = value;
                });
              },
              itemExtent: 32.0,
              children: secondsList
                  .map(
                    (e) => Text(
                      '00:${(e.toString().length > 1) ? e.toString() : '0' + e.toString()} seconds',
                      style: TextStyle(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        });
  }
}
