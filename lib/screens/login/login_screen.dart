import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/validators.dart';
import 'package:hollythackwray/screens/healthyMe/healthy_me_screen.dart';
import 'package:hollythackwray/screens/signup/signup_screen.dart';
import 'package:hollythackwray/widgets/button_widget.dart';
import 'package:hollythackwray/widgets/custom_text_form_field_widget.dart';
import 'package:hollythackwray/widgets/top_banner_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TopBannerWidget(
                size: size,
                title: 'SIGN-IN',
              ),
              SizedBox(
                height: size.height * 0.12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: CustomTextField(
                  controller: _emailController,
                  label: 'E-mail',
                  obs: false,
                  showForgetPass: false,
                  validator: Validators.emailValidator,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: CustomTextField(
                  controller: _passwordController,
                  label: 'Password',
                  obs: true,
                  showForgetPass: true,
                  validator: Validators.passwordValidator,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(
                size: size,
                isTransparent: false,
                onTap: () {
                  Get.offAll(() => HealtthyMeScreen());
                },
                title: 'Sign-In',
              ),
              ButtonWidget(
                size: size,
                isTransparent: true,
                onTap: () {
                  Get.to(() => SignUpScreen());
                },
                title: 'Register',
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
