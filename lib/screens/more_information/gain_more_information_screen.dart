import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

import 'bulk_more_information_screen.dart';

class GainMoreInformationScreen extends StatelessWidget {
  const GainMoreInformationScreen({Key? key}) : super(key: key);

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
              title: 'Chicken omlette',
              subtitle: 'Include: Glass of milk / soya milk',
            ),
            DisplayContainerScrollable(
              title: 'Eggs:',
              subtitle:
                  'Without a doubt, there are a multitude of benefits to eating eggs every day. Not only do eggs provide high quality protein, they also contain 11 vitamins and minerals, omega-3 fatty acids and antioxidants. And this means they can make a valuable contribution to daily nutrient requirements.\n\nMost of the protein in an egg can be found in the egg white, while the yolk contains healthy fats, vitamins, minerals and antioxidants.\n\nPlus, its biological value is nearly 100. What does that mean? The higher the biological value, the more similar the protein in the food is to the body’s own protein, which makes it easier for the body to transform it into muscle mass. Two hard-boiled eggs, for instance, are an ideal post-workout snack.\n\nJust one boiled egg contains:\n\n40% of your daily vitamin D requirements\n25% of your daily folate requirements\n12% of your daily riboflavin (Vitamin B2) requirements\n20% of your daily selenium requirements\nEggs also contain vitamins A, E, B5, B12, as well as iron, iodine and phosphorus. \n\nEggs provide us with very high-quality protein that contains all nine essential amino acids in the right amounts needed by the body for optimum growth and maintenance perfect for bulking. Some other foods contain proportionately more protein than eggs but it’s the quality of the protein in eggs that really stands out.\n\nEggs help increase levels of high-density lipoprotein (HDL), or “good” cholesterol as it’s commonly known. Higher levels of HDL can help reduce the risk of heart disease.',
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
              title: 'Chicken:',
              subtitle:
                  'The lean protein in chicken is an excellent source of amino acids. Our bodies use amino acids to build muscle tissue, something that is particularly important as we age. Studies have also shown that higher protein intake helps to maintain bone mineral density. Eating chicken can help to build stronger muscles and promote healthier bones, decreasing the risk of injuries and diseases such as osteoporosis.\n\nDarker cuts like the thigh and drumstick contain higher caloric content than lighter cuts like the breast. Keeping the skin or frying chicken will also add saturated fat.\nChicken is filled with high-quality proteins and doesn’t contain much fat — especially if you eat lean cuts. Beyond its rich protein content, chicken also contains:\n\nVitamin B12\nTryptophan\nCholine\n Zinc\n Iron\n Copper',
            ),
            DisplayContainerScrollable(
              title: 'Greek yogurt:',
              subtitle:
                  'Many of the potential health benefits of Greek yogurt relate to its high protein content. A protein-rich diet may help reduce hunger, boost metabolism, and build muscle. Greek yogurt is an excellent source of calcium, which can help improve bone health.\nStrained Greek yogurt is lower in sugar than regular yogurt. Removing the whey produces a thicker, creamier yogurt with a tart taste.\nSome manufacturers add thickening agents to regular yogurt, and market it as “Greek-style” yogurt, which may not share the same health benefits as Greek yogurt.\nAlso, low or no-fat Greek yogurt may not share the same health benefits as traditional Greek yogurt.\n\nGreek yogurt also contains probiotics. These are good bacteria that may restore a healthy bacterial balance within the gut.',
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
            DisplayContainer(title: 'Roast potatoes and kumara', subtitle: 'Include: Salad'),
            DisplayContainer(title: 'Pasta', subtitle: 'Include: Cheese and milk'),
            DisplayContainer(title: 'Eggs', subtitle: 'Include: Salad - kale, spinach, collards and swiss chards'),
            DisplayContainerScrollable(
              title: 'Eggs:',
              subtitle:
                  'Without a doubt, there are a multitude of benefits to eating eggs every day. Not only do eggs provide high quality protein, they also contain 11 vitamins and minerals, omega-3 fatty acids and antioxidants. And this means they can make a valuable contribution to daily nutrient requirements.\n\nMost of the protein in an egg can be found in the egg white, while the yolk contains healthy fats, vitamins, minerals and antioxidants.\n\nPlus, its biological value is nearly 100. What does that mean? The higher the biological value, the more similar the protein in the food is to the body’s own protein, which makes it easier for the body to transform it into muscle mass. Two hard-boiled eggs, for instance, are an ideal post-workout snack.\n\nJust one boiled egg contains:\n\n40% of your daily vitamin D requirements\n25% of your daily folate requirements\n12% of your daily riboflavin (Vitamin B2) requirements\n20% of your daily selenium requirements\nEggs also contain vitamins A, E, B5, B12, as well as iron, iodine and phosphorus. \n\nEggs provide us with very high-quality protein that contains all nine essential amino acids in the right amounts needed by the body for optimum growth and maintenance perfect for bulking. Some other foods contain proportionately more protein than eggs but it’s the quality of the protein in eggs that really stands out.\n\nEggs help increase levels of high-density lipoprotein (HDL), or “good” cholesterol as it’s commonly known. Higher levels of HDL can help reduce the risk of heart disease.',
            ),
            DisplayContainerScrollable(
                title: 'Salad:',
                subtitle:
                    'Leafy greens include kale, spinach, collards, swiss chards and a few others.\n\nThey have several properties that make them perfect for a weight loss diet, such as being low in calories and carbohydrates and loaded with fiber.\n\nEating leafy greens is a great way to increase the volume of your meals, without increasing the calories. Numerous studies show that meals and diets with a low energy density make people eat fewer calories overall.\n\nLeafy greens are also incredibly nutritious and very high in many vitamins, antioxidants and minerals, including calcium, which has been shown to aid fat burning in some studies.'),
            DisplayContainerScrollable(
                title: 'Potato and kumara:',
                subtitle:
                    'It’s important to keep caloric needs in mind when eating for muscle growth and recovery. Potatoes are a perfect option for this. They’re rich in carbohydrates, which provide a necessary energy source.\n\nKumara in particular because they’re filling, sweet, and rich in antioxidants. Whichever potato you choose, It is suggested to eat them before your workout for energy or after your workout for recovery.'),
            DisplayContainerScrollable(
                title: 'Milk:',
                subtitle:
                    'Since milk is a good source of calories, protein, and other nutrients, it offers a balanced approach to gaining weight.\n\nMilk is naturally high in calcium and often fortified with vitamin D — two nutrients that are vital to bone development and health. What’s more, it contains vitamin A, which promotes optimal eye health and supports your immune system.\n\nThe two main proteins in milk are whey and casein. Some studies show that these proteins may help reduce blood pressure and cholesterol levels — two risk factors for heart disease.\n\nIn addition, studies indicate that drinking milk after exercise may help build lean muscle and improve body composition instead of fat mass - specifically, the whey and casein proteins in cow’s milk.\n\nOne 12-week study in 10 young women found that drinking 24 ounces (1 liter) of skim milk after resistance exercise led to significantly greater muscle mass gains and fat loss compared to drinking a carb drink with the same number of calories (6Trusted Source).n\n\nAnother study in 8 men observed that drinking approximately 2 cups (500 ml) of skim milk after resistance exercise led to significantly higher rates of muscle building compared to consuming a nutritionally similar soy beverage'),
            DisplayContainerScrollable(
                title: 'Cheese:',
                subtitle:
                    'Protein-packed cheese is a smart snack for building muscle. Protein is made of amino acids, which are the building blocks of muscle tissue. It’s one of the single best sources of whey protein, which is especially advantageous for muscle building.\n\nCheese is what you call a whole food. Whole foods are generally good for you, as long as you don’t eat too much of one thing.\n\nCheese is a great source of calcium, fat, and protein. It also contains high amounts of vitamins A and B-12, along with zinc, phosphorus, and riboflavin.\n\nCheese made from the milk of 100 percent grass-fed animals is the highest in nutrients and also contains omega-3 fatty acids and vitamin K-2 and also means it will keep your bones strong.\n\nNutrition profiles vary widely from one type of cheese to the next. For example, mozzarella contains 85 calories and 6.3 grams of fat per ounce.\nCompare that to Brie, which has 95 calories and 7.9 grams of fat per ounce, and cheddar, which has 113 calories and 9 grams of fat.\nIf you want to stick with lower-calorie cheeses, try part-skim mozzarella, Swiss cheese, and feta cheese.\n\nIf sodium is a concern, try Swiss, which contains only 20 milligrams per ounce.\nStay away from harder cheeses, as they require more salt in the aging process. Also, you can look for lower-sodium varieties of your favorite cheeses.'),
            // DisplayContainerScrollable(
            //     title: 'Smoothie:',
            //     subtitle:
            //         'Because smoothies are so customizable, it’s fairly easy to pack them with nutrients. So adding fresh fruit, avocados and milk cuts down the sugar content and gives a good amount of protein to fill you up for the day.'),
            // DisplayContainerScrollable(
            //     title: 'Quinoa:',
            //     subtitle:
            //         ' If ever there was a perfect post-workout food, it’s quinoa. Not only is it high in protein and fiber, it’s also high in magnesium and iron, which helps to promote protein synthesis. Plus, it contains all nine amino acids essential for building muscle, and it’s gluten-free, so it’s easy to digest.\n\nQuinoa is the ideal side dish for bodyweight training. 100 g provides 15 g of vegan protein. This grain is also very high in magnesium (275 mg), which plays a key role in muscle contraction. Quinoa is also a good source of carbohydrates with 14 grams of protein in every 100 grams. These proteins also contain essential amino acids which help in muscle building.'),
            // DisplayContainerScrollable(
            //     title: 'Tuna:',
            //     subtitle:
            //         'In addition to 20 grams of protein per 3-ounce (85-gram) serving, tuna contains high amounts of vitamin A and several B vitamins, including B12, niacin and B6. These nutrients are important for optimal health, energy and exercise performance.\n\nAdditionally, tuna provides large amounts of omega-3 fatty acids, which may support muscle health.\n\nThis may be particularly important for older adults. Research has shown that omega-3 fatty acids can slow the loss of muscle mass and strength that occurs with age.'),
            // DisplayContainerScrollable(
            //     title: 'Chicken:',
            //     subtitle:
            //         'The lean protein in chicken is an excellent source of amino acids. Our bodies use amino acids to build muscle tissue, something that is particularly important as we age. Studies have also shown that higher protein intake helps to maintain bone mineral density. Eating chicken can help to build stronger muscles and promote healthier bones, decreasing the risk of injuries and diseases such as osteoporosis.\n\nDarker cuts like the thigh and drumstick contain higher caloric content than lighter cuts like the breast. Keeping the skin or frying chicken will also add saturated fat.\nChicken is filled with high-quality proteins and doesn’t contain much fat — especially if you eat lean cuts. Beyond its rich protein content, chicken also contains:\n\nVitamin B12\nTryptophan\nCholine\n Zinc\n Iron\n Copper'),
            // DisplayContainerScrollable(
            //     title: 'Soybeans:',
            //     subtitle:
            //         'Half a cup (86 grams) of cooked soybeans contains 14 grams of protein, healthy unsaturated fats and several vitamins and minerals.\n\nSoybeans are a particularly good source of vitamin K, iron and phosphorus.\n\nIron is used to store and transport oxygen in your blood and muscles, and a deficiency can impair these functions.\n\nYoung women may be particularly at risk of iron deficiency due to blood loss during menstruation.'),
            // DisplayContainerScrollable(
            //     title: 'Cottage cheese:',
            //     subtitle:
            //         'Protein-packed cottage cheese is a smart snack for building muscle. Protein is made of amino acids, which are the building blocks of muscle tissue. It’s one of the single best sources of whey protein, which is especially advantageous for muscle building.\n\nCheese is what you call a whole food. Whole foods are generally good for you, as long as you don’t eat too much of one thing.\n\nCottage cheese is a great source of calcium, fat, and protein. It also contains high amounts of vitamins A and B-12, along with zinc, phosphorus, and riboflavin.\n\nCheese made from the milk of 100 percent grass-fed animals is the highest in nutrients and also contains omega-3 fatty acids and vitamin K-2 and also means it will keep your bones strong.'),
            SizedBox(
              height: 10,
            ),
            Text('Dinners', style: AppConstants.labelStyle),
            SizedBox(
              height: 10,
            ),
            DisplayContainer(title: 'Chicken', subtitle: 'Include: Broccoli and Quinoa'),
            DisplayContainer(title: 'Red Meat', subtitle: 'Include: Rice'),
            DisplayContainer(title: 'Fish', subtitle: 'Include: Kale, chickpeas and avocado'),
            DisplayContainer(title: 'Steak', subtitle: 'Include:Broccoli'),
            DisplayContainerScrollable(
                title: 'Chicken:',
                subtitle:
                    'The lean protein in chicken is an excellent source of amino acids. Our bodies use amino acids to build muscle tissue, something that is particularly important as we age. Studies have also shown that higher protein intake helps to maintain bone mineral density. Eating chicken can help to build stronger muscles and promote healthier bones, decreasing the risk of injuries and diseases such as osteoporosis.\n\nDarker cuts like the thigh and drumstick contain higher caloric content than lighter cuts like the breast. Keeping the skin or frying chicken will also add saturated fat.\nChicken is filled with high-quality proteins and doesn’t contain much fat — especially if you eat lean cuts. Beyond its rich protein content, chicken also contains:\n\nVitamin B12\nTryptophan\nCholine\n Zinc\n Iron\n Copper'),
            DisplayContainerScrollable(
                title: 'Quinoa:',
                subtitle:
                    ' If ever there was a perfect post-workout food, it’s quinoa. Not only is it high in protein and fiber, it’s also high in magnesium and iron, which helps to promote protein synthesis. Plus, it contains all nine amino acids essential for building muscle, and it’s gluten-free, so it’s easy to digest.\n\nQuinoa is the ideal side dish for bodyweight training. 100 g provides 15 g of vegan protein. This grain is also very high in magnesium (275 mg), which plays a key role in muscle contraction. Quinoa is also a good source of carbohydrates with 14 grams of protein in every 100 grams. These proteins also contain essential amino acids which help in muscle building.'),
            DisplayContainerScrollable(
                title: 'Red Meat:',
                subtitle:
                    'Red meats are probably one of the best muscle-building foods available.\n\nFor example, 6 ounces (170 grams) of steak contains around 5 grams of leucine.\n\nLeucine is the key amino acid your body needs to stimulate muscle protein synthesis and add new muscle tissue. It also contains 456 calories and nearly 49 grams of protein.\n\nIn addition to this, red meats are one of the best natural sources of dietary creatine, which is possibly the world’s best muscle-building supplement.\n\nConsider choosing fattier cuts, which provide more calories than leaner meats, helping you take in extra calories and add weight.\n\nIn one study, 100 older women added 6 ounces (170 grams) of red meat to their diets and performed resistance training 6 days a week for 6 weeks.\n\nThe women gained lean mass, had an 18 percent increase in strength, and had an increase in the important muscle-building hormone IGF-1.\n\nBoth lean and fatty meats are a great source of protein, though fatty meat provides more calories, which can help you gain weight. One of the best-known fatty beef dishes is brisket.\n\nBrisket is known for being time-consuming to prepare, but it can be much easier if you own a slow cooker.\n\nStart this brisket recipe in the morning and you’ll have a nutritious dinner waiting for you in the evening — approximately 300 calories per 3-ounce (85 grams) serving.'),
            DisplayContainerScrollable(
                title: 'Broccoli, cauliflower and cabbage:',
                subtitle:
                    'Cruciferous vegetables include broccoli, cauliflower, cabbage and Brussels sprouts.\n\nLike other vegetables, they’re high in fiber and tend to be incredibly filling.\n\nWhat’s more, these types of veggies generally contain decent amounts of protein.\n\nThey’re not nearly as high in protein as animal foods or legumes but still high compared to most vegetables.\n\nA combination of protein, fiber and low energy density makes cruciferous vegetables the perfect foods to include in your meals if you need to lose weight.\n\nThey’re also highly nutritious and contain cancer-fighting substances.'),
            DisplayContainerScrollable(
                title: 'Rice:',
                subtitle:
                    'Rice is a convenient, low cost carb source to help you gain weight. Just 1 cup (158 grams) of cooked white rice provides 204 calories, 44 grams of carbs, and very little fat .\n\nRice is also fairly calorie-dense, meaning you can easily obtain a high amount of carbs and calories from a single serving. This helps you eat more food, especially if you have a poor appetite or get full quickly.\n\nWhen you’re on the go or in a rush, 2-minute packs of microwavable rice can be easily added to other protein sources and premade meals.\n\nAnother popular method is to prepare a large pot of rice, refrigerate it or freeze individual portions, and then combine it with different proteins and healthy fats for varied meals throughout the week.\n\nThere are many ways to turn relatively bland rice into a taste extravaganza. The easiest way to add taste, calories, and a protein boost is to simply stir in some of these ingredients after you have cooked your rice:\n\nbutter and Parmesan cheese\nbroccoli and cheese\nscrambled eggs\ntoasted sesame seeds, peanuts, or cashews\nAnother way to boost taste and calories is to top your rice with a sauce like curry, pesto, or alfredo. You can buy these sauces ready-made if you’re pressed for time.\n\nA rice dish can easily become a whole meal. Try this wild rice and chicken kale for a healthy lunch (400 calories per serving).'),
            DisplayContainerScrollable(
                title: 'Potato and kumara:',
                subtitle:
                    'It’s important to keep caloric needs in mind when eating for muscle growth and recovery. Potatoes are a perfect option for this. They’re rich in carbohydrates, which provide a necessary energy source.\n\nKumara in particular because they’re filling, sweet, and rich in antioxidants. Whichever potato you choose, It is suggested to eat them before your workout for energy or after your workout for recovery.'),
            DisplayContainerScrollable(
                title: 'Avocado:',
                subtitle:
                    'Avocados are a unique fruit.\n\nWhile most fruits are high in carbs, avocados are loaded with healthy fats.\n\nThey’re particularly high in monounsaturated oleic acid, the same type of fat found in olive oil.\n\nDespite being mostly fat, avocados also contain a lot of water and fiber, making them less energy-dense than you may think.\n\nWhat’s more, they’re a perfect addition to vegetable salads, as studies show that their fat content can increase carotenoid antioxidant absorption from the vegetables 2.6- to 15-fold.\n\nThey also contain many important nutrients, including fiber and potassium.'),
            DisplayContainerScrollable(
                title: 'Steak:',
                subtitle:
                    'Beef is rich in protein and iron, which your body uses to build red blood cells. They take oxygen to your organs, so falling short in those can zap your energy. Broccoli is the perfect side, because its vitamin C helps your body take in iron. A half-cup of this veggie has 65% of all the vitamin C you need in a day.'),
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
