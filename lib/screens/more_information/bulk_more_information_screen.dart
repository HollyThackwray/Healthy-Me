import 'package:flutter/material.dart';

import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class BulkMoreInformationScreen extends StatelessWidget {
  const BulkMoreInformationScreen({Key? key}) : super(key: key);

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
              subtitle: 'Include: cheese, lentils and a glass of milk',
            ),
            DisplayContainer(
              title: 'Oats',
              subtitle: 'Include: and greek yogurt, quinoa, almonds and milk',
            ),
            DisplayContainer(
              title: 'Banana Pancakes ',
              subtitle: 'Include: Glass of milk / soya milk',
            ),
            DisplayContainerScrollable(
              title: 'Eggs:',
              subtitle:
                  'Without a doubt, there are a multitude of benefits to eating eggs every day. Not only do eggs provide high quality protein, they also contain 11 vitamins and minerals, omega-3 fatty acids and antioxidants. And this means they can make a valuable contribution to daily nutrient requirements.\n\nMost of the protein in an egg can be found in the egg white, while the yolk contains healthy fats, vitamins, minerals and antioxidants.\n\nPlus, its biological value is nearly 100. What does that mean? The higher the biological value, the more similar the protein in the food is to the body’s own protein, which makes it easier for the body to transform it into muscle mass. Two hard-boiled eggs, for instance, are an ideal post-workout snack.\n\nJust one boiled egg contains:\n\n40% of your daily vitamin D requirements\n25% of your daily folate requirements\n12% of your daily riboflavin (Vitamin B2) requirements\n20% of your daily selenium requirements\nEggs also contain vitamins A, E, B5, B12, as well as iron, iodine and phosphorus. \n\nEggs provide us with very high-quality protein that contains all nine essential amino acids in the right amounts needed by the body for optimum growth and maintenance perfect for bulking. Some other foods contain proportionately more protein than eggs but it’s the quality of the protein in eggs that really stands out.\n\nEggs help increase levels of high-density lipoprotein (HDL), or “good” cholesterol as it’s commonly known. Higher levels of HDL can help reduce the risk of heart disease.',
            ),
            DisplayContainerScrollable(
              title: 'Cheese:',
              subtitle:
                  'Protein-packed cheese is a smart snack for building muscle. Protein is made of amino acids, which are the building blocks of muscle tissue. It’s one of the single best sources of whey protein, which is especially advantageous for muscle building.\nCheese is what you call a whole food. Whole foods are generally good for you, as long as you don’t eat too much of one thing.\nCheese is a great source of calcium, fat, and protein. It also contains high amounts of vitamins A and B-12, along with zinc, phosphorus, and riboflavin.\nCheese made from the milk of 100 percent grass-fed animals is the highest in nutrients and also contains omega-3 fatty acids and vitamin K-2 and also means it will keep your bones strong.\nNutrition profiles vary widely from one type of cheese to the next. For example, mozzarella contains 85 calories and 6.3 grams of fat per ounce.\nCompare that to Brie, which has 95 calories and 7.9 grams of fat per ounce, and cheddar, which has 113 calories and 9 grams of fat.\nIf you want to stick with lower-calorie cheeses, try part-skim mozzarella, Swiss cheese, and feta cheese.\n\nIf sodium is a concern, try Swiss, which contains only 20 milligrams per ounce.\nStay away from harder cheeses, as they require more salt in the aging process. Also, you can look for lower-sodium varieties of your favorite cheeses.',
            ),
            DisplayContainerScrollable(
              title: 'Lentils:',
              subtitle:
                  'Lentils are protein and fiber powerhouses. They are especially high in protein. 100 g of this dry good provides about 25 g of protein. Their fiber content is also nothing to sneeze at. Just 100 g covers half of your daily requirement (30 g). \n\nThey are also very inexpensive and have a long shelf life. They cook up in just 10 minutes and can be added mixed in with brown rice, sprinkled over a salad, or eaten as a standalone side dish.',
            ),
            DisplayContainerScrollable(
              title: 'Milk:',
              subtitle:
                  'Since milk is a good source of calories, protein, and other nutrients, it offers a balanced approach to gaining weight.\n\nMilk is naturally high in calcium and often fortified with vitamin D — two nutrients that are vital to bone development and health. What’s more, it contains vitamin A, which promotes optimal eye health and supports your immune system.\n\nThe two main proteins in milk are whey and casein. Some studies show that these proteins may help reduce blood pressure and cholesterol levels — two risk factors for heart disease.\n\nIn addition, studies indicate that drinking milk after exercise may help build lean muscle and improve body composition instead of fat mass - specifically, the whey and casein proteins in cow’s milk.\nOne 12-week study in 10 young women found that drinking 24 ounces (1 liter) of skim milk after resistance exercise led to significantly greater muscle mass gains and fat loss compared to drinking a carb drink with the same number of calories (6Trusted Source).\nAnother study in 8 men observed that drinking approximately 2 cups (500 ml) of skim milk after resistance exercise led to significantly higher rates of muscle building compared to consuming a nutritionally similar soy beverage',
            ),
            DisplayContainerScrollable(
              title: 'Oats:',
              subtitle:
                  'When bulking is considered, it’s crucial to add oatmeal into your diet as it offers plenty of nutrients that’ll help you do more during your workout sessions. Oats will allow for the energy needed in the gym and the protein helps repair the muscle tissue. It’s always a bonus when you can get protein from carbohydrate dense foods.\n\n1 cup of dry oatmeal has 307 calories, 5 grams of fat, 11 grams of protein and 56 grams of carbohydrates. If you measure oatmeal cooked it roughly doubles in volume so a cup of cooked oatmeal has about 166 calories, 32 carbs and 6 grams of protein.\n\nIn addition to having good complex carbs and protein, oatmeal also contains nutrients that the body uses for building muscle. One cup of dry oatmeal contains 3.4 mg of iron and 0.9 mg of niacin (vitamin B3.) Iron helps to transport oxygen into the bloodstream and into the muscles and the B- vitamins help to convert carbohydrates into energy and to properly utilize protein.\n\nOatmeal is a good source of soluble and insoluble fiber. While not directly related to building muscle, this is very beneficial for your health. Soluble fiber has been shown to reduce bad LDL cholesterol (bad cholesterol) without lowering HDL cholesterol (good cholesterol.) It does this by forming a sticky gel in your digestive tract that grabs the cholesterol in your body. Insoluble fiber helps aid the body with digestion.\n\nOatmeal is also a good source of vitamins and minerals like thiamin, folic acid biotin and vitamin E. These all have a positive effect on the immune system and can speed you body’s reaction to infection and can help your body heal faster from illness. This is more of an indirect benefit to building muscle since it’s really hard to train and get results when you are sick.\n\noatmeal is a good source of nutrients that can help with your bodybuilding goals. If you don’t want to eat it plain you can add fruits such as bananas, berries, raisins, and the like.\nAdd a little bit of flavor by adding natural honey or real maple syrup for the folks with a sweet tooth.',
            ),
            DisplayContainerScrollable(
              title: 'Quinoa:',
              subtitle:
                  'If ever there was a perfect post-workout food, it’s quinoa. Not only is it high in protein and fiber, it’s also high in magnesium and iron, which helps to promote protein synthesis. Plus, it contains all nine amino acids essential for building muscle, and it’s gluten-free, so it’s easy to digest.\n\nQuinoa is the ideal side dish for bodyweight training. 100 g provides 15 g of vegan protein. This grain is also very high in magnesium (275 mg), which plays a key role in muscle contraction. Quinoa is also a good source of carbohydrates with 14 grams of protein in every 100 grams. These proteins also contain essential amino acids which help in muscle building.',
            ),
            DisplayContainerScrollable(
              title: 'Greek yogurt:',
              subtitle:
                  'Many of the potential health benefits of Greek yogurt relate to its high protein content. A protein-rich diet may help reduce hunger, boost metabolism, and build muscle. Greek yogurt is an excellent source of calcium, which can help improve bone health.\nStrained Greek yogurt is lower in sugar than regular yogurt. Removing the whey produces a thicker, creamier yogurt with a tart taste.\nSome manufacturers add thickening agents to regular yogurt, and market it as “Greek-style” yogurt, which may not share the same health benefits as Greek yogurt.\nAlso, low or no-fat Greek yogurt may not share the same health benefits as traditional Greek yogurt.\n\nGreek yogurt also contains probiotics. These are good bacteria that may restore a healthy bacterial balance within the gut.',
            ),
            DisplayContainerScrollable(
              title: 'Chicken:',
              subtitle:
                  'The lean protein in chicken is an excellent source of amino acids. Our bodies use amino acids to build muscle tissue, something that is particularly important as we age. Studies have also shown that higher protein intake helps to maintain bone mineral density. Eating chicken can help to build stronger muscles and promote healthier bones, decreasing the risk of injuries and diseases such as osteoporosis.\n\nDarker cuts like the thigh and drumstick contain higher caloric content than lighter cuts like the breast. Keeping the skin or frying chicken will also add saturated fat.\nChicken is filled with high-quality proteins and doesn’t contain much fat — especially if you eat lean cuts. Beyond its rich protein content, chicken also contains:\n\nVitamin B12\nTryptophan\nCholine\n Zinc\n Iron\n Copper',
            ),
            SizedBox(
              height: 10,
            ),
            Text('Lunches', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(title: 'Tuna or Salmon sandwich', subtitle: 'Include: Ezekiel bread '),
            DisplayContainer(title: 'Salad with shrimp', subtitle: 'Include: pumkin seeds and quinoa'),
            DisplayContainer(title: 'Smoothie', subtitle: 'Include: Fresh fruits, avocado and milk'),
            DisplayContainer(title: 'Chicken breast', subtitle: 'Include: Soybeans and Cottage cheese'),
            DisplayContainerScrollable(
              title: 'Tuna:',
              subtitle:
                  'In addition to 20 grams of protein per 3-ounce (85-gram) serving, tuna contains high amounts of vitamin A and several B vitamins, including B12, niacin and B6. These nutrients are important for optimal health, energy and exercise performance.\n\nAdditionally, tuna provides large amounts of omega-3 fatty acids, which may support muscle health.\n\nThis may be particularly important for older adults. Research has shown that omega-3 fatty acids can slow the loss of muscle mass and strength that occurs with age.',
            ),
            DisplayContainerScrollable(
                title: 'Salmon:',
                subtitle:
                    'Salmon is a great choice for muscle building and overall health.\n\nEach 3-ounce (85-gram) serving of salmon contains about 17 grams of protein, almost 2 grams of omega-3 fatty acids and several important B vitamins.\n\nOmega-3 fatty acids play an important role in muscular health and may even increase muscle gain during exercise programs.'),
            DisplayContainerScrollable(
                title: 'Ezekiel bread:',
                subtitle:
                    'One slice of Ezekiel bread is only 80 calories and loaded with micronutrients and macronutrients that’ll keep you satiated and can help you lose weight or stay healthy. Plus, its ingredient list is totally pronounceable because it contains 100 percent wholesome good-for-you ingredients.\n\nAll of the grains and legumes found in Ezekiel bread are sprouted—which means that they’re better for you. Sprouting is the natural process that involves these seeds germinating and the plant sprouting out of its shell when coming in contact with water.\n\nSo, when foods like Ezekiel bread are labeled “sprouted,” this simply means that this natural process was mimicked, leading to a ton more nutrients and healthful benefits. Sprouted grains and legumes are much lower in gluten, and because the sprouting process breaks down enzyme inhibitors, the bread is, therefore, easier to digest and much more nutrient dense.\n\nUnlike most commercial bread loaves, which contain added sugars disguised by titles like high fructose corn syrup, date syrup, and even honey, the Ezekiel Flax Sprouted Whole Grain bread doesn’t contain even one gram of the saccharine carb.'),
            DisplayContainerScrollable(
                title: 'Shrimp:',
                subtitle:
                    'Shrimp are almost pure protein. Each 3-ounce (85-gram) serving contains 18 grams of protein, 1 gram of fat and zero carbs (21).\n\nWhile healthy fats and carbs are important in your overall diet, adding some shrimp is an easy way to get muscle-building protein without too many additional calories.\n\nLike many other animal proteins, shrimp contains a high amount of the amino acid leucine, which is necessary for optimal muscle growth'),
            DisplayContainerScrollable(
                title: 'Smoothie:',
                subtitle:
                    'Because smoothies are so customizable, it’s fairly easy to pack them with nutrients. So adding fresh fruit, avocados and milk cuts down the sugar content and gives a good amount of protein to fill you up for the day.'),
            DisplayContainerScrollable(
                title: 'Quinoa:',
                subtitle:
                    ' If ever there was a perfect post-workout food, it’s quinoa. Not only is it high in protein and fiber, it’s also high in magnesium and iron, which helps to promote protein synthesis. Plus, it contains all nine amino acids essential for building muscle, and it’s gluten-free, so it’s easy to digest.\n\nQuinoa is the ideal side dish for bodyweight training. 100 g provides 15 g of vegan protein. This grain is also very high in magnesium (275 mg), which plays a key role in muscle contraction. Quinoa is also a good source of carbohydrates with 14 grams of protein in every 100 grams. These proteins also contain essential amino acids which help in muscle building.'),
            DisplayContainerScrollable(
                title: 'Milk:',
                subtitle:
                    'Since milk is a good source of calories, protein, and other nutrients, it offers a balanced approach to gaining weight.\n\nMilk is naturally high in calcium and often fortified with vitamin D — two nutrients that are vital to bone development and health. What’s more, it contains vitamin A, which promotes optimal eye health and supports your immune system.\n\nThe two main proteins in milk are whey and casein. Some studies show that these proteins may help reduce blood pressure and cholesterol levels — two risk factors for heart disease.\n\nIn addition, studies indicate that drinking milk after exercise may help build lean muscle and improve body composition instead of fat mass - specifically, the whey and casein proteins in cow’s milk.\n\nOne 12-week study in 10 young women found that drinking 24 ounces (1 liter) of skim milk after resistance exercise led to significantly greater muscle mass gains and fat loss compared to drinking a carb drink with the same number of calories (6Trusted Source).n\n\nAnother study in 8 men observed that drinking approximately 2 cups (500 ml) of skim milk after resistance exercise led to significantly higher rates of muscle building compared to consuming a nutritionally similar soy beverage'),
            DisplayContainerScrollable(
                title: 'Tuna:',
                subtitle:
                    'In addition to 20 grams of protein per 3-ounce (85-gram) serving, tuna contains high amounts of vitamin A and several B vitamins, including B12, niacin and B6. These nutrients are important for optimal health, energy and exercise performance.\n\nAdditionally, tuna provides large amounts of omega-3 fatty acids, which may support muscle health.\n\nThis may be particularly important for older adults. Research has shown that omega-3 fatty acids can slow the loss of muscle mass and strength that occurs with age.'),
            DisplayContainerScrollable(
                title: 'Chicken:',
                subtitle:
                    'The lean protein in chicken is an excellent source of amino acids. Our bodies use amino acids to build muscle tissue, something that is particularly important as we age. Studies have also shown that higher protein intake helps to maintain bone mineral density. Eating chicken can help to build stronger muscles and promote healthier bones, decreasing the risk of injuries and diseases such as osteoporosis.\n\nDarker cuts like the thigh and drumstick contain higher caloric content than lighter cuts like the breast. Keeping the skin or frying chicken will also add saturated fat.\nChicken is filled with high-quality proteins and doesn’t contain much fat — especially if you eat lean cuts. Beyond its rich protein content, chicken also contains:\n\nVitamin B12\nTryptophan\nCholine\n Zinc\n Iron\n Copper'),
            DisplayContainerScrollable(
                title: 'Soybeans:',
                subtitle:
                    'Half a cup (86 grams) of cooked soybeans contains 14 grams of protein, healthy unsaturated fats and several vitamins and minerals.\n\nSoybeans are a particularly good source of vitamin K, iron and phosphorus.\n\nIron is used to store and transport oxygen in your blood and muscles, and a deficiency can impair these functions.\n\nYoung women may be particularly at risk of iron deficiency due to blood loss during menstruation.'),
            DisplayContainerScrollable(
                title: 'Cottage cheese:',
                subtitle:
                    'Protein-packed cottage cheese is a smart snack for building muscle. Protein is made of amino acids, which are the building blocks of muscle tissue. It’s one of the single best sources of whey protein, which is especially advantageous for muscle building.\n\nCheese is what you call a whole food. Whole foods are generally good for you, as long as you don’t eat too much of one thing.\n\nCottage cheese is a great source of calcium, fat, and protein. It also contains high amounts of vitamins A and B-12, along with zinc, phosphorus, and riboflavin.\n\nCheese made from the milk of 100 percent grass-fed animals is the highest in nutrients and also contains omega-3 fatty acids and vitamin K-2 and also means it will keep your bones strong.'),
            SizedBox(
              height: 10,
            ),
            Text('Dinners', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(title: 'Chicken without the skin', subtitle: 'Include: Broccoli and Quinoa'),
            DisplayContainer(title: 'Lean beef', subtitle: 'Include: Brussels sprouts'),
            DisplayContainer(title: 'Tuna or salmon', subtitle: 'Include: Potato, Kumara, carrots and Quinoa '),
            DisplayContainer(title: 'Pork tenderloin', subtitle: 'Include: Beans and broccoli'),
            DisplayContainerScrollable(
                title: 'Chicken:',
                subtitle:
                    'The lean protein in chicken is an excellent source of amino acids. Our bodies use amino acids to build muscle tissue, something that is particularly important as we age. Studies have also shown that higher protein intake helps to maintain bone mineral density. Eating chicken can help to build stronger muscles and promote healthier bones, decreasing the risk of injuries and diseases such as osteoporosis.\n\nDarker cuts like the thigh and drumstick contain higher caloric content than lighter cuts like the breast. Keeping the skin or frying chicken will also add saturated fat.\nChicken is filled with high-quality proteins and doesn’t contain much fat — especially if you eat lean cuts. Beyond its rich protein content, chicken also contains:\n\nVitamin B12\nTryptophan\nCholine\n Zinc\n Iron\n Copper'),
            DisplayContainerScrollable(
                title: 'Quinoa:',
                subtitle:
                    ' If ever there was a perfect post-workout food, it’s quinoa. Not only is it high in protein and fiber, it’s also high in magnesium and iron, which helps to promote protein synthesis. Plus, it contains all nine amino acids essential for building muscle, and it’s gluten-free, so it’s easy to digest.\n\nQuinoa is the ideal side dish for bodyweight training. 100 g provides 15 g of vegan protein. This grain is also very high in magnesium (275 mg), which plays a key role in muscle contraction. Quinoa is also a good source of carbohydrates with 14 grams of protein in every 100 grams. These proteins also contain essential amino acids which help in muscle building.'),
            DisplayContainerScrollable(
                title: 'Lean beef:',
                subtitle:
                    'Beef is packed with high-quality protein, B vitamins, minerals and creatine.\n\nSome research has even shown that consuming lean red meat can increase the amount of lean mass gained with weight training.\n\nHowever, even when you’re trying to gain muscle, it may be best to choose beef that supports muscle gain without providing too many extra calories.\n\nFor example, 3 ounces (85 grams) of 70% lean ground beef contains 228 calories and a whopping 15 grams of fat.\n\nHowever, the same amount of 95% lean ground beef contains slightly more protein and only 145 calories and 5 grams of fat.'),
            DisplayContainerScrollable(
                title: 'Tuna:',
                subtitle:
                    'In addition to 20 grams of protein per 3-ounce (85-gram) serving, tuna contains high amounts of vitamin A and several B vitamins, including B12, niacin and B6. These nutrients are important for optimal health, energy and exercise performance.\n\nAdditionally, tuna provides large amounts of omega-3 fatty acids, which may support muscle health.\n\nThis may be particularly important for older adults. Research has shown that omega-3 fatty acids can slow the loss of muscle mass and strength that occurs with age.'),
            DisplayContainerScrollable(
                title: 'Salmon:',
                subtitle:
                    'Salmon is a great choice for muscle building and overall health.\n\nEach 3-ounce (85-gram) serving of salmon contains about 17 grams of protein, almost 2 grams of omega-3 fatty acids and several important B vitamins.\n\nOmega-3 fatty acids play an important role in muscular health and may even increase muscle gain during exercise programs.'),
            DisplayContainerScrollable(
                title: 'Potato and kumara:',
                subtitle:
                    'It’s important to keep caloric needs in mind when eating for muscle growth and recovery. Potatoes are a perfect option for this. They’re rich in carbohydrates, which provide a necessary energy source.\n\nKumara in particular because they’re filling, sweet, and rich in antioxidants. Whichever potato you choose, It is suggested to eat them before your workout for energy or after your workout for recovery.'),
            DisplayContainerScrollable(
                title: 'Carrots:',
                subtitle:
                    'Carotenes, the famous ingredient in carrots, are an anti-oxidant that has powerful healing virtues for many diseases. Drinking a glass of carrot juice daily will do much more for you than many bottles of supplement tablets. \n\nCarrot is one of the most healing foods that provide the finest and highest quality in nutrients, especially from its juice. It is an excellent source of pro-vitamin A, vitamins C, D, E, K, B1, and B6. It is rich with biotin, potassium, calcium, magnesium, phosphorus, organic sodium and some trace minerals.'),
            DisplayContainerScrollable(
                title: 'Quinoa:',
                subtitle:
                    ' If ever there was a perfect post-workout food, it’s quinoa. Not only is it high in protein and fiber, it’s also high in magnesium and iron, which helps to promote protein synthesis. Plus, it contains all nine amino acids essential for building muscle, and it’s gluten-free, so it’s easy to digest.\n\nQuinoa is the ideal side dish for bodyweight training. 100 g provides 15 g of vegan protein. This grain is also very high in magnesium (275 mg), which plays a key role in muscle contraction. Quinoa is also a good source of carbohydrates with 14 grams of protein in every 100 grams. These proteins also contain essential amino acids which help in muscle building.'),
            DisplayContainerScrollable(
                title: 'Pork tenderloin:',
                subtitle:
                    'Pork is widely consumed in many countries.\n\nPork tenderloin is a lean cut of meat that provides 18 grams of protein and only two grams of fat per 3 ounces (85 grams).\n\nSome research has shown that pork has effects similar to those of other muscle-building foods, such as beef and chicken'),
            DisplayContainerScrollable(
                title: 'Beans:',
                subtitle:
                    'Many different varieties of beans can be part of a diet for lean muscle gain.\n\nPopular varieties, such as black, pinto and kidney beans, contain around 15 grams of protein per cup (about 172 grams) of cooked beans.\n\nWhat’s more, they are excellent sources of fiber and B vitamins, in addition to being high in magnesium, phosphorus and iron.\n\nFor these reasons, beans are a good source of plant-based protein to add to your diet.\n\nWhat’s more, they may play a role in long-term health and disease prevention'),
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
                      'When it comes to exercise, the best time of day to get in a workout session is one that you can do consistently. Everyone is different. The “right” time depends on factors like your preference, lifestyle, and body.\n\nWhile there isn’t a one-size-fits-all answer, morning workouts do have some benefits. Let’s look at the potential perks of an early sweat session.\n\n\n1. More overall energy\n\nRegular exercise is excellent for boosting energy and reducing fatigue. When you work out, oxygen and nutrients travel to your heart and lungs. This improves your cardiovascular system, endurance, and overall stamina.\n\nBy exercising early, you may feel more energized throughout the day.\n\n\n2. Increased alertness\n\nA morning workout may be a better match for your body’s hormonal fluctuations.\n\nCortisol is a hormone that keeps you awake and alert. It’s often called the stress hormone, but it only causes problems when there’s too much or too little of it.\n\nTypically, cortisol increases in the morning and drops in the evening. It reaches its peak around 8 a.m.\n\n\nIf you have a healthy circadian rhythm, your body might be more primed to exercise at this time.\n\n\n3. Better focus\n\nPhysical activity also improves focus and concentration, regardless of when you do it. But if you have trouble focusing during the day, a morning workout might be just the ticket.\n\nA 2019 study published in the British Journal of Sports Medicine found that morning exercise improves attention, visual learning, and decision-making.\n\nIn the study, participants completed a round of 8-hour days of prolonged sitting with and without a 30-minute morning walk on the treadmill. On some days, they also took 3-minute walking breaks every 30 minutes.\n\nThe days with morning exercise were associated with better cognition throughout the day, especially when paired with regular breaks.\n\n\n4. Support weight loss\n\nEarly workouts may be best for losing weight, according to a small 2015 study published in EBioMedicineTrusted Source.\n\nIn the study, 10 young men exercised in the morning, afternoon, and evening over separate sessions. The researchers found that 24-hour fat burn was highest when they exercised in the morning before breakfast.\n\nIf you’re looking to lose weight, morning exercise may help.\n\n\n\n5. Blood pressure management\n\nIn the United States, 1 in 3 adultsTrusted Source have hypertension, or high blood pressure. Physical activity is one of the best ways to naturally control hypertension. But according to a small 2014 study published in Vascular Health and Risk ManagementTrusted Source, exercising in the morning may be the best move.\n\nOver three separate sessions, 20 prehypertensive adults exercised on a treadmill at 7 a.m., 1 p.m., and 7 p.m. The participants also wore a medical device to monitor their blood pressure response.\n\nThe researchers found that the most favorable blood pressure changes happened on the 7 a.m. workout days.\n\n\n6. Healthier food choices\n\nAn early morning workout could set the tone for a healthier day.\n\nIn a 2018 study published in the International Journal of ObesityTrusted Source, 2,680 college students completed a 15-week exercise program. Each week involved three 30-minute sessions of cardio.\n\nThe students weren’t asked to change their eating patterns. Yet, those who stuck with the program made healthier food choices, like eating less red meat and fried foods.\n\nWhile the study didn’t test for the best time of day to exercise, the findings show how exercise can inspire healthier eating. Working out early may encourage you to make healthier choices throughout the day.\n\n\n7. Blood glucose control\n\nPhysical activity is an important part of managing type 1 diabetes (T1DM). But for people with T1DM, it can be challenging to work out. Exercise poses the risk of hypoglycemia, or low blood glucose.\n\nA 2015 study published in the Journal of Diabetes Science and TechnologyTrusted Source found that morning exercise lowers that risk. In the study, 35 adults with T1DM did two separate sessions of morning and afternoon treadmill workouts.\n\nCompared to the afternoon sessions, morning workouts presented a lower risk of hypoglycemic events after activity.\n\nThe researchers think cortisol may be at play. Aside from increasing alertness, cortisol also helps control blood sugar. Lower levels, which occur later in the day, could make it easier for hypoglycemia to develop.\n\n\n8. Appetite control\n\nIn general, exercise helps regulate your appetite by reducing ghrelin, the hunger hormone. It also increases satiety hormones, like peptide YY and glucagon-like peptide-1.\n\nHowever, working out in the morning may control your appetite even further.\n\nIn a 2012 study published in Medicine & Science in Sports & ExerciseTrusted Source, 35 women walked on a treadmill for 45 minutes in the morning. Next, researchers measured the women’s brain waves as they viewed photos of flowers (the control) and food.\n\nA week later, the process was repeated without morning exercise. The researchers found that the women’s brains had a stronger response to food photos when they didn’t exercise in the morning.\n\nThis suggests that morning workouts may improve how your brain responds to food cues.\n\n\n9. Increased overall activity\n\nThe perks of an early workout don’t stop in the morning. According to the same 2012 study in Medicine & Science in Sports & ExerciseTrusted Source, morning exercise is associated with more movement throughout the day.\n\nAfter walking for 45 minutes in the morning, the participants showed an increase in physical activity over the next 24 hours.\n\nIf you’re trying to live a more active lifestyle, morning exercise may lend a hand.\n\n\n10. Better mood\n\nPhysical activity is a natural remedy for stress. During exercise, your brain makes more endorphins, the “feel-good” neurotransmitters behind a runner’s high. It also doubles as a distraction from anxious thoughts.\n\nMorning exercise is a great way to start the day on the positive note. You’ll also feel a sense of accomplishment, giving you an optimistic outlook for the day.\n\n\n\11. Improved sleep\n\nGetting an early workout might be just what you need to get a good night’s rest. The same 2014 study in Vascular Health and Risk ManagementTrusted Source demonstrated that adults got better sleep on the days they exercised at 7 a.m.\n\nAfter the morning workout, the participants spent more time in deep sleep and experienced fewer nighttime awakenings. It also took them less time to fall asleep.\n\nExercising outside in the morning offers even more sleep-related perks. Light exposure early in the day may help increase melatonin levels at night.\n')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DisplayContainer extends StatelessWidget {
  const DisplayContainer({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppConstants.bulkinDaysTextStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            style: AppConstants.bulkinDaysTextStyle.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class DisplayContainerScrollable extends StatelessWidget {
  const DisplayContainerScrollable({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppConstants.bulkinDaysTextStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 150,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Text(
                subtitle,
                style: AppConstants.bulkinDaysTextStyle.copyWith(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
