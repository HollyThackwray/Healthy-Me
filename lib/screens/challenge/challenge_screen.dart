import 'package:flutter/material.dart';

import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: AppBar().preferredSize.height,
              width: double.infinity,
              color: AppColors.lightBlue,
            ),
            TopBannerSubHeadingWidget(
              size: size,
              title: 'HEALTHY ME',
              subTitle: 'CHALLENGE',
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Text(
              'HEALTHY ME',
              style: AppConstants.topBarTextStyle.copyWith(
                color: AppColors.darkerBlueBorder,
              ),
            ),
            Text(
              'WORKOUT',
              style: AppConstants.nameTextStyle.copyWith(
                color: AppColors.lightBlue,
              ),
            ),
            Text(
              'CHALLENGE',
              style: AppConstants.nameTextStyle.copyWith(
                color: AppColors.darkerBlueBorder,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              Images.running_person,
              height: 40,
              color: AppColors.lightBlue,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: AppColors.darkerBlueBorder,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TasksWidget(
                    title: 'Pushups:',
                    subTitle: '10 reps, 5 sets',
                  ),
                  TasksWidget(
                    title: 'Squats:',
                    subTitle: '10 reps, 5 sets',
                  ),
                  TasksWidget(
                    title: 'Burpees:',
                    subTitle: '10 reps, 2 sets',
                  ),
                  TasksWidget(
                    title: 'Lunges:',
                    subTitle: '10 reps, 5 sets',
                  ),
                  TasksWidget(
                    title: 'Jump lunges:',
                    subTitle: '10 reps, 5 sets',
                  ),
                  TasksWidget(
                    title: 'Step-ups:',
                    subTitle: '25 reps, 4 sets',
                  ),
                  TasksWidget(
                    title: 'Plank:',
                    subTitle: '1 Minute',
                  ),
                  TasksWidget(
                    title: 'Plank with hip dips:',
                    subTitle: '1 Minute',
                  ),
                  TasksWidget(
                    title: 'Jump squats:',
                    subTitle: '50 reps, 5 sets',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TasksWidget extends StatelessWidget {
  const TasksWidget({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppConstants.switchProfAccStyle,
        ),
        Text(
          '  $subTitle',
          style: AppConstants.bulkinDaysTextStyle,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
