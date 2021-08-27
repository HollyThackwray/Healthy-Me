import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    fontFamily: 'Avenir',
    colorScheme: ColorScheme.dark(),
    dividerColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    fontFamily: 'Avenir',
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.black,
  );
}
