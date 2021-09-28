import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

import 'bulk_more_information_screen.dart';

class ToneMoreInformationScreen extends StatelessWidget {
  const ToneMoreInformationScreen({Key? key}) : super(key: key);

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
              title: 'Eggs any style',
              subtitle: 'Include: a glass of milk',
            ),
            DisplayContainer(
              title: 'Green tea',
              subtitle: 'Include: Fruit',
            ),
            DisplayContainer(
              title: 'Coffee',
              subtitle: 'Include: Grapefruit',
            ),
            DisplayContainer(
              title: 'Bananas and greek yoghurt',
              subtitle: '',
            ),
            DisplayContainer(
              title: 'Oatmeal',
              subtitle: 'Include: Chia seeds, flax seeds, greek yogurt and nuts',
            ),
            DisplayContainerScrollable(
              title: 'Eggs:',
              subtitle:
                  'Without a doubt, there are a multitude of benefits to eating eggs every day. Not only do eggs provide high quality protein, they also contain 11 vitamins and minerals, omega-3 fatty acids and antioxidants. And this means they can make a valuable contribution to daily nutrient requirements.\n\nMost of the protein in an egg can be found in the egg white, while the yolk contains healthy fats, vitamins, minerals and antioxidants.\n\nPlus, its biological value is nearly 100. What does that mean? The higher the biological value, the more similar the protein in the food is to the body’s own protein, which makes it easier for the body to transform it into muscle mass. Two hard-boiled eggs, for instance, are an ideal post-workout snack.\n\nJust one boiled egg contains:\n\n40% of your daily vitamin D requirements\n25% of your daily folate requirements\n12% of your daily riboflavin (Vitamin B2) requirements\n20% of your daily selenium requirements\nEggs also contain vitamins A, E, B5, B12, as well as iron, iodine and phosphorus. \n\nEggs provide us with very high-quality protein that contains all nine essential amino acids in the right amounts needed by the body for optimum growth and maintenance perfect for bulking. Some other foods contain proportionately more protein than eggs but it’s the quality of the protein in eggs that really stands out.\n\nEggs help increase levels of high-density lipoprotein (HDL), or “good” cholesterol as it’s commonly known. Higher levels of HDL can help reduce the risk of heart disease.',
            ),
            DisplayContainerScrollable(
              title: 'Milk:',
              subtitle:
                  'Since milk is a good source of calories, protein, and other nutrients, it offers a balanced approach to gaining weight.\n\nMilk is naturally high in calcium and often fortified with vitamin D — two nutrients that are vital to bone development and health. What’s more, it contains vitamin A, which promotes optimal eye health and supports your immune system.\n\nThe two main proteins in milk are whey and casein. Some studies show that these proteins may help reduce blood pressure and cholesterol levels — two risk factors for heart disease.\n\nIn addition, studies indicate that drinking milk after exercise may help build lean muscle and improve body composition instead of fat mass - specifically, the whey and casein proteins in cow’s milk.\n\nOne 12-week study in 10 young women found that drinking 24 ounces (1 liter) of skim milk after resistance exercise led to significantly greater muscle mass gains and fat loss compared to drinking a carb drink with the same number of calories (6Trusted Source).\n\nAnother study in 8 men observed that drinking approximately 2 cups (500 ml) of skim milk after resistance exercise led to significantly higher rates of muscle building compared to consuming a nutritionally similar soy beverage',
            ),
            DisplayContainerScrollable(
              title: 'Green tea:',
              subtitle:
                  'Take a look at the ingredients in almost any diet pill or fat-burning supplement and there’s a good chance you’ll spot green tea.\n\nGreen tea has been studied extensively for its metabolism and fat-burning capacities.\n\nFor instance, one small study in 23 people found that taking three capsules of green tea extract increased fat burning by 17% within just 30 minutes.\n\nAnother study in 10 adults showed that green tea extract sped up metabolism and increased calorie burning over a 24-hour period by 4%.\n\nSimilarly, a study in 31 adults found that consuming a beverage containing caffeine, calcium and certain compounds found in green tea three times daily for three days increased the number of calories burnt per day by 106 calories.\n\nThere are limitless ways to enjoy green tea in the morning. Try adding a squeeze of lemon, drizzling on a bit of honey or brewing your tea with ginger or mint to bring a tasty twist to your cup.',
            ),
            DisplayContainerScrollable(
              title: 'Berries:',
              subtitle:
                  'Berry varieties such as strawberries, blueberries, blackberries and raspberries are all incredibly nutrient-dense, meaning they’re low in calories but packed with essential nutrients.\n\nIn addition to providing many important vitamins and minerals, berries are rich in fiber, which may reduce hunger and food intake.\n\nIn fact, one study in 12 women found that swapping a high-sugar afternoon snack for a serving of mixed berries reduced calorie intake later in the day by an average of 133 calories.\n\nAnother study in 133,468 adults showed that each daily serving of berries was associated with 1.1 pounds (0.5 kg) of weight loss over a four-year period.\n\nAdd berries to your morning smoothie, oatmeal or yogurt to take advantage of their unique weight-busting benefits.',
            ),
            DisplayContainerScrollable(
              title: 'Coffee:',
              subtitle:
                  'Some studies have found that your morning cup of Joe could bring big weight loss benefits.\n\nBecause of its caffeine content, coffee may aid weight loss by boosting metabolism and fat burning.\n\nAccording to one small study in eight men, caffeine consumption increased metabolism by 13% and enhanced fat breakdown.\n\nAnother study in 58,157 adults showed that coffee may aid long-term weight control, as increased coffee intake was associated with less weight gain over a 12-year period.\n\nWhile coffee may not make a balanced breakfast all on its own, you can easily pair it with your favorite healthy breakfast foods to give your morning meal an upgrade.\n\nJust make sure not to overdo the sugar or creamer, as they add calories and negate some of coffee’s potential health-promoting properties.',
            ),
            DisplayContainerScrollable(
              title: 'Greek yogurt:',
              subtitle:
                  'Many of the potential health benefits of Greek yogurt relate to its high protein content. A protein-rich diet may help reduce hunger, boost metabolism, and build muscle. Greek yogurt is an excellent source of calcium, which can help improve bone health.\n\nStrained Greek yogurt is lower in sugar than regular yogurt. Removing the whey produces a thicker, creamier yogurt with a tart taste.\nSome manufacturers add thickening agents to regular yogurt, and market it as “Greek-style” yogurt, which may not share the same health benefits as Greek yogurt.\nAlso, low or no-fat Greek yogurt may not share the same health benefits as traditional Greek yogurt.\n\nGreek yogurt also contains probiotics. These are good bacteria that may restore a healthy bacterial balance within the gut.',
            ),
            DisplayContainerScrollable(
              title: 'Grapefruit:',
              subtitle:
                  'Grapefruits are a popular component of many diets and weight loss programs — and for good reason.\n\nBesides being low in calories, grapefruits have a high water and fiber content — both of which can be beneficial for weight loss.\n\nOne study in 91 obese adults showed that eating half a grapefruit before meals resulted in significant weight loss, compared to a control group.\n\nIn the 12-week study, participants who ate grapefruit lost an average of 3.5 pounds (1.6 kg) — about five times more than the control group.\n\nIn an 85-person study, consuming grapefruit or grapefruit juice before a meal for 12 weeks and pairing it with a low-calorie diet, decreased body fat mass by 1.1%, increased weight loss by 7.1% and reduced calorie intake by 20–29%.\n\nFresh grapefruit slices make a great addition to a well-rounded breakfast. You can also add grapefruit to parfaits, smoothies or fruit salads.\n\nHowever, if you are taking any drugs make sure to consult your doctor or pharmacist before eating grapefruit. Certain drugs may interact with grapefruit, potentially causing some adverse effects.',
            ),
            DisplayContainerScrollable(
              title: 'Bananas:',
              subtitle:
                  'High in fiber but low in calories, bananas are a great alternative to sugary breakfast cereals to satisfy your sweet tooth first thing in the morning.\n\nOne medium banana has just over 100 calories yet packs 3 grams of dietary fiber — knocking out up to 12% of your daily fiber needs in one shot.\n\nFiber helps slow the emptying of your stomach to curb cravings and keep you feeling fuller longer.\n\nMultiple studies have found that upping your intake of fiber from fruits and vegetables is associated with increased weight loss.\n\nAdditionally, unripe bananas are a good source of resistant starch, a type of starch that your stomach and small intestine don’t digest.\n\nResearch suggests that resistant starch may help reduce food intake and decrease belly fat.\n\nBananas can be enjoyed alone or sliced as a topping for yogurt, cottage cheese or oatmeal. You can also add unripe, green bananas to your morning smoothie for a hearty dose of resistant starch.',
            ),
            DisplayContainerScrollable(
              title: 'Oatmeal:',
              subtitle:
                  'Oatmeal is a healthy and delicious breakfast option, especially if you’re looking to lose weight.\n\nOats are low in calories but high in fiber and protein — two nutrients that impact appetite and weight control.\n\nIn particular, oats are an excellent source of beta-glucan, a type of fiber shown to impact everything from immune function to heart health.\n\nResearch shows that beta-glucan can balance blood sugar levels, working to prevent spikes and crashes that may drive up your appetite.\n\nOne small study in 14 overweight adults also showed that consuming higher amounts of beta-glucan led to higher levels of peptide YY, a hormone that regulates food intake by reducing appetite.\n\nTry combining one cup (235 grams) of cooked oatmeal with a one-half cup (74 grams) of berries, one tablespoon (7 grams) of ground flaxseed and a handful of almonds for a power-packed, high-fiber morning meal.',
            ),
            DisplayContainerScrollable(
              title: 'Chia seeds:',
              subtitle:
                  'Tiny but powerful, chia seeds are an excellent breakfast supplement.\n\nThey’re high in fiber and can absorb water to form a gel, which expands in your stomach to help keep you feeling fuller longer.\n\nThey’re also rich in protein, which can slow the emptying of your stomach and reduce levels of ghrelin, the hormone responsible for stimulating hunger.\n\nOne study in 11 adults found that eating chia seeds baked into white bread reduced both appetite and blood sugar levels.\n\nAnother 12-week study in 19 people showed that 35 grams of chia flour daily significantly reduced body weight and waist circumference.\n\nTry making a chia seed breakfast parfait by mixing one ounce (28 grams) of chia seeds with one cup (245 grams) of yogurt in a bowl or mason jar.\n\nLet the mixture soak for about 30 minutes to allow the seeds to swell, then top it off with a one-half cup (74 grams) of your favorite berries.\n\nChia seeds also make a delicious and nutritious addition to tea, smoothies or overnight oats.',
            ),
            DisplayContainerScrollable(
              title: 'Flax seeds:',
              subtitle:
                  'Flaxseeds are loaded with viscous fiber, a type of soluble fiber that absorbs water to form a gel in your gut.\n\nStudies show that soluble fiber is especially effective at slowing digestion, which could help decrease appetite and lower calorie intake to aid weight loss.\n\nResearch suggests that adding flaxseed to your diet can have a powerful effect on weight loss and appetite control.\n\nOne small study found that consuming a drink made with flax seeds increased feelings of fullness and reduced appetite, compared to a sugar-sweetened beverage.\n\nSimilarly, a study in 18 men showed that bread buns with added flaxseed fiber suppressed appetite and enhanced fullness more than regular buns.\n\nFlaxseeds are versatile and easy to enjoy. Ground flaxseeds can be sprinkled over cereal, used to thicken up your morning smoothie or even mixed into water to boost your fiber intake.',
            ),
            DisplayContainerScrollable(
              title: 'Nuts:',
              subtitle:
                  'Nuts provide the perfect balance of fiber, protein and heart-healthy fats, making them a worthy addition to any breakfast.\n\nA one-year study in 169 people showed that adding nuts to a Mediterranean diet significantly decreased waist circumference, compared to a control group .\n\nAnother study in 65 adults compared the effects of a low-calorie diet including three ounces (84 grams) of almonds per day to a low-calorie diet including complex carbs.\n\nBoth diets contained an equal amount of calories and protein. Yet, by the end of the 24-week study, those consuming almonds had lost 62% more weight and 56% more body fat than those consuming complex carbs.\n\nKeep in mind that nuts are also very calorie-dense, so limit your intake to about one ounce (28 grams) at a time to keep the calories from stacking up.\n\nMix a serving of nuts into yogurt, cottage cheese or homemade granola to bring your breakfast to the next level in terms of nutrition.',
            ),
            SizedBox(
              height: 10,
            ),
            Text('Cardio', style: AppConstants.labelStyle),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Cardio is one of the best and most popular types of exercises people perform. However, a lot of people despise cardio in any form. Even though you may not find the physical activity of cardio enjoyable, it has a lot of major health benefits, such as;\nWeight loss, heart health, lung capacity, naturally boosts energy, mental health, better sleep and helps the immune system.\nThis program contains easy and quick cardio with great and recognisable benefits.',
                style: AppConstants.labelStyle.copyWith(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A brisk run/walk to start your day:',
                    style: AppConstants.bulkinDaysTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'When it comes to exercise, the best time of day to get in a workout session is one that you can do consistently. Everyone is different. The “right” time depends on factors like your preference, lifestyle, and body.\n\nWhile there isn’t a one-size-fits-all answer, morning workouts do have some benefits. Let’s look at the potential perks of an early sweat session.\n\n\n1. More overall energy\n\nRegular exercise is excellent for boosting energy and reducing fatigue. When you work out, oxygen and nutrients travel to your heart and lungs. This improves your cardiovascular system, endurance, and overall stamina.\n\nBy exercising early, you may feel more energized throughout the day.\n\n\n2. Increased alertness\n\nA morning workout may be a better match for your body’s hormonal fluctuations.\n\nCortisol is a hormone that keeps you awake and alert. It’s often called the stress hormone, but it only causes problems when there’s too much or too little of it.\n\nTypically, cortisol increases in the morning and drops in the evening. It reaches its peak around 8 a.m.\n\n\nIf you have a healthy circadian rhythm, your body might be more primed to exercise at this time.\n\n\n3. Better focus\n\nPhysical activity also improves focus and concentration, regardless of when you do it. But if you have trouble focusing during the day, a morning workout might be just the ticket.\n\nA 2019 study published in the British Journal of Sports Medicine found that morning exercise improves attention, visual learning, and decision-making.\n\nIn the study, participants completed a round of 8-hour days of prolonged sitting with and without a 30-minute morning walk on the treadmill. On some days, they also took 3-minute walking breaks every 30 minutes.\n\nThe days with morning exercise were associated with better cognition throughout the day, especially when paired with regular breaks.\n\n\n4. Support weight loss\n\nEarly workouts may be best for losing weight, according to a small 2015 study published in EBioMedicineTrusted Source.\n\nIn the study, 10 young men exercised in the morning, afternoon, and evening over separate sessions. The researchers found that 24-hour fat burn was highest when they exercised in the morning before breakfast.\n\nIf you’re looking to lose weight, morning exercise may help.\n\n\n\n5. Blood pressure management\n\nIn the United States, 1 in 3 adultsTrusted Source have hypertension, or high blood pressure. Physical activity is one of the best ways to naturally control hypertension. But according to a small 2014 study published in Vascular Health and Risk ManagementTrusted Source, exercising in the morning may be the best move.\n\nOver three separate sessions, 20 prehypertensive adults exercised on a treadmill at 7 a.m., 1 p.m., and 7 p.m. The participants also wore a medical device to monitor their blood pressure response.\n\nThe researchers found that the most favorable blood pressure changes happened on the 7 a.m. workout days.\n\n\n6. Healthier food choices\n\nAn early morning workout could set the tone for a healthier day.\n\nIn a 2018 study published in the International Journal of ObesityTrusted Source, 2,680 college students completed a 15-week exercise program. Each week involved three 30-minute sessions of cardio.\n\nThe students weren’t asked to change their eating patterns. Yet, those who stuck with the program made healthier food choices, like eating less red meat and fried foods.\n\nWhile the study didn’t test for the best time of day to exercise, the findings show how exercise can inspire healthier eating. Working out early may encourage you to make healthier choices throughout the day.\n\n\n7. Blood glucose control\n\nPhysical activity is an important part of managing type 1 diabetes (T1DM). But for people with T1DM, it can be challenging to work out. Exercise poses the risk of hypoglycemia, or low blood glucose.\n\nA 2015 study published in the Journal of Diabetes Science and TechnologyTrusted Source found that morning exercise lowers that risk. In the study, 35 adults with T1DM did two separate sessions of morning and afternoon treadmill workouts.\n\nCompared to the afternoon sessions, morning workouts presented a lower risk of hypoglycemic events after activity.\n\nThe researchers think cortisol may be at play. Aside from increasing alertness, cortisol also helps control blood sugar. Lower levels, which occur later in the day, could make it easier for hypoglycemia to develop.\n\n\n8. Appetite control\n\nIn general, exercise helps regulate your appetite by reducing ghrelin, the hunger hormone. It also increases satiety hormones, like peptide YY and glucagon-like peptide-1.\n\nHowever, working out in the morning may control your appetite even further.\n\nIn a 2012 study published in Medicine & Science in Sports & ExerciseTrusted Source, 35 women walked on a treadmill for 45 minutes in the morning. Next, researchers measured the women’s brain waves as they viewed photos of flowers (the control) and food.\n\nA week later, the process was repeated without morning exercise. The researchers found that the women’s brains had a stronger response to food photos when they didn’t exercise in the morning.\n\nThis suggests that morning workouts may improve how your brain responds to food cues.\n\n\n9. Increased overall activity\n\nThe perks of an early workout don’t stop in the morning. According to the same 2012 study in Medicine & Science in Sports & ExerciseTrusted Source, morning exercise is associated with more movement throughout the day.\n\nAfter walking for 45 minutes in the morning, the participants showed an increase in physical activity over the next 24 hours.\n\nIf you’re trying to live a more active lifestyle, morning exercise may lend a hand.\n\n\n10. Better mood\n\nPhysical activity is a natural remedy for stress. During exercise, your brain makes more endorphins, the “feel-good” neurotransmitters behind a runner’s high. It also doubles as a distraction from anxious thoughts.\n\nMorning exercise is a great way to start the day on the positive note. You’ll also feel a sense of accomplishment, giving you an optimistic outlook for the day.\n\n\n\11. Improved sleep\n\nGetting an early workout might be just what you need to get a good night’s rest. The same 2014 study in Vascular Health and Risk ManagementTrusted Source demonstrated that adults got better sleep on the days they exercised at 7 a.m.\n\nAfter the morning workout, the participants spent more time in deep sleep and experienced fewer nighttime awakenings. It also took them less time to fall asleep.\n\nExercising outside in the morning offers even more sleep-related perks. Light exposure early in the day may help increase melatonin levels at night.\n',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}