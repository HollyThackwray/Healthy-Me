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
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        elevation: 0,
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBannerSubHeadingWidget(
              size: size,
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
