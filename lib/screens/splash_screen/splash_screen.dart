import 'package:flutter/material.dart';
import 'package:hollythackwray/res/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.7, end: 1.15),
            duration: Duration(milliseconds: 1200),
            curve: Curves.easeInOutBack,
            builder: (context, dynamic value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: Image.asset(
              Images.healthy_me_logo,
              height: 300,
              width: 300,
            ),
          ),
        ),
      ),
    );
  }
}
