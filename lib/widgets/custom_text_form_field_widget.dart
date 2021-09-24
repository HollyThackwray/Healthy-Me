import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.obs,
    this.endWidget,
    required this.showForgetPass,
    required this.label,
    required this.hint,
    this.validator,
    required this.controller,
    required this.keyBoardType,
  }) : super(key: key);
  final bool obs;
  final Widget? endWidget;
  final bool showForgetPass;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obs,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        hintText: hint,
        suffixIconConstraints: BoxConstraints(
          minHeight: 0,
        ),
        suffixIcon: showForgetPass ? endWidget : null,
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w300,
          color: Theme.of(context).dividerColor,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      cursorColor: Theme.of(context).dividerColor,
    );
  }
}
