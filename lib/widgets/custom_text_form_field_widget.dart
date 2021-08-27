import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.obs,
    required this.showForgetPass,
    required this.label,
    this.validator,
    required this.controller,
  }) : super(key: key);
  final bool obs;
  final bool showForgetPass;
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obs,
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(
          minHeight: 0,
        ),
        suffixIcon: showForgetPass
            ? Text(
                'Forgot Password?',
                style: AppConstants.forgetPassTextStyle,
              )
            : null,
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w300,
          color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white,
          ),
        ),
      ),
      cursorColor: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white,
    );
  }
}
