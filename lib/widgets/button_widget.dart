import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';

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
          borderRadius: BorderRadius.circular(30),
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
                      color: Theme.of(context).dividerColor,
                    )
                  : AppConstants.buttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
