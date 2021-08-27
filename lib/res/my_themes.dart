import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    fontFamily: 'Avenir',
    colorScheme: ColorScheme.dark(),
    // iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    fontFamily: 'Avenir',
    colorScheme: ColorScheme.light(),
    // iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );
}
