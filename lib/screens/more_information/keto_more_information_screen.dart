import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class KetoMoreInformationScreen extends StatelessWidget {
  const KetoMoreInformationScreen({Key? key}) : super(key: key);
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
            
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'A ketogenic meal plan, like any healthy diet, should include whole foods and many fiber-rich, low-carb vegetables. Choose healthy fats like coconut oil, avocado, olive oil and pastured butter to increase the fat content of dishes.',
                      style: AppConstants.moreInfo,
                    ),
                  ),
                  Text(
                    'In a nutshell:',
                    style: AppConstants.bulkinDaysTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A healthy ketogenic diet should consist of about 75% fat, 10-30% protein and no more than 5% or 20 to 50 grams of carbs per day.\n\nFocus on high-fat, low-carb foods like eggs, meats, dairy and low-carb vegetables, as well as sugar-free beverages. Be sure to restrict highly processed items and unhealthy fats.\n\nThe popularity of the ketogenic diet has made it easier than ever to find a wide array of interesting and healthy keto meal ideas online.\n',
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
                    'Keto-Friendly Foods to Eat',
                    style: AppConstants.bulkinDaysTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'When following a ketogenic diet, meals and snacks should center around the following foods:\n\nEggs: Pastured, organic whole eggs make the best choice.\nPoultry: Chicken and turkey.\nFatty fish: Wild-caught salmon, herring and mackerel.\nMeat: Grass-fed beef, venison, pork, organ meats and bison.\nFull-fat dairy: Yogurt, butter and cream.\nFull- fat cheese: Cheddar, mozzarella, brie, goat cheese and cream cheese.\nNuts and seeds: Macadamia nuts, almonds, walnuts, pumpkin seeds, peanuts and flaxseeds.\nNut butter: Natural peanut, almond and cashew butters.\nHealthy fats: Coconut oil, olive oil, avocado oil, coconut butter and sesame oil.\nAvocados: Whole avocados can be added to almost any meal or snack.\nNon-starchy vegetables: Greens, broccoli, tomatoes, mushrooms and peppers.\nCondiments: Salt, pepper, vinegar, lemon juice, fresh herbs and spices.\n',
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
                    'Foods to Avoid',
                    style: AppConstants.bulkinDaysTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Avoid foods rich in carbs while following a keto diet.\n\nThe following foods should be restricted:\m\mBread and baked goods: White bread, whole-wheat bread, crackers, cookies, doughnuts and rolls.\nSweets and sugary foods: Sugar, ice cream, candy, maple syrup, agave syrup and coconut sugar.\nSweetened beverages: Soda, juice, sweetened teas and sports drinks.\nPasta: Spaghetti and noodles.\nGrains and grain products: Wheat, rice, oats, breakfast cereals and tortillas.\nStarchy vegetables: Potatoes, sweet potatoes, butternut squash, corn, peas and pumpkin.\nBeans and legumes: Black beans, chickpeas, lentils and kidney beans.\nFruit: Citrus, grapes, bananas and pineapple.\nHigh-carb sauces: Barbecue sauce, sugary salad dressings and dipping sauces.\nCertain alcoholic beverages: Beer and sugary mixed drinks.\n',
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