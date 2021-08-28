import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/res/my_themes.dart';
import 'package:hollythackwray/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: MyThemes.darkTheme,
      theme: MyThemes.lightTheme,
      title: 'HollyThackwray',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: LoginScreen(),
    );
  }
}
