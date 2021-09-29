import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class FitnessMoreInformationScreen extends StatelessWidget {
  const FitnessMoreInformationScreen({Key? key}) : super(key: key);

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