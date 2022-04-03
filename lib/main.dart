import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/my_themes.dart';
import 'package:hollythackwray/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (_) => FirebaseProvider(),
      child: GetMaterialApp(
        darkTheme: MyThemes.darkTheme,
        theme: MyThemes.lightTheme,
        title: 'Healthy Me',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home: SplashScreen(),
      ),
    );
  }
}
