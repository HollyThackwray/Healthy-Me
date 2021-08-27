import 'package:flutter/material.dart';

import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/validators.dart';
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
                title: 'REGISTER',
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
                onTap: () {},
                title: 'Sign-In',
              ),
              ButtonWidget(
                size: size,
                isTransparent: true,
                onTap: () {},
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

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.size,
    required this.onTap,
    required this.title,
    required this.isTransparent,
  }) : super(key: key);

  final Size size;
  final void Function() onTap;
  final String title;
  final bool isTransparent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.35,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.darkerBlueBorder,
          ),
          borderRadius: BorderRadius.circular(25),
          color: isTransparent ? Colors.transparent : AppColors.lightBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              title,
              style: isTransparent
                  ? TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color:
                          MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white,
                    )
                  : AppConstants.buttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
