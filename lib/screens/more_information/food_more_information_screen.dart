import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

import 'bulk_more_information_screen.dart';

class FoodMoreInformationScreen extends StatelessWidget {
  const FoodMoreInformationScreen({Key? key}) : super(key: key);

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
              title: 'Smoothie',
              subtitle: 'Include: Vegetables, berries and fruit',
            ),
            DisplayContainer(
              title: 'Bananas and greek yoghurt',
              subtitle: '',
            ),
            DisplayContainer(
              title: 'Coffee',
              subtitle: 'Include: Grapefruit',
            ),
            DisplayContainer(
              title: 'Oatmeal',
              subtitle: 'Include: Chia seeds, flax seeds, greek yogurt and nuts',
            ),
            DisplayContainerScrollable(
              title: 'Green tea:',
              subtitle:
                  'Take a look at the ingredients in almost any diet pill or fat-burning supplement and there???s a good chance you???ll spot green tea.\n\nGreen tea has been studied extensively for its metabolism and fat-burning capacities.\n\nFor instance, one small study in 23 people found that taking three capsules of green tea extract increased fat burning by 17% within just 30 minutes.\n\nAnother study in 10 adults showed that green tea extract sped up metabolism and increased calorie burning over a 24-hour period by 4%.\n\nSimilarly, a study in 31 adults found that consuming a beverage containing caffeine, calcium and certain compounds found in green tea three times daily for three days increased the number of calories burnt per day by 106 calories.\n\nThere are limitless ways to enjoy green tea in the morning. Try adding a squeeze of lemon, drizzling on a bit of honey or brewing your tea with ginger or mint to bring a tasty twist to your cup.',
            ),
            DisplayContainerScrollable(
              title: 'Smoothies:',
              subtitle:
                  'Not only are smoothies a quick and easy way to obtain a concentrated dose of nutrients, they also double as a convenient breakfast item that can accelerate weight loss.\n\nSince you can customize your ingredients, you can tailor your drink to fit your personal preferences.\n\nFilling your smoothies with veggies and low-calorie fruits can boost fiber intake to help you feel fuller longer.\n\nThrow in some high-protein ingredients like nuts, seeds or protein powder to promote feelings of fullness and fight off cravings.\n\nHowever, keep in mind that smoothies can quickly turn into calorie bombs if you overdo the high-calorie ingredients.\n\nFor an easy weight loss smoothie, blend one cup (240 ml) of milk with a handful of leafy greens, two tablespoons (28 grams) of chia seeds and one cup (144 grams) of strawberries.\n\nEnjoy your smoothie throughout the morning to resist snacking and combat cravings.',
            ),
            DisplayContainerScrollable(
              title: 'Berries:',
              subtitle:
                  'Berry varieties such as strawberries, blueberries, blackberries and raspberries are all incredibly nutrient-dense, meaning they???re low in calories but packed with essential nutrients.\n\nIn addition to providing many important vitamins and minerals, berries are rich in fiber, which may reduce hunger and food intake.\n\nIn fact, one study in 12 women found that swapping a high-sugar afternoon snack for a serving of mixed berries reduced calorie intake later in the day by an average of 133 calories.\n\nAnother study in 133,468 adults showed that each daily serving of berries was associated with 1.1 pounds (0.5 kg) of weight loss over a four-year period.\n\nAdd berries to your morning smoothie, oatmeal or yogurt to take advantage of their unique weight-busting benefits.',
            ),
            DisplayContainerScrollable(
              title: 'Coffee:',
              subtitle:
                  'Some studies have found that your morning cup of Joe could bring big weight loss benefits.\n\nBecause of its caffeine content, coffee may aid weight loss by boosting metabolism and fat burning.\n\nAccording to one small study in eight men, caffeine consumption increased metabolism by 13% and enhanced fat breakdown.\n\nAnother study in 58,157 adults showed that coffee may aid long-term weight control, as increased coffee intake was associated with less weight gain over a 12-year period.\n\nWhile coffee may not make a balanced breakfast all on its own, you can easily pair it with your favorite healthy breakfast foods to give your morning meal an upgrade.\n\nJust make sure not to overdo the sugar or creamer, as they add calories and negate some of coffee???s potential health-promoting properties.',
            ),
            DisplayContainerScrollable(
              title: 'Greek yogurt:',
              subtitle:
                  'Many of the potential health benefits of Greek yogurt relate to its high protein content. A protein-rich diet may help reduce hunger, boost metabolism, and build muscle. Greek yogurt is an excellent source of calcium, which can help improve bone health.\n\nStrained Greek yogurt is lower in sugar than regular yogurt. Removing the whey produces a thicker, creamier yogurt with a tart taste.\nSome manufacturers add thickening agents to regular yogurt, and market it as ???Greek-style??? yogurt, which may not share the same health benefits as Greek yogurt.\nAlso, low or no-fat Greek yogurt may not share the same health benefits as traditional Greek yogurt.\n\nGreek yogurt also contains probiotics. These are good bacteria that may restore a healthy bacterial balance within the gut.',
            ),
            DisplayContainerScrollable(
              title: 'Grapefruit:',
              subtitle:
                  'Grapefruits are a popular component of many diets and weight loss programs ??? and for good reason.\n\nBesides being low in calories, grapefruits have a high water and fiber content ??? both of which can be beneficial for weight loss.\n\nOne study in 91 obese adults showed that eating half a grapefruit before meals resulted in significant weight loss, compared to a control group.\n\nIn the 12-week study, participants who ate grapefruit lost an average of 3.5 pounds (1.6 kg) ??? about five times more than the control group.\n\nIn an 85-person study, consuming grapefruit or grapefruit juice before a meal for 12 weeks and pairing it with a low-calorie diet, decreased body fat mass by 1.1%, increased weight loss by 7.1% and reduced calorie intake by 20???29%.\n\nFresh grapefruit slices make a great addition to a well-rounded breakfast. You can also add grapefruit to parfaits, smoothies or fruit salads.\n\nHowever, if you are taking any drugs make sure to consult your doctor or pharmacist before eating grapefruit. Certain drugs may interact with grapefruit, potentially causing some adverse effects.',
            ),
            DisplayContainerScrollable(
              title: 'Bananas:',
              subtitle:
                  'High in fiber but low in calories, bananas are a great alternative to sugary breakfast cereals to satisfy your sweet tooth first thing in the morning.\n\nOne medium banana has just over 100 calories yet packs 3 grams of dietary fiber ??? knocking out up to 12% of your daily fiber needs in one shot.\n\nFiber helps slow the emptying of your stomach to curb cravings and keep you feeling fuller longer.\n\nMultiple studies have found that upping your intake of fiber from fruits and vegetables is associated with increased weight loss.\n\nAdditionally, unripe bananas are a good source of resistant starch, a type of starch that your stomach and small intestine don???t digest.\n\nResearch suggests that resistant starch may help reduce food intake and decrease belly fat.\n\nBananas can be enjoyed alone or sliced as a topping for yogurt, cottage cheese or oatmeal. You can also add unripe, green bananas to your morning smoothie for a hearty dose of resistant starch.',
            ),
            DisplayContainerScrollable(
              title: 'Oatmeal:',
              subtitle:
                  'Oatmeal is a healthy and delicious breakfast option, especially if you???re looking to lose weight.\n\nOats are low in calories but high in fiber and protein ??? two nutrients that impact appetite and weight control.\n\nIn particular, oats are an excellent source of beta-glucan, a type of fiber shown to impact everything from immune function to heart health.\n\nResearch shows that beta-glucan can balance blood sugar levels, working to prevent spikes and crashes that may drive up your appetite.\n\nOne small study in 14 overweight adults also showed that consuming higher amounts of beta-glucan led to higher levels of peptide YY, a hormone that regulates food intake by reducing appetite.\n\nTry combining one cup (235 grams) of cooked oatmeal with a one-half cup (74 grams) of berries, one tablespoon (7 grams) of ground flaxseed and a handful of almonds for a power-packed, high-fiber morning meal.',
            ),
            DisplayContainerScrollable(
              title: 'Chia seeds:',
              subtitle:
                  'Tiny but powerful, chia seeds are an excellent breakfast supplement.\n\nThey???re high in fiber and can absorb water to form a gel, which expands in your stomach to help keep you feeling fuller longer.\n\nThey???re also rich in protein, which can slow the emptying of your stomach and reduce levels of ghrelin, the hormone responsible for stimulating hunger.\n\nOne study in 11 adults found that eating chia seeds baked into white bread reduced both appetite and blood sugar levels.\n\nAnother 12-week study in 19 people showed that 35 grams of chia flour daily significantly reduced body weight and waist circumference.\n\nTry making a chia seed breakfast parfait by mixing one ounce (28 grams) of chia seeds with one cup (245 grams) of yogurt in a bowl or mason jar.\n\nLet the mixture soak for about 30 minutes to allow the seeds to swell, then top it off with a one-half cup (74 grams) of your favorite berries.\n\nChia seeds also make a delicious and nutritious addition to tea, smoothies or overnight oats.',
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
            Text('Lunches', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(title: 'Eggs', subtitle: 'Include: Salad - kale, spinach, collards and swiss chards'),
            DisplayContainer(title: 'Salmon', subtitle: 'Include: Broccoli, cauliflower and cabbage'),
            DisplayContainer(title: 'Tuna', subtitle: 'Include: Ezekiel Bread'),
            DisplayContainer(title: 'Soup', subtitle: ''),
            DisplayContainerScrollable(
              title: 'Tuna:',
              subtitle:
                  'In addition to 20 grams of protein per 3-ounce (85-gram) serving, tuna contains high amounts of vitamin A and several B vitamins, including B12, niacin and B6. These nutrients are important for optimal health, energy and exercise performance.\n\nAdditionally, tuna provides large amounts of omega-3 fatty acids, which may support muscle health.\n\nThis may be particularly important for older adults. Research has shown that omega-3 fatty acids can slow the loss of muscle mass and strength that occurs with age.',
            ),
            DisplayContainerScrollable(
              title: 'Salmon:',
              subtitle:
                  'Fatty fish like salmon is incredibly healthy and very satisfying, keeping you full for many hours with relatively few calories.\n\nSalmon is loaded with high-quality protein, healthy fats and various important nutrients.\n\nFish ??? and seafood in general ??? may also supply a significant amount of iodine.\n\nThis nutrient is necessary for proper thyroid function, which is important to keep your metabolism running optimally.\n\nStudies show that a significant number of people don???t fill their iodine needs.\n\nSalmon is also loaded with omega-3 fatty acids, which have been shown to help reduce inflammation, which is known to play a major role in obesity and metabolic disease.\n\nMackerel, trout, sardines, herring and other types of fatty fish are also excellent',
            ),
            DisplayContainerScrollable(
              title: 'Ezekiel bread:',
              subtitle:
                  'One slice of Ezekiel bread is only 80 calories and loaded with micronutrients and macronutrients that???ll keep you satiated and can help you lose weight or stay healthy. Plus, its ingredient list is totally pronounceable because it contains 100 percent wholesome good-for-you ingredients.\n\nAll of the grains and legumes found in Ezekiel bread are sprouted???which means that they???re better for you. Sprouting is the natural process that involves these seeds germinating and the plant sprouting out of its shell when coming in contact with water.\n\nSo, when foods like Ezekiel bread are labeled ???sprouted,??? this simply means that this natural process was mimicked, leading to a ton more nutrients and healthful benefits. Sprouted grains and legumes are much lower in gluten, and because the sprouting process breaks down enzyme inhibitors, the bread is, therefore, easier to digest and much more nutrient dense.\n\nUnlike most commercial bread loaves, which contain added sugars disguised by titles like high fructose corn syrup, date syrup, and even honey, the Ezekiel Flax Sprouted Whole Grain bread doesn???t contain even one gram of the saccharine carb.',
            ),
            DisplayContainerScrollable(
              title: 'Soup:',
              subtitle:
                  'Shrimp are almost pure protein. Each 3-ounce (85-gram) serving contains 18 grams of protein, 1 gram of fat and zero carbs (21).\n\nWhile healthy fats and carbs are important in your overall diet, adding some shrimp is an easy way to get muscle-building protein without too many additional calories.\n\nLike many other animal proteins, shrimp contains a high amount of the amino acid leucine, which is necessary for optimal muscle growth',
            ),
            DisplayContainerScrollable(
              title: 'Eggs:',
              subtitle:
                  'Without a doubt, there are a multitude of benefits to eating eggs every day. Not only do eggs provide high quality protein, they also contain 11 vitamins and minerals, omega-3 fatty acids and antioxidants. And this means they can make a valuable contribution to daily nutrient requirements.\n\nMost of the protein in an egg can be found in the egg white, while the yolk contains healthy fats, vitamins, minerals and antioxidants.\n\nPlus, its biological value is nearly 100. What does that mean? The higher the biological value, the more similar the protein in the food is to the body???s own protein, which makes it easier for the body to transform it into muscle mass. Two hard-boiled eggs, for instance, are an ideal post-workout snack.\n\nJust one boiled egg contains:\n\n40% of your daily vitamin D requirements\n25% of your daily folate requirements\n12% of your daily riboflavin (Vitamin B2) requirements\n20% of your daily selenium requirements\nEggs also contain vitamins A, E, B5, B12, as well as iron, iodine and phosphorus. \n\nEggs provide us with very high-quality protein that contains all nine essential amino acids in the right amounts needed by the body for optimum growth and maintenance perfect for bulking. Some other foods contain proportionately more protein than eggs but it???s the quality of the protein in eggs that really stands out.\n\nEggs help increase levels of high-density lipoprotein (HDL), or ???good??? cholesterol as it???s commonly known. Higher levels of HDL can help reduce the risk of heart disease.',
            ),
            DisplayContainerScrollable(
              title: 'Salad:',
              subtitle:
                  'Leafy greens include kale, spinach, collards, swiss chards and a few others.\n\nThey have several properties that make them perfect for a weight loss diet, such as being low in calories and carbohydrates and loaded with fiber.\n\nEating leafy greens is a great way to increase the volume of your meals, without increasing the calories. Numerous studies show that meals and diets with a low energy density make people eat fewer calories overall.\n\nLeafy greens are also incredibly nutritious and very high in many vitamins, antioxidants and minerals, including calcium, which has been shown to aid fat burning in some studies.',
            ),
            DisplayContainerScrollable(
              title: 'Broccoli, cauliflower and cabbage:',
              subtitle:
                  'Cruciferous vegetables include broccoli, cauliflower, cabbage and Brussels sprouts.\n\nLike other vegetables, they???re high in fiber and tend to be incredibly filling.\n\nWhat???s more, these types of veggies generally contain decent amounts of protein.\n\nThey???re not nearly as high in protein as animal foods or legumes but still high compared to most vegetables.\n\nA combination of protein, fiber and low energy density makes cruciferous vegetables the perfect foods to include in your meals if you need to lose weight.\n\nThey???re also highly nutritious and contain cancer-fighting substances.',
            ),
            SizedBox(
              height: 10,
            ),
            Text('Dinners', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(title: 'Chicken without the skin', subtitle: 'Include: Broccoli and Quinoa'),
            DisplayContainer(title: 'Lean beef', subtitle: 'Include: Brussels sprouts'),
            DisplayContainer(title: 'SmooAvocado and saladthie', subtitle: 'Include: Kale and chickpeas'),
            DisplayContainer(title: 'Bean and Vegetable Soup', subtitle: 'Include: Black beans'),
            DisplayContainer(title: 'Chicken', subtitle: 'Include: Cayenne pepper and salad'),
            DisplayContainer(title: 'Steak', subtitle: 'Include: Brocolli'),
            DisplayContainerScrollable(
              title: 'Chicken:',
              subtitle:
                  'The lean protein in chicken is an excellent source of amino acids. Our bodies use amino acids to build muscle tissue, something that is particularly important as we age. Studies have also shown that higher protein intake helps to maintain bone mineral density. Eating chicken can help to build stronger muscles and promote healthier bones, decreasing the risk of injuries and diseases such as osteoporosis.\n\nDarker cuts like the thigh and drumstick contain higher caloric content than lighter cuts like the breast. Keeping the skin or frying chicken will also add saturated fat.\nChicken is filled with high-quality proteins and doesn???t contain much fat ??? especially if you eat lean cuts. Beyond its rich protein content, chicken also contains:\n\nVitamin B12\nTryptophan\nCholine\n Zinc\n Iron\n Copper',
            ),
            DisplayContainerScrollable(
              title: 'Quinoa:',
              subtitle:
                  ' If ever there was a perfect post-workout food, it???s quinoa. Not only is it high in protein and fiber, it???s also high in magnesium and iron, which helps to promote protein synthesis. Plus, it contains all nine amino acids essential for building muscle, and it???s gluten-free, so it???s easy to digest.\n\nQuinoa is the ideal side dish for bodyweight training. 100 g provides 15 g of vegan protein. This grain is also very high in magnesium (275 mg), which plays a key role in muscle contraction. Quinoa is also a good source of carbohydrates with 14 grams of protein in every 100 grams. These proteins also contain essential amino acids which help in muscle building.',
            ),
            DisplayContainerScrollable(
              title: 'Lean beef:',
              subtitle:
                  'Beef is packed with high-quality protein, B vitamins, minerals and creatine.\n\nSome research has even shown that consuming lean red meat can increase the amount of lean mass gained with weight training.\n\nHowever, even when you???re trying to gain muscle, it may be best to choose beef that supports muscle gain without providing too many extra calories.\n\nFor example, 3 ounces (85 grams) of 70% lean ground beef contains 228 calories and a whopping 15 grams of fat.\n\nHowever, the same amount of 95% lean ground beef contains slightly more protein and only 145 calories and 5 grams of fat.',
            ),
            DisplayContainerScrollable(
              title: 'Broccoli, cauliflower and cabbage:',
              subtitle:
                  'Cruciferous vegetables include broccoli, cauliflower, cabbage and Brussels sprouts.\n\nLike other vegetables, they???re high in fiber and tend to be incredibly filling.\n\nWhat???s more, these types of veggies generally contain decent amounts of protein.\n\nThey???re not nearly as high in protein as animal foods or legumes but still high compared to most vegetables.\n\nA combination of protein, fiber and low energy density makes cruciferous vegetables the perfect foods to include in your meals if you need to lose weight.\n\nThey???re also highly nutritious and contain cancer-fighting substances.',
            ),
            DisplayContainerScrollable(
              title: 'Salad:',
              subtitle:
                  'Leafy greens include kale, spinach, collards, swiss chards and a few others.\n\nThey have several properties that make them perfect for a weight loss diet, such as being low in calories and carbohydrates and loaded with fiber.\n\nEating leafy greens is a great way to increase the volume of your meals, without increasing the calories. Numerous studies show that meals and diets with a low energy density make people eat fewer calories overall.\n\nLeafy greens are also incredibly nutritious and very high in many vitamins, antioxidants and minerals, including calcium, which has been shown to aid fat burning in some studies.',
            ),
            DisplayContainerScrollable(
              title: 'Avocado:',
              subtitle:
                  'Avocados are a unique fruit.\n\nWhile most fruits are high in carbs, avocados are loaded with healthy fats.\n\nThey???re particularly high in monounsaturated oleic acid, the same type of fat found in olive oil.\n\nDespite being mostly fat, avocados also contain a lot of water and fiber, making them less energy-dense than you may think.\n\nWhat???s more, they???re a perfect addition to vegetable salads, as studies show that their fat content can increase carotenoid antioxidant absorption from the vegetables 2.6- to 15-fold.\n\nThey also contain many important nutrients, including fiber and potassium.',
            ),
            DisplayContainerScrollable(
              title: 'Bean and Vegetable Soup:',
              subtitle:
                  'A broth-based vegetable soup for dinner fills your stomach, leaving less room for higher-calorie foods. One study showed that people who started with soup ate 20% fewer calories during a meal. Stirring in beans, such as chickpeas or black beans, can give it more staying power because they???re high in protein and fiber.',
            ),
            DisplayContainerScrollable(
              title: 'Cayenne pepper:',
              subtitle:
                  'Eating Cayene peppers may be useful on a weight loss diet.\n\nThey contain capsaicin, a substance which has been shown to reduce appetite and increase fat burning in some studies.\n\nThis substance is even sold in supplement form and a common ingredient in many commercial weight loss supplements.\n\nOne study showed that eating 1 gram of cayenne pepper reduced appetite and increased fat burning in people who didn???t regularly eat peppers.\n\nHowever, there was no effect in people who were accustomed to eating spicy food, indicating that a certain level of tolerance can build up.',
            ),
            DisplayContainerScrollable(
              title: 'Steak:',
              subtitle:
                  'Beef is rich in protein and iron, which your body uses to build red blood cells. They take oxygen to your organs, so falling short in those can zap your energy. Broccoli is the perfect side, because its vitamin C helps your body take in iron. A half-cup of this veggie has 65% of all the vitamin C you need in a day.',
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              Images.running_person,
              height: 29,
              color: AppColors.darkerBlueBorder,
              fit: BoxFit.fill,
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
                      'When it comes to exercise, the best time of day to get in a workout session is one that you can do consistently. Everyone is different. The ???right??? time depends on factors like your preference, lifestyle, and body.\n\nWhile there isn???t a one-size-fits-all answer, morning workouts do have some benefits. Let???s look at the potential perks of an early sweat session.\n\n\n1. More overall energy\n\nRegular exercise is excellent for boosting energy and reducing fatigue. When you work out, oxygen and nutrients travel to your heart and lungs. This improves your cardiovascular system, endurance, and overall stamina.\n\nBy exercising early, you may feel more energized throughout the day.\n\n\n2. Increased alertness\n\nA morning workout may be a better match for your body???s hormonal fluctuations.\n\nCortisol is a hormone that keeps you awake and alert. It???s often called the stress hormone, but it only causes problems when there???s too much or too little of it.\n\nTypically, cortisol increases in the morning and drops in the evening. It reaches its peak around 8 a.m.\n\n\nIf you have a healthy circadian rhythm, your body might be more primed to exercise at this time.\n\n\n3. Better focus\n\nPhysical activity also improves focus and concentration, regardless of when you do it. But if you have trouble focusing during the day, a morning workout might be just the ticket.\n\nA 2019 study published in the British Journal of Sports Medicine found that morning exercise improves attention, visual learning, and decision-making.\n\nIn the study, participants completed a round of 8-hour days of prolonged sitting with and without a 30-minute morning walk on the treadmill. On some days, they also took 3-minute walking breaks every 30 minutes.\n\nThe days with morning exercise were associated with better cognition throughout the day, especially when paired with regular breaks.\n\n\n4. Support weight loss\n\nEarly workouts may be best for losing weight, according to a small 2015 study published in EBioMedicineTrusted Source.\n\nIn the study, 10 young men exercised in the morning, afternoon, and evening over separate sessions. The researchers found that 24-hour fat burn was highest when they exercised in the morning before breakfast.\n\nIf you???re looking to lose weight, morning exercise may help.\n\n\n\n5. Blood pressure management\n\nIn the United States, 1 in 3 adultsTrusted Source have hypertension, or high blood pressure. Physical activity is one of the best ways to naturally control hypertension. But according to a small 2014 study published in Vascular Health and Risk ManagementTrusted Source, exercising in the morning may be the best move.\n\nOver three separate sessions, 20 prehypertensive adults exercised on a treadmill at 7 a.m., 1 p.m., and 7 p.m. The participants also wore a medical device to monitor their blood pressure response.\n\nThe researchers found that the most favorable blood pressure changes happened on the 7 a.m. workout days.\n\n\n6. Healthier food choices\n\nAn early morning workout could set the tone for a healthier day.\n\nIn a 2018 study published in the International Journal of ObesityTrusted Source, 2,680 college students completed a 15-week exercise program. Each week involved three 30-minute sessions of cardio.\n\nThe students weren???t asked to change their eating patterns. Yet, those who stuck with the program made healthier food choices, like eating less red meat and fried foods.\n\nWhile the study didn???t test for the best time of day to exercise, the findings show how exercise can inspire healthier eating. Working out early may encourage you to make healthier choices throughout the day.\n\n\n7. Blood glucose control\n\nPhysical activity is an important part of managing type 1 diabetes (T1DM). But for people with T1DM, it can be challenging to work out. Exercise poses the risk of hypoglycemia, or low blood glucose.\n\nA 2015 study published in the Journal of Diabetes Science and TechnologyTrusted Source found that morning exercise lowers that risk. In the study, 35 adults with T1DM did two separate sessions of morning and afternoon treadmill workouts.\n\nCompared to the afternoon sessions, morning workouts presented a lower risk of hypoglycemic events after activity.\n\nThe researchers think cortisol may be at play. Aside from increasing alertness, cortisol also helps control blood sugar. Lower levels, which occur later in the day, could make it easier for hypoglycemia to develop.\n\n\n8. Appetite control\n\nIn general, exercise helps regulate your appetite by reducing ghrelin, the hunger hormone. It also increases satiety hormones, like peptide YY and glucagon-like peptide-1.\n\nHowever, working out in the morning may control your appetite even further.\n\nIn a 2012 study published in Medicine & Science in Sports & ExerciseTrusted Source, 35 women walked on a treadmill for 45 minutes in the morning. Next, researchers measured the women???s brain waves as they viewed photos of flowers (the control) and food.\n\nA week later, the process was repeated without morning exercise. The researchers found that the women???s brains had a stronger response to food photos when they didn???t exercise in the morning.\n\nThis suggests that morning workouts may improve how your brain responds to food cues.\n\n\n9. Increased overall activity\n\nThe perks of an early workout don???t stop in the morning. According to the same 2012 study in Medicine & Science in Sports & ExerciseTrusted Source, morning exercise is associated with more movement throughout the day.\n\nAfter walking for 45 minutes in the morning, the participants showed an increase in physical activity over the next 24 hours.\n\nIf you???re trying to live a more active lifestyle, morning exercise may lend a hand.\n\n\n10. Better mood\n\nPhysical activity is a natural remedy for stress. During exercise, your brain makes more endorphins, the ???feel-good??? neurotransmitters behind a runner???s high. It also doubles as a distraction from anxious thoughts.\n\nMorning exercise is a great way to start the day on the positive note. You???ll also feel a sense of accomplishment, giving you an optimistic outlook for the day.\n\n\n\11. Improved sleep\n\nGetting an early workout might be just what you need to get a good night???s rest. The same 2014 study in Vascular Health and Risk ManagementTrusted Source demonstrated that adults got better sleep on the days they exercised at 7 a.m.\n\nAfter the morning workout, the participants spent more time in deep sleep and experienced fewer nighttime awakenings. It also took them less time to fall asleep.\n\nExercising outside in the morning offers even more sleep-related perks. Light exposure early in the day may help increase melatonin levels at night.\n')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
