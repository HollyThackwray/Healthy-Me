import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/validators.dart';
import 'package:hollythackwray/screens/signup/signup_screen.dart';
import 'package:hollythackwray/widgets/button_widget.dart';
import 'package:hollythackwray/widgets/custom_text_form_field_widget.dart';
import 'package:hollythackwray/widgets/top_banner_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

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
                      hint: '',
                      controller: _emailController,
                      label: 'E-mail',
                      keyBoardType: TextInputType.emailAddress,
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
                      hint: '',
                      keyBoardType: TextInputType.text,
                      obs: true,
                      showForgetPass: true,
                      endWidget: Text(
                        'Forgot Password?',
                        style: AppConstants.forgetPassTextStyle,
                      ),
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
                      if (_formKey.currentState?.validate() ?? false) {
                        value.signIn(email: _emailController.text, password: _passwordController.text);
                      }
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
        ),
      ),
    );
  }
}
