import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/widgets/top_title_widget.dart';

class TopBannerWidget extends StatelessWidget {
  const TopBannerWidget({
    Key? key,
    required this.title,
    required this.size,
  }) : super(key: key);
  final String title;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scale: 1.7,
          child: Container(
            width: double.infinity,
            height: size.height * 0.33,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(size.width),
                bottomRight: Radius.circular(size.width),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Center(
              child: SizedBox(
                height: 15,
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TopTitleWidget(
              title: title,
            ),
            Center(
              child: SizedBox(
                height: 15,
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
