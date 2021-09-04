import 'package:flutter/material.dart';

import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class SnacksScreen extends StatelessWidget {
  const SnacksScreen({Key? key}) : super(key: key);

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
              subTitle: 'SNACKS',
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Text(
              'Remember:',
              style: AppConstants.topBarTextStyle.copyWith(
                color: AppColors.darkerBlueBorder,
              ),
            ),
            Text(
              'Everything in moderation!',
              style: AppConstants.buttonTextStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Here are some healthy snacks for you to fill in the gaps with if you get hungry.',
                style: AppConstants.bulkinDaysTextStyle.copyWith(
                  color: Theme.of(context).dividerColor == Colors.black ? AppColors.lightBlackHeading : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SnacksContainer(
              size: size,
              title: 'Mixed Nuts',
              description:
                  'Nuts are an ideal nutritious snack. They’re linked to a reduced risk of heart disease and may help prevent certain cancers, depression, and other illnesses. Despite being relatively high in fat, they are very filling. Nuts provide the perfect balance of healthy fat, protein, and fibre. They contain 180 calories in a 1-ounce (28-gram) serving, on average. A daily handful or two of nuts like almonds, cashews, walnuts or pecans can add enough calories to your diet to support healthy weight gain.',
            ),
            SnacksContainer(
              size: size,
              title: 'Red Bell Pepper',
              description:
                  'Red bell peppers are extremely healthy. Although all bell peppers are nutritious, red varieties are particularly high in antioxidants like beta carotene, capsanthin, and quercetin. They’re are also rich in vitamin C. In fact, 1 large red bell pepper contains over 300% of the daily value for this nutrient.',
            ),
            SnacksContainer(
              size: size,
              title: 'Celery Sticks',
              description:
                  'Celery sticks with cream cheese are a classic low-carb, filling snack. Celery contains luteolin, an antioxidant that reduces inflamation and may help prevent cancer. Five small celery sticks harbours fewer than 100 calories.',
            ),
            SnacksContainer(
              size: size,
              title: 'Dark Chocolate and Almonds',
              description:
                  'Dark chocolate is loaded with flavanols that may lower blood pressure and reduce heart disease risk, provided the chocolate contains at least 70% cocoa. Almonds are high in heart-healthy monounsaturated fat and have beneficial effects on blood sugar control. Studies also show that they can reduce appetite and help you lose weight. Both dark chocolate and almonds are high in magnesium. One ounce (30 grams) of each provides about 300 calories in total, so it should not be a common snack.',
            ),
            SnacksContainer(
              size: size,
              title: 'Olives',
              description:
                  'They are very high in monounsaturated fats and provide powerful antioxidants like oleuropein.\nThe plant compounds in olives may reduce inflammation, insulin resistance, and cancer risk Depending on their size, 25 green or black olives have 100–175 calories.',
            ),
            SnacksContainer(
              size: size,
              title: 'Avocados',
              description:
                  'Avocados are among the most nutritious and satisfying foods on the planet.\nStudies show that they can help lower LDL (bad) cholesterol, improve symptoms of arthritis, and protect your skin from sun damage. \nWhat’s more, avocados are high in fibre, potassium, magnesium, and monounsaturated fat.\nSprinkle half a medium avocado with salt and a dash of cayenne pepper for a savoury, filling snack with around 130 calories.',
            ),
            SnacksContainer(
              size: size,
              title: 'Sun-dried tomatoes',
              description:
                  'Sun-dried tomatoes contain more lycopene than regular tomatoes.\nWhat’s more, they are usually packed in olive oil, which helps your body absorb more of their lycopene.\nA 3.5-ounce (100-gram) serving of sun-dried tomatoes packed in oil provides 170% of the DV for vitamin C and just over 200 calories.',
            ),
            SnacksContainer(
              size: size,
              title: 'Carrots',
              description:
                  'Carrots are among the best sources of carotenoids, including beta carotene, which your body can convert into vitamin A.\nThe carotenoids in carrots may reduce your risk of cancer, heart disease, and cataracts.\nYou could pair carrots with a creamy salad dressing or dip because fat increases your absorption of carotenoids.\nA 3.5-ounce (100-gram) serving of baby carrots with 2 tablespoons (30 grams) of blue cheese dressing provides about 200 calories.',
            ),
            SnacksContainer(
              size: size,
              title: 'Fruit',
              description:
                  'Healthy snacks don’t need to be complicated. Just a single piece of fruit can be incredibly satisfying.\n\nPortable, easy-to-eat fruits include bananas, apples, pears, grapes, grapefruit, and oranges.\n\nBlueberries are low in calories. 100 g has only about 40 calories. The purple berries are also antioxidants. This means that they fight free radicals in your body, which is especially important for regular training. Blueberries taste great in smoothies or together with rolled oats and plain or soy yogurt.',
            ),
            SnacksContainer(
              size: size,
              title: 'Dried unsweetened coconut',
              description:
                  'It’s high in fat, including medium-chain fats that may increase metabolism, promote weight loss, and improve brain function in people with impaired memory.\nMake sure to get the unsweetened type, since many packaged options harbor sugar. Unsweetened dried coconut packs about 185 calories in 1 ounce (28 grams).',
            ),
            SnacksContainer(
              size: size,
              title: 'Grapefruit',
              description:
                  'Besides being low in calories, grapefruits have a high water and fiber content — both of which can be beneficial for weight loss.\n\nOne study in 91 obese adults showed that eating half a grapefruit before meals resulted in significant weight loss, compared to a control group.\n\nIn the 12-week study, participants who ate grapefruit lost an average of 3.5 pounds (1.6 kg) — about five times more than the control group.\n\nIn an 85-person study, consuming grapefruit or grapefruit juice before a meal for 12 weeks and pairing it with a low-calorie diet, decreased body fat mass by 1.1%, increased weight loss by 7.1% and reduced calorie intake by 20–29%.\n\nFresh grapefruit slices make a great addition to a well-rounded breakfast. You can also add grapefruit to parfaits, smoothies or fruit salads.\n\nHowever, if you are taking any drugs make sure to consult your doctor or pharmacist before eating grapefruit. Certain drugs may interact with grapefruit, potentially causing some adverse effects.',
            ),
            SnacksContainer(
              size: size,
              title: 'Grapefruit',
              description:
                  'Besides being low in calories, grapefruits have a high water and fiber content — both of which can be beneficial for weight loss.\n\nOne study in 91 obese adults showed that eating half a grapefruit before meals resulted in significant weight loss, compared to a control group.\n\nIn the 12-week study, participants who ate grapefruit lost an average of 3.5 pounds (1.6 kg) — about five times more than the control group.\n\nIn an 85-person study, consuming grapefruit or grapefruit juice before a meal for 12 weeks and pairing it with a low-calorie diet, decreased body fat mass by 1.1%, increased weight loss by 7.1% and reduced calorie intake by 20–29%.\n\nFresh grapefruit slices make a great addition to a well-rounded breakfast. You can also add grapefruit to parfaits, smoothies or fruit salads.\n\nHowever, if you are taking any drugs make sure to consult your doctor or pharmacist before eating grapefruit. Certain drugs may interact with grapefruit, potentially causing some adverse effects.',
            ),
            SizedBox(
              height: 30,
            ),
            Divider(),
            SizedBox(
              height: 30,
            ),
            Text(
              'The Bottom Line',
              style: AppConstants.nameTextStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Text(
                '''When your next craving hits, aim for whole foods instead of highly processed, fattening options.\n\nHaving some healthy and nutritious options in reach can stave off your appetite and help boost weight loss.''',
                style: AppConstants.bulkinDaysTextStyle.copyWith(
                  color: Theme.of(context).dividerColor == Colors.black ? AppColors.lightBlackHeading : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SnacksContainer extends StatelessWidget {
  const SnacksContainer({
    Key? key,
    required this.size,
    required this.title,
    required this.description,
  }) : super(key: key);

  final Size size;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.45,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.darkerBlueBorder,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppConstants.buttonTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: AppConstants.bulkinDaysTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
