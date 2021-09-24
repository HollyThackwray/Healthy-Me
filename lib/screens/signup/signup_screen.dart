import 'package:flutter/material.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/platform_dialogue.dart';
import 'package:hollythackwray/res/validators.dart';
import 'package:hollythackwray/widgets/button_widget.dart';
import 'package:hollythackwray/widgets/custom_text_form_field_widget.dart';
import 'package:hollythackwray/widgets/top_banner_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _fNameController;
  late TextEditingController _lNameController;
  late TextEditingController _userNameController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _userNameController = TextEditingController();
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
                    title: 'REGISTER',
                  ),
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: CustomTextField(
                      controller: _fNameController,
                      label: 'First Name',
                      hint: '',
                      keyBoardType: TextInputType.text,

                      obs: false,
                      showForgetPass: false,
                      validator: Validators.emptyValidator,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: CustomTextField(
                      controller: _lNameController,
                      hint: '',
                      label: 'Last Name',
                      keyBoardType: TextInputType.text,

                      obs: false,
                      showForgetPass: false,
                      validator: Validators.emptyValidator,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: CustomTextField(
                      controller: _emailController,
                      label: 'E-mail',
                      hint: '',
                      keyBoardType: TextInputType.emailAddress,

                      obs: false,
                      showForgetPass: false,
                      validator: Validators.emailValidator,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: CustomTextField(
                      controller: _userNameController,
                      label: 'Username',
                      obs: false,
                      showForgetPass: false,
                      hint: '',
                      keyBoardType: TextInputType.text,

                      validator: Validators.emptyValidator,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: CustomTextField(
                      controller: _passwordController,
                      label: 'Password',
                      obs: true,
                      showForgetPass: false,
                      hint: '',
                      keyBoardType: TextInputType.text,

                      validator: Validators.passwordValidator,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: CustomTextField(
                      controller: _confirmPasswordController,
                      label: 'Confirm Password',
                      obs: true,
                      keyBoardType: TextInputType.text,

                      hint: '',
                      showForgetPass: false,
                      validator: Validators.passwordValidator,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    size: size,
                    isTransparent: false,
                    onTap: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (_passwordController.text != _confirmPasswordController.text) {
                          await showPlatformDialogue(title: 'Passwords don\'t match');
                        } else
                          value.signUp(
                            name: _userNameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            fName: _fNameController.text,
                            lName: _lNameController.text,
                          );
                      }
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
