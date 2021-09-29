import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

import 'bulk_more_information_screen.dart';

class VegetarianMoreInformationScreen extends StatelessWidget {
  const VegetarianMoreInformationScreen({Key? key}) : super(key: key);
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
              title: 'Breakfast: Coconut yogurt ',
              subtitle: 'Include: Berries, walnuts, and chia seeds',
            ),
            DisplayContainer(
              title: 'Breakfast: Oatmeal ',
              subtitle: 'Include: Fruit and flaxseeds',
            ),
            DisplayContainer(
              title: 'Breakfast: Scrambled eggs',
              subtitle: 'Include: Tomatoes, garlic and mushrooms',
            ),
            DisplayContainer(
              title: 'Breakfast: Greek yogurt',
              subtitle: 'Include: Chia seeds and berries',
            ),
            SizedBox(
              height: 10,
            ),
            Text('Lunches', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(title: 'Lunch: Whole-grain pasta ', subtitle: 'Include: Lentils and a salad'),
            DisplayContainer(title: 'Lunch:  Veggie and hummus wrap', subtitle: 'Include: Sweet potato fries'),
            DisplayContainer(title: 'LLunch: Zucchini boats', subtitle: 'Include: Veggies and feta'),
            DisplayContainer(
                title: 'Lunch: Salad', subtitle: 'Include: Tomatoes, cucumber and feta with spiced lentil soup'),
            DisplayContainer(
                title: 'Lunch: Burrito bowl', subtitle: 'Include: Brown rice, beans, avocado, salsa and veggies'),
            SizedBox(
              height: 10,
            ),
            Text('Dinners', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(title: 'Dinner: Cauliflower and chickpea tacos', subtitle: 'Include: Guacamole'),
            DisplayContainer(title: 'Dinner: Eggplant parmesan', subtitle: 'Include: A side salad'),
            DisplayContainer(title: 'Dinner: Baked tofu ', subtitle: 'Include: Kale and chickpeas'),
            DisplayContainer(title: 'Dinner: Chickpea curry', subtitle: 'Include: Basmati rice'),
            DisplayContainer(title: 'Dinner: Flatbread', subtitle: 'Include: Grilled garden vegetables and pesto'),
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
                    'Potential downsides and precautions',
                    style: AppConstants.bulkinDaysTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'well-rounded vegetarian diet can be healthy and nutritious.\n\nHowever, it may also increase your risk of certain nutritional deficiencies.\n\nMeat, poultry and fish supply a good amount of protein and omega-3 fatty acids, as well as micronutrients like zinc, selenium, iron and vitamin B12.\n\nOther animal products like dairy and eggs also contain plenty of calcium, vitamin D and B vitamins.\n\nWhen cutting meat or other animal products from your diet, it’s important to ensure you’re getting these essential nutrients from other sources.\n\nStudies show that vegetarians are at a higher risk of protein, calcium, iron, iodine and vitamin B12 deficiencies.\n\nA nutritional deficiency in these key micronutrients can lead to symptoms like fatigue, weakness, anemia, bone loss and thyroid issues.\n\nIncluding a variety of fruits, vegetables, whole grains, protein sources and fortified foods is an easy way to ensure you’re getting appropriate nutrition.\n\nMultivitamins and supplements are another option to quickly bump up your intake and compensate for potential deficiencies.\n\nThe Healthy Me vegetarian diet includes food that gives vegetarians access to vital substances imperative for health.\n\n\nHere are vegetarian sources of omega-3s:\n\nFlaxseed oil	                 -        7.2 per 1 tablespoon\nChia seeds.                   -        5.1 per 1 ounce\nGround flaxseed	      -        1.6 per 1 tablespoon\nHulled hemp seed	      -        0.9 per 1 tablespoon\nRapeseed oil	      -        1.3 per 1 tablespoon\nWalnuts	                 -        2.5 per 1 ounce\n\nHere are some meat-free sources of vitamin B-12:\n\nEggs	                 	                  1.5-1.6 per two cooked\nMilk	                 	                  (skim, 1%, 2%, 3.3%) 1.2-1.4 per 1 cup\nCottage cheese	                 1.1-1.5 per 1 cup\nSwiss cheese	                 1.7 per 50 grams\nFeta		                            0.7-0.9 per 50 grams\nGouda 		                 0.7-0.9 per 50 grams\nEdam 		                 0.7-0.9 per 50 grams\nGruyere 		                 0.7-0.9 per 50 grams\nBrie 		                                       0.7-0.9 per 50 grams\nCheddar 		                 0.7-0.9 per 50 grams\nFontina 		                 0.7-0.9 per 50 grams\nMozzarella 		                 0.7-0.9 per 50 grams\nProvolone		                 0.7-0.9 per 50 grams\nFortified soy 	                 1.0 per 1 cup\nRice 	                 	                 1.0 per 1 cup\nOat 	                 	                 1.0 per 1 cup\nAlmond beverages	      1.0 per 1 cup\nSoy burger	                 	      1.8 per 75 grams\n\n\nHere are some meat-free sources of protein:\n\nPlain Greek yogurt	                 17 per 6 ounces\nCottage cheese	                 14 per ½ cup\nCooked lentils	                 12 per ½ cup\nCooked beans                         8 per ½ cup\nMilk	                     	                  8 per 1 cup\nCooked whole grain pasta     8 per 1 cup\nNuts                  	                 7 per ¼ cup\nEggs                                         6 per 1 egg\nCooked quinoa	                 4 per ½ cup',
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
                    'Nutritional deficiencies',
                    style: AppConstants.bulkinDaysTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Vegan diets may be associated with an increased risk of several nutritional deficiencies.\n\nThis is because meat, fish, and poultry are rich in several important nutrients that are mostly lacking in plant-based foods, including protein, iron, zinc, vitamin B12, phosphorus, and omega-3 fatty acids.\n\nAnimal products like eggs and dairy are also high in protein and micronutrients like calcium, potassium, phosphorus, iodine, iron, and magnesium.\n\nCompletely cutting these foods out of your diet can increase your risk of nutritional deficiencies.\n\In particular, vegans may be at a higher risk of deficiency for vitamin B12, vitamin D, calcium, iodine, iron, and protein.n\n\nThis can lead to an increased risk of issues like anemia, weakened bones, and impaired immunity.\n\nLow levels of vitamin B12 can be especially concerning during pregnancy, as a deficiency could potentially increase the risk of neural tube defects and impair your baby’s brain and nervous system.\n\nIncluding a variety of nutrient-rich ingredients and fortified foods in your diet is necessary to ensure you’re meeting your nutritional needs.\n\nVitamin B12 and vitamin D can be found in fortified foods, such as plant-based milks, cereals, and nutritional yeast.\n\nMeanwhile, protein, zinc, and iron are found in legumes, soy products, nuts, and seeds.\n\nIncluding moderate amounts of iodized salt in your diet can also help you meet your needs for iodine.\n',
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
