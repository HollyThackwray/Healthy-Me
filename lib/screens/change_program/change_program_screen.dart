import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/day_model.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/disclaimer/disclaimer_screen.dart';
import 'package:hollythackwray/screens/journel2/journel_2_screen.dart';
import 'package:hollythackwray/screens/notPurchasedJournel/not_purchased_journel_screen.dart';
import 'package:hollythackwray/screens/program_details/program_details_screen.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class ChangeProgramScreen extends StatelessWidget {
  const ChangeProgramScreen({Key? key}) : super(key: key);

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
              isCongo: false,
              title: 'HEALTHY ME',
              subTitle: 'CHANGE PROGRAM',
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: size.height * 0.35,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor == Colors.black ? AppColors.lightBlackHeading : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.lock,
                        height: 49,
                        width: 49,
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AutoSizeText(
                        'JOURNAL',
                        maxFontSize: 48,
                        minFontSize: 30,
                        style: AppConstants.journelStyle.copyWith(
                          color: AppColors.lightBlue,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Update',
                            style: AppConstants.updateStyle.copyWith(
                              color: AppColors.darkerBlueBorder,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            Images.forward_arrow,
                            height: 18,
                            color: AppColors.darkerBlueBorder,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => Journel2Screen());
              },
              child: Container(
                height: size.height * 0.35,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.pencil_large,
                        height: 49,
                        width: 49,
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AutoSizeText(
                        'JOURNAL',
                        maxFontSize: 48,
                        minFontSize: 30,
                        style: AppConstants.journelStyle.copyWith(
                          color: Theme.of(context).dividerColor == Colors.black
                              ? AppColors.lightBlackHeading
                              : Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Update',
                            style: AppConstants.updateStyle.copyWith(
                              color: Theme.of(context).dividerColor == Colors.black
                                  ? AppColors.lightBlackHeading
                                  : Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            Images.forward_arrow,
                            height: 18,
                            color: Theme.of(context).dividerColor == Colors.black
                                ? AppColors.lightBlackHeading
                                : Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.dumble,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    Images.running_person,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'Bulking is the muscle gaining phase. In this program you will intentionally consume more calories than your body needs. These extra calories provide your body with the necessary fuel to boost muscle size and strength.',
                    title: 'BULK',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.dumble,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 20),
                        Image.asset(
                          Images.running_person,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 20),
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: 'Notification at 6 AM',
                          title: 'Take a brisk run/walk to start your day!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: 'Notification at 8 AM',
                          title: 'Breakfast: Eggs any style',
                          icon: Images.spoons,
                          subtitle: 'Include: cheese, lentils and a glass of milk',
                        ),
                        DataModel(
                          notification: 'Notification at 10 AM',
                          title: 'Reminder: Try to stay active!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: 'Notification at 12 PM',
                          title: 'Lunch: Tuna or Salmon sandwich',
                          icon: Images.spoons,
                          subtitle: 'Include: Ezekiel bread',
                        ),
                        DataModel(
                          notification: 'Notification at 6 AM',
                          title: 'Reminder: Try to stay active!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: 'Notification at 2 PM',
                          title: 'Gym: Chest + Shoulders',
                          icon: Images.dumble,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: 'Notification at 6 AM',
                          title: 'Dinner: Chicken without the skin',
                          icon: Images.spoons,
                          subtitle: 'Include: Broccoli and Quinoa',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oats ',
                        icon: Images.spoons,
                        subtitle: 'Include: and greek yogurt, quinoa, almonds and milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Salad with shrimp',
                        icon: Images.spoons,
                        subtitle: 'Include: pumkin seeds and quinoa',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Back + Legs',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Lean beef',
                        icon: Images.spoons,
                        subtitle: 'Include: Brussels sprouts',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Eggs any style ',
                        icon: Images.spoons,
                        subtitle: 'Include: cheese, lentils and a glass of milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Smoothie',
                        icon: Images.spoons,
                        subtitle: 'Include: Fresh fruits, avocado and milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Arms + Abdominals',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Tuna or salmon',
                        icon: Images.spoons,
                        subtitle: 'Include: Potato, Kumara, carrots and Quinoa ',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oats',
                        icon: Images.spoons,
                        subtitle: 'Include: and greek yoghurt, quinoa, almonds and milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Tuna or Salmon sandwich',
                        icon: Images.spoons,
                        subtitle: 'Include: Ezekiel bread ',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Chest + Shoulders',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Pork tenderloin',
                        icon: Images.spoons,
                        subtitle: 'Include: Beans and broccoli ',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Eggs any style ',
                        icon: Images.spoons,
                        subtitle: 'Include: cheese, lentils and a glass of milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Chicken breast',
                        icon: Images.spoons,
                        subtitle: 'Include: Soybeans and Cottage cheese',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Back + Legs',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Lean beef',
                        icon: Images.spoons,
                        subtitle: 'Include: Brussels sprouts',
                      ),
                    ]),
                    satday: DayModel(name: 'Satday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Chicken omlette ',
                        icon: Images.spoons,
                        subtitle: 'Include: Glass of milk / soya milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Tuna or Salmon sandwich',
                        icon: Images.spoons,
                        subtitle: 'Include: Ezekiel bread ',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Arms + Abdominals',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Chicken without the skin',
                        icon: Images.spoons,
                        subtitle: 'Include: Broccoli and Quinoa',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Take a brisk run/walk to start your day!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Gym: Optional',
                          icon: Images.dumble,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'BULK',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.running_person,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'Slimming is loosing weight healthily without gaining muscle. You will be consuming less calories than your body needs without feeling hungry so you use more energy than your providing and therefore loosing weight.',
                    title: 'SLIM',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.running_person,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 20),
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Take a brisk run/walk to start your day!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: 'Notification at 8 AM',
                          title: 'Breakfast: Eggs any style',
                          icon: Images.spoons,
                          subtitle: 'Include: a glass of milk',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Reminder: Try to stay active!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Salmon',
                          icon: Images.spoons,
                          subtitle: 'Include: Broccoli, cauliflower and cabbage',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Cardio: Run/walk 10 - 60 minutes ',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Chicken without the skin',
                          icon: Images.spoons,
                          subtitle: 'Include: Broccoli and potatoes',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Green tea',
                        icon: Images.spoons,
                        subtitle: 'Include: Fruit',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Eggs',
                        icon: Images.spoons,
                        subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Cardio: Run/walk 10 - 60 minutes ',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Lean beef',
                        icon: Images.spoons,
                        subtitle: 'Include: Brussels sprouts',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Smoothie',
                        icon: Images.spoons,
                        subtitle: 'Include: Vegetables, berries and fruit',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Eggs',
                        icon: Images.spoons,
                        subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Cardio: Run/walk 10 - 60 minutes ',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Avocado and salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Kale and chickpeas',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Coffee',
                        icon: Images.spoons,
                        subtitle: 'Include: Grapefruit',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Tuna',
                        icon: Images.spoons,
                        subtitle: 'Include: Ezekiel Bread',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Cardio: Run/walk 10 - 60 minutes ',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Bean and Vegetable Soup',
                        icon: Images.spoons,
                        subtitle: 'Include: Black beans',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Bananas and greek yoghurt',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Soup',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Cardio: Run/walk 10 - 60 minutes ',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Chicken',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                    ]),
                    satday: DayModel(name: 'Satday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oatmeal',
                        icon: Images.spoons,
                        subtitle: 'Include: Chia seeds, flax seeds, greek yogurt and nuts',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Soup',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Cardio: Run/walk 10 - 60 minutes ',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Steak',
                        icon: Images.spoons,
                        subtitle: 'Include: Broccoli',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Take a brisk run/walk to start your day!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Cardio: Run/walk 10 - 60 minutes',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'SLIM',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.running_person,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'Toning leads to a reduction in body fat and weight. The loss of weight on the body’s frame results in better health and can reduce the appearance of body fat by tightening up the muscles and giving them shape.',
                    title: 'TONE',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.dumble,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 20),
                        Image.asset(
                          Images.running_person,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 20),
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Take a brisk run/walk to start your day!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: 'Notification at 8 AM',
                          title: 'Breakfast: Eggs any style',
                          icon: Images.spoons,
                          subtitle: 'Include: a glass of milk',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Reminder: Try to stay active!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Tuna or Salmon sandwich',
                          icon: Images.spoons,
                          subtitle: 'Include: Ezekiel bread',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Reminder: Try to stay active!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Gym: Chest + Shoulders',
                          icon: Images.dumble,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Chicken without the skin',
                          icon: Images.dumble,
                          subtitle: 'Include: Broccoli and Quinoa',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Green tea',
                        icon: Images.spoons,
                        subtitle: 'Include: Fruit',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Salad with shrimp',
                        icon: Images.spoons,
                        subtitle: 'Include: pumkin seeds and quinoa',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Back + Legs',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Lean beef',
                        icon: Images.spoons,
                        subtitle: 'Include: Brussels sprouts',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Eggs any style ',
                        icon: Images.spoons,
                        subtitle: 'Include: cheese, lentils and a glass of milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Smoothie',
                        icon: Images.spoons,
                        subtitle: 'Include: Fresh fruits, avocado and milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Arms + Abdominals',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Avocado and salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Kale and chickpeas',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Coffee',
                        icon: Images.spoons,
                        subtitle: 'Include: Grapefruit',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Tuna or Salmon sandwich',
                        icon: Images.spoons,
                        subtitle: 'Include: Ezekiel Bread',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Chest + Shoulders',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Bean and Vegetable Soup',
                        icon: Images.spoons,
                        subtitle: 'Include: Black beans',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Bananas and greek yoghurt',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Soup',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Back + Legs',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Chicken',
                        icon: Images.spoons,
                        subtitle: 'Include: Cayenne pepper and salad',
                      ),
                    ]),
                    satday: DayModel(name: 'Satday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oatmeal',
                        icon: Images.spoons,
                        subtitle: 'Include: Chia seeds, flax seeds, greek yogurt and nuts',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Soup',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Arms + Abdominals',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Steak',
                        icon: Images.spoons,
                        subtitle: 'Include: Broccoli',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Take a brisk run/walk to start your day!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Gym: Optional',
                          icon: Images.dumble,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'TONE',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'Gaining is a healthy increase in body weight. This can involve an increase in muscle mass, fat deposits.',
                    title: 'GAIN',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.running_person,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 20),
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Take a brisk run/walk to start your day!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Eggs any style',
                          icon: Images.spoons,
                          subtitle: 'Include: cheese, lentils and a glass of milk',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Reminder: Try to stay active!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Roast potatoes and kumara',
                          icon: Images.spoons,
                          subtitle: 'Include: Salad',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Reminder: Try to stay active!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Chicken',
                          icon: Images.dumble,
                          subtitle: 'Include: Broccoli and Quinoa',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oats ',
                        icon: Images.spoons,
                        subtitle: 'Include: and greek yogurt, quinoa, almonds and milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Pasta',
                        icon: Images.spoons,
                        subtitle: 'Include: Cheese and milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Red meat',
                        icon: Images.spoons,
                        subtitle: 'Include: Rice',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Chicken omlette',
                        icon: Images.spoons,
                        subtitle: 'Include: Glass of milk / soya milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Eggs',
                        icon: Images.spoons,
                        subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Fish',
                        icon: Images.spoons,
                        subtitle: 'Include: Kale, chickpeas and avocado',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Eggs any style ',
                        icon: Images.spoons,
                        subtitle: 'Include: cheese, lentils and a glass of milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Roast potatoes and kumara',
                        icon: Images.spoons,
                        subtitle: 'Include: Salad',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Chicken',
                        icon: Images.spoons,
                        subtitle: 'Include: Broccoli and Quinoa',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oats',
                        icon: Images.spoons,
                        subtitle: 'Include: and greek yogurt, quinoa, almonds and milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Pasta',
                        icon: Images.spoons,
                        subtitle: 'Include: Cheese and milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Red meat',
                        icon: Images.spoons,
                        subtitle: 'Include: Rice',
                      ),
                    ]),
                    satday: DayModel(name: 'Satday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Chicken omlette',
                        icon: Images.spoons,
                        subtitle: 'Include: Glass of milk / soya milk',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Eggs',
                        icon: Images.spoons,
                        subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Steak',
                        icon: Images.spoons,
                        subtitle: 'Include: Broccoli',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Take a brisk run/walk to start your day!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'GAIN',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.running_person,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'This program includes overall fitness and can help you achieve cardiorespiratory endurance, muscular strength, endurance, body composition, and flexibility through correct diet and activity.',
                    title: 'FITNESS',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.running_person,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 20),
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Take a brisk run/walk to start your day!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Reminder: Try to stay active!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Reminder: Try to stay active!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Gym: Chest + Shoulders',
                          icon: Images.dumble,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Healthy Me Challenge',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Arms + Abdominals',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Healthy Me Challenge',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Back + Legs',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Healthy Me Challenge',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Chest + Shoulders',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Healthy Me Challenge',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Back + Legs',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Healthy Me Challenge',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                    ]),
                    satday: DayModel(name: 'Saturday', data: [
                      DataModel(
                        notification: '',
                        title: 'Take a brisk run/walk to start your day!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Reminder: Try to stay active!',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Gym: Arms + Abdominals',
                        icon: Images.dumble,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Healthy Me Challenge',
                        icon: Images.running_person,
                        subtitle: '',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Take a brisk run/walk to start your day!',
                          icon: Images.running_person,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Gym: Optional',
                          icon: Images.dumble,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'FITNESS',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'This program includes a healthy and affordable general meal plan that will keep you healthy without having to do specific physical activities',
                    title: 'FOOD',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Eggs any style ',
                          icon: Images.spoons,
                          subtitle: 'Include: a glass of milk',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Salmon',
                          icon: Images.spoons,
                          subtitle: 'Include: Broccoli, cauliflower and cabbage',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Chicken without the skin',
                          icon: Images.spoons,
                          subtitle: 'Include: Broccoli and Quinoa',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Green tea',
                        icon: Images.spoons,
                        subtitle: 'Include: Fruit',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Eggs',
                        icon: Images.spoons,
                        subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Lean beef',
                        icon: Images.spoons,
                        subtitle: 'Include: Brussels sprouts',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Smoothie',
                        icon: Images.spoons,
                        subtitle: 'Include: Vegetables, berries and fruit',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Eggs',
                        icon: Images.spoons,
                        subtitle: 'Include: Salad - kale, spinach, collards and swiss chards',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Avocado and salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Kale and chickpeas',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Coffee',
                        icon: Images.spoons,
                        subtitle: 'Include: Grapefruit',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Tuna',
                        icon: Images.spoons,
                        subtitle: 'Include: Ezekiel Bread',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Bean and Vegetable Soup',
                        icon: Images.spoons,
                        subtitle: 'Include: Black beans',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Bananas and greek yoghurt',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Soup',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Chicken',
                        icon: Images.spoons,
                        subtitle: 'Include: Cayenne pepper and salad',
                      ),
                    ]),
                    satday: DayModel(name: 'Saturday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oatmeal',
                        icon: Images.spoons,
                        subtitle: 'Include: Chia seeds, flax seeds, greek yogurt and nuts',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Soup',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Steak',
                        icon: Images.spoons,
                        subtitle: 'Include: Broccoli ',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'FOOD',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'The vegan meal plan excludes any food derived from animals and no animal products such as eggs or dairy.\nVegan diets are associated with many benefits, including improved heart health, faster short-term weight loss, enhanced blood sugar control, less joint pain, and a decreased risk of cancer.',
                    title: 'VEGAN',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Coconut yogurt',
                          icon: Images.spoons,
                          subtitle: 'Include: Berries, walnuts, and chia seeds',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Whole-grain pasta ',
                          icon: Images.spoons,
                          subtitle: 'Include: Lentils and a salad',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Cauliflower and chickpea tacos',
                          icon: Images.spoons,
                          subtitle: 'Include: Guacamole',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oats',
                        icon: Images.spoons,
                        subtitle: 'Include: Apple slices, pumpkin seeds, cinnamon, and nut butter',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Sweet potato wedges',
                        icon: Images.spoons,
                        subtitle: 'Include: Steamed broccoli',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Mediterranean lentil salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Cucumbers, olives, peppers and sun-dried tomatoes',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: sweet potato toast',
                        icon: Images.spoons,
                        subtitle: 'Include: Peanut butter and banana',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Quinoa, avocados, tomatoes, onions, beans, and cilantro',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Baked tofu',
                        icon: Images.spoons,
                        subtitle: 'Include: Sautéed red cabbage, Brussels sprouts, and couscous',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Coconut yogurt',
                        icon: Images.spoons,
                        subtitle: 'Include: Berries, walnuts, and chia seeds',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Whole-grain pasta',
                        icon: Images.spoons,
                        subtitle: 'Include: Lentils and a salad',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Bean salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Black-eyed peas, tomatoes, corn, bell peppers, and onions',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oats',
                        icon: Images.spoons,
                        subtitle: 'Include: Apple slices, pumpkin seeds, cinnamon, and nut butter',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Sweet potato wedges',
                        icon: Images.spoons,
                        subtitle: 'Include: Steamed broccoli ',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Sweet potato wedges',
                        icon: Images.spoons,
                        subtitle: 'Include: Steamed broccoli ',
                      ),
                    ]),
                    satday: DayModel(name: 'Saturday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: sweet potato toast ',
                        icon: Images.spoons,
                        subtitle: 'Include: Peanut butter and banana',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Quinoa, avocados, tomatoes, onions, beans, and cilantro',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Mediterranean lentil salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Cucumbers, olives, peppers and sun-dried tomatoes',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'VEGAN',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'The vegetarian meal plan excludes animal meat but includes products derived from animals such as eggs and dairy.',
                    title: 'VEGERARIAN',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Coconut yogurt',
                          icon: Images.spoons,
                          subtitle: 'Include: Berries, walnuts, and chia seeds',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Whole-grain pasta ',
                          icon: Images.spoons,
                          subtitle: 'Include: Lentils and a salad',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Cauliflower and chickpea tacos',
                          icon: Images.spoons,
                          subtitle: 'Include: Guacamole',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oatmeal',
                        icon: Images.spoons,
                        subtitle: 'Include: Fruit and flaxseeds',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch:  Veggie and hummus wrap',
                        icon: Images.spoons,
                        subtitle: 'Include: Sweet potato fries',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Eggplant parmesan',
                        icon: Images.spoons,
                        subtitle: 'Include: A side salad',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Scrambled eggs',
                        icon: Images.spoons,
                        subtitle: 'Include: Tomatoes, garlic and mushrooms',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Zucchini boats',
                        icon: Images.spoons,
                        subtitle: 'Include: Veggies and feta',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Chickpea curry',
                        icon: Images.spoons,
                        subtitle: 'Include: Basmati rice',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Greek yogurt',
                        icon: Images.spoons,
                        subtitle: 'Include: Chia seeds and berries',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Tomatoes, cucumber and feta with spiced lentil soup',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Flatbread',
                        icon: Images.spoons,
                        subtitle: 'Include: Grilled garden vegetables and pesto',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Coconut yogurt ',
                        icon: Images.spoons,
                        subtitle: 'Include: Berries, walnuts, and chia seeds',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Burrito bowl',
                        icon: Images.spoons,
                        subtitle: 'Include: Brown rice, beans, avocado, salsa and veggies',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Cauliflower and chickpea tacos',
                        icon: Images.spoons,
                        subtitle: 'Include: Guacamole',
                      ),
                    ]),
                    satday: DayModel(name: 'Saturday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oatmeal',
                        icon: Images.spoons,
                        subtitle: 'Include: Fruit and flaxseeds',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch:  Veggie and hummus wrap',
                        icon: Images.spoons,
                        subtitle: 'Include: Sweet potato fries',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Eggplant parmesan',
                        icon: Images.spoons,
                        subtitle: 'Include: A side salad',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Anything!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'VEGERARIAN',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'The pescatarian meal plan follows the vegetarian diet as it excludes animal meat but includes fish and all other sea foods.',
                    title: 'PESCATARIAN',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Eggs',
                          icon: Images.spoons,
                          subtitle: 'Include: Avocado and seasonings',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Salmon salad',
                          icon: Images.spoons,
                          subtitle: 'Include: Lentils, tomato, spinnach and pumkin seeds',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Cauliflower and chickpea tacos',
                          icon: Images.spoons,
                          subtitle: 'Include: Guacamole',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Coconut yogurt',
                        icon: Images.spoons,
                        subtitle: 'Include: Berries, walnuts, and chia seeds',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch:  Veggie and hummus wrap',
                        icon: Images.spoons,
                        subtitle: 'Include: Sweet potato fries',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Eggplant parmesan',
                        icon: Images.spoons,
                        subtitle: 'Include: A side salad',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oatmeal',
                        icon: Images.spoons,
                        subtitle: 'Include: Fruit and flaxseeds',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Tomatoes, cucumber and feta with spiced lentil soup',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Seafood curry',
                        icon: Images.spoons,
                        subtitle: 'Include: Basmati rice',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Eggs',
                        icon: Images.spoons,
                        subtitle: 'Include: Avocado and seasonings',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Tuna sandwich',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Shrimp Salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Tomatoes, cucumber and feta with spiced lentils',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Coconut yogurt',
                        icon: Images.spoons,
                        subtitle: 'Include: Berries, walnuts, and chia seeds',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Salmon salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Lentils, tomato, spinnach and pumkin seeds',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Salmon',
                        icon: Images.spoons,
                        subtitle: 'Include: Smoky spinach and chickpeas',
                      ),
                    ]),
                    satday: DayModel(name: 'Saturday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oatmeal',
                        icon: Images.spoons,
                        subtitle: 'Include: Fruit and flaxseeds',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch:  Veggie and hummus wrap',
                        icon: Images.spoons,
                        subtitle: 'Include: Sweet potato fries',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Shrimp Salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Tomatoes, cucumber and feta with spiced lentils',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Anything pescatarian!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Anything pescatarian!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Anything pescatarian!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'PESCATARIAN',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'The Gluten free meal plan follows a healthy diet that excludes all gluten and is for people who are intolerant to gluten.',
                    title: 'GLUTEN FREE',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Greek yogurt ',
                          icon: Images.spoons,
                          subtitle: 'Include: vanilla extract with sliced fruits',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Chicken, lentil and veggie soup',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner:  Steak tacos',
                          icon: Images.spoons,
                          subtitle: 'Include: mushroom and spinach in gluten-free corn tortillas',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Omelet',
                        icon: Images.spoons,
                        subtitle: 'Include: veggies',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Quinoa salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Sliced tomatoes, cucumber, spinach and avocado',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Shrimp skewers ',
                        icon: Images.spoons,
                        subtitle: 'Include: Garden salad',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oatmeal',
                        icon: Images.spoons,
                        subtitle: 'Include: Berries',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Tuna Salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Boiled egg',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Chicken and broccoli stir-fry',
                        icon: Images.spoons,
                        subtitle: 'Include: Rice',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Gluten free toast',
                        icon: Images.spoons,
                        subtitle: 'Include: Egg and avocado',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Chicken, lentil and veggie soup',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner:  Steak tacos',
                        icon: Images.spoons,
                        subtitle: 'Include: mushroom and spinach in gluten-free corn tortillas',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Omelet',
                        icon: Images.spoons,
                        subtitle: 'Include: veggies',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Quinoa salad ',
                        icon: Images.spoons,
                        subtitle: 'Include: Sliced tomatoes, cucumber, spinach and avocado',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Shrimp skewers',
                        icon: Images.spoons,
                        subtitle: 'Include: Garden salad',
                      ),
                    ]),
                    satday: DayModel(name: 'Saturday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Oatmeal',
                        icon: Images.spoons,
                        subtitle: 'Include: Berries',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Tuna salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Boiled egg',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Chicken and broccoli stir-fry',
                        icon: Images.spoons,
                        subtitle: 'Include: Rice',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Anything gluten-free!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Anything gluten-free!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Anything gluten-free!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'GLUTEN FREE',
            ),
            RoundedContainerWidget(
              size: size,
              top: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.spoons,
                    height: 20,
                    width: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  () => ProgramDetailsScreen(
                    description:
                        'The Ketogenic diet is a high-fat, adequate protein, low carbohydrate diet. It forces the body to burn fats rather than carbohydrates.',
                    title: 'KETO',
                    iconsRow: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.spoons,
                          height: 30,
                          fit: BoxFit.fill,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    monday: DayModel(
                      name: 'Monday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Eggs',
                          icon: Images.spoons,
                          subtitle: 'Include: Sautéed greens',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Tuna salad',
                          icon: Images.spoons,
                          subtitle: 'Include: Celery, tomato and greens',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Beef',
                          icon: Images.spoons,
                          subtitle: 'Include: Mushrooms, avocado and a salad',
                        ),
                      ],
                    ),
                    tuesday: DayModel(name: 'Tuesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Mushroom omelet',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Green salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Mushroom and avocado',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Roast chicken',
                        icon: Images.spoons,
                        subtitle: 'Include: cream sauce and broccoli',
                      ),
                    ]),
                    wedday: DayModel(name: 'Wednesday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Stuffed bell pepper',
                        icon: Images.spoons,
                        subtitle: 'Include: Cheese and eggs',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Arugula salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Hard-boiled eggs, turkey, avocado and blue cheese',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Grilled Salmon',
                        icon: Images.spoons,
                        subtitle: 'Include: Spinnach',
                      ),
                    ]),
                    thursday: DayModel(name: 'Thursday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Eggs',
                        icon: Images.spoons,
                        subtitle: 'Include: Sautéed greens',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Tuna salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Celery, tomato and greens',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Beef',
                        icon: Images.spoons,
                        subtitle: 'Include: Mushrooms, avocado and a salad',
                      ),
                    ]),
                    friday: DayModel(name: 'Friday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Mushroom omelet',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Green salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Mushroom and avocado',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Roast chicken',
                        icon: Images.spoons,
                        subtitle: 'Include: cream sauce and broccoli',
                      ),
                    ]),
                    satday: DayModel(name: 'Saturday', data: [
                      DataModel(
                        notification: '',
                        title: 'Breakfast: Baked avocado egg boats',
                        icon: Images.spoons,
                        subtitle: '',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Lunch: Caesar salad',
                        icon: Images.spoons,
                        subtitle: 'Include: Chicken',
                      ),
                      DataModel(
                        notification: '',
                        title: 'Dinner: Pork chops',
                        icon: Images.spoons,
                        subtitle: 'Include: Vegetables',
                      ),
                    ]),
                    sunday: DayModel(
                      name: 'sunday',
                      data: [
                        DataModel(
                          notification: '',
                          title: 'Breakfast: Anything keto!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Lunch: Anything keto!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                        DataModel(
                          notification: '',
                          title: 'Dinner: Anything keto!',
                          icon: Images.spoons,
                          subtitle: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
              title: 'KETO',
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => DisclaimerScreen());
                  },
                  child: Text(
                    'Healthy Me disclaimer',
                    style: AppConstants.bulkinDaysTextStyle.copyWith(color: AppColors.darkerBlueBorder),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
