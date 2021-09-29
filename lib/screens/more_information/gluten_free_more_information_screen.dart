import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

import 'bulk_more_information_screen.dart';

class GlutenFreeMoreInformationScreen extends StatelessWidget {
  const GlutenFreeMoreInformationScreen({Key? key}) : super(key: key);

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
              isCongo: false,
              subTitle: 'INFORMATION',
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Image.asset(
              Images.spoons,
              height: 29,
              color: AppColors.darkerBlueBorder,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Food', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Breakfasts', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(
              title: 'Breakfast: Greek yogurt',
              subtitle: 'Include: vanilla extract with sliced fruits',
            ),
            DisplayContainer(
              title: 'Breakfast: Omelet',
              subtitle: 'Include: veggies ',
            ),
            DisplayContainer(
              title: 'Breakfast: Oatmeal',
              subtitle: 'Include: Berries',
            ),
            DisplayContainer(
              title: 'Breakfast: Gluten free toast',
              subtitle: 'Include: Egg and avocado',
            ),
            SizedBox(
              height: 10,
            ),
            Text('Lunches', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(title: 'Lunch: Chicken, lentil and veggie soup', subtitle: ''),
            DisplayContainer(title: 'Lunch: Tuna salad', subtitle: 'Include: Boiled egg'),
            DisplayContainer(
                title: 'Lunch: Quinoa salad', subtitle: 'Include: Sliced tomatoes, cucumber, spinach and avocado'),
            SizedBox(
              height: 10,
            ),
            Text('Dinners', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(
                title: 'Dinner:  Steak tacos', subtitle: 'Include: mushroom and spinach in gluten-free corn tortillas'),
            DisplayContainer(title: 'Dinner: Shrimp skewers', subtitle: 'Include: Garden salad'),
            DisplayContainer(title: 'Dinner: Chicken and broccoli stir-fry', subtitle: 'Include: Rice'),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Foods to Avoid',
                    style: AppConstants.bulkinDaysTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Completely avoiding gluten can be challenging.\n\nThis is because it is found in many common ingredients that are added to foods.\n\nThese are the main sources of gluten in the diet:\n\nWheat-based foods like wheat bran, wheat flour, spelt, durum, kamut and semolina\nBarley\nRye\nTriticale\nMalt\nBrewer’s yeast\nBelow are some foods that may have ingredients containing gluten added to them:\n\nBread. All wheat-based bread.\nPasta. All wheat-based pasta.\nCereals. Unless labeled gluten-free.\nBaked goods. Cakes, cookies, muffins, pizza, bread crumbs and pastries.\nSnack foods. Candy, muesli bars, crackers, pre-packaged convenience foods, roasted nuts, flavored chips and popcorn, pretzels.\nSauces. Soy sauce, teriyaki sauce, hoisin sauce, marinades, salad dressings.\nBeverages. Beer, flavored alcoholic beverages.\nOther foods. Couscous, broth (unless labeled gluten-free).\nThe easiest way to avoid gluten is to eat unprocessed, single-ingredient foods. Otherwise, you should read the food labels of most foods you buy.\n\nOats are naturally gluten-free. However, they are often contaminated with gluten, as they might be processed in the same factory as wheat-based foods',
                    style: AppConstants.moreInfo,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Foods to Eat',
                    style: AppConstants.bulkinDaysTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'There are plenty of gluten-free options that will allow you to enjoy healthy and delicious meals.\n\nThe following foods are naturally gluten-free:\n\nMeats and fish. All meats and fish, except battered or coated meats.\nEggs. All types of eggs are naturally gluten-free.\nDairy. Plain dairy products, such as plain milk, plain yogurt and cheeses. However, flavored dairy products may have added ingredients that contain gluten, so you will need to read the food labels.\nFruits and vegetables. All fruits and vegetables are naturally free of gluten.\nGrains. Quinoa, rice, buckwheat, tapioca, sorghum, corn, millet, amaranth, arrowroot, teff and oats (if labeled gluten-free).\nStarches and flours. Potatoes, potato flour, corn, corn flour, chickpea flour, soy flour, almond meal/flour, coconut flour and tapioca flour.\nNuts and seeds. All nuts and seeds.\nSpreads and oils. All vegetable oils and butter.\nHerbs and spices. All herbs and spices.\nBeverages. Most beverages, except for beer (unless labeled as gluten-free).\nIf you’re ever unsure if a food item contains gluten, it’s best to read the food labels..\n',
                    style: AppConstants.moreInfo,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
