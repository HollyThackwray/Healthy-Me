import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/strech_model.dart';
import 'package:hollythackwray/models/user_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/widgets/button_widget.dart';
import 'package:hollythackwray/widgets/custom_text_form_field_widget.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class AddStretchScreen extends StatefulWidget {
  final UserModel userModel;
  AddStretchScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  _AddStretchScreenState createState() => _AddStretchScreenState();
}

class _AddStretchScreenState extends State<AddStretchScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _secondsController = TextEditingController();
  TextEditingController _timesController = TextEditingController();
  final _formKey = GlobalKey();
  late UserModel user;
  @override
  void initState() {
    super.initState();
    user = widget.userModel;
  }

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
                    subTitle: 'Add Stretch',
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
                      hint: 'Triceps stretch',
                      controller: _nameController,
                      keyBoardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: CustomTextField(
                      obs: false,
                      showForgetPass: false,
                      label: 'For',
                      hint: 'Seconds',
                      controller: _secondsController,
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: CustomTextField(
                      obs: false,
                      showForgetPass: false,
                      label: 'Times',
                      hint: 'Twice/Thrice',
                      controller: _timesController,
                      keyBoardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                      size: size,
                      onTap: () async {
                        user.programs.streches.add(StrechModel(
                          duration: int.parse(_secondsController.text),
                          manyTimes: _timesController.text,
                          name: _timesController.text,
                        ));
                        await value.addStretch(
                          user.userId!,
                          user.programs,
                        );
                        Get.back();
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
}
