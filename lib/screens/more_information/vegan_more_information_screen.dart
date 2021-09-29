import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

import 'bulk_more_information_screen.dart';

class VeganMoreInformationScreen extends StatelessWidget {
  const VeganMoreInformationScreen({Key? key}) : super(key: key);
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
              title: 'Breakfast: Oats ',
              subtitle: 'Include: Apple slices, pumpkin seeds, cinnamon, and nut butter',
            ),
            DisplayContainer(
              title: 'Breakfast: sweet potato toast ',
              subtitle: 'Include: Peanut butter and banana',
            ),
            SizedBox(
              height: 10,
            ),
            Text('Lunches', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(title: 'Lunch: Whole-grain pasta ', subtitle: 'Include: Lentils and a salad'),
            DisplayContainer(title: 'Lunch: Sweet potato wedges', subtitle: 'Include: Steamed broccoli '),
            DisplayContainer(
                title: 'Lunch: Salad ', subtitle: 'Include: Quinoa, avocados, tomatoes, onions, beans, and cilantro'),
            SizedBox(
              height: 10,
            ),
            Text('Dinners', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(title: 'Dinner: Cauliflower and chickpea tacos', subtitle: 'Include: Guacamole'),
            DisplayContainer(
                title: 'Dinner: Mediterranean lentil salad ',
                subtitle: 'Include: Cucumbers, olives, peppers and sun-dried tomatoes'),
            DisplayContainer(title: 'Dinner: Baked tofu ', subtitle: 'Include: Kale and chickpeas'),
            DisplayContainer(
                title: 'Bean and Vegetable Soup',
                subtitle: 'Include: Sautéed red cabbage, Brussels sprouts, and couscous'),
            DisplayContainer(
                title: 'Dinner: Bean salad ',
                subtitle: 'Include: Black-eyed peas, tomatoes, corn, bell peppers, and onions'),
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
                    'Although a well-rounded vegan diet can be healthy and nutritious, a vegan diet that is not properly planned can harm your health.\n\nHere are a few factors that you may want to consider when starting a vegan diet.',
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Supplements',
                    style: AppConstants.bulkinDaysTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'It can be challenging to meet your nutritional needs while following a vegan diet.\n\nCertain nutrients like vitamin B12, vitamin D, and iodine, are found primarily in animal products and certain fortified foods.\n\nPlus, while non-heme iron occurs in a variety of plant foods, it may not be as well absorbed as the heme iron found in animal products.\n\nTaking a multivitamin or other supplements can help fill in any nutritional gaps and provide key micronutrients that you may be missing.\n\nFor best results, look for a multivitamin that contains vitamin B12, zinc, iron, vitamin D, and calcium.\n\nKeep in mind that it’s typically recommended to supplement with higher amounts of vitamin B12 than the Recommended Dietary Allowance (RDA), as your body is only able to absorb a small amount at a time.\n\nTry to aim for 2,000–2,500 mcg of vitamin B12 per week. This can be divided into several smaller doses and may require a separate supplement in addition to your multivitamin.\n\nYou may also want to consider taking algal oil, a plant-based form of omega-3 fatty acid. Your body needs this kind of fat for optimal heart health, brain function, and disease prevention.\n\nSupplements like vegan B12 and algal oil can be commonly found online.\n\n',
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
                    'The bottom line',
                    style: AppConstants.bulkinDaysTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Well-rounded vegan diets are healthy, nutritious, and associated with a number of health benefits, including improved heart health, blood sugar, and body mass.\n\nFollowing a vegan meal plan can help you incorporate many nutrient-rich, whole foods into your diet to provide your body with the nutrients it needs.\n\nKeep in mind that supplements and proper planning are essential to avoid deficiencies in several critical nutrients\n',
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
