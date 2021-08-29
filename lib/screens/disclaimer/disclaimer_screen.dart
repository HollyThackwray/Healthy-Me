import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        elevation: 0,
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBannerSubHeadingWidget(
              size: size,
              title: 'HEALTHY ME',
              subTitle: 'DISCLAIMER',
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Text(
              'Disclaimers for Healthy me',
              style: AppConstants.bulkinDaysTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                '''All the information on this app - Healthy me - is published in good faith and for general information purpose only. Leapyear Games does not make any warranties about the completeness, reliability and accuracy of this information. Any action you take upon the information you find on this app (Healthy me), is strictly at your own risk. Leapyear Games will not be liable for any losses and/or damages in connection with the use of our website.''',
                style: AppConstants.bulkinDaysTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                '''From our app, you can visit other websites by following hyperlinks to such external sites. While we strive to provide only quality links to useful and ethical websites, we have no control over the content and nature of these sites. These links to other websites do not imply a recommendation for all the content found on these sites. Site owners and content may change without notice and may occur before we have the opportunity to remove a link which may have gone ‘bad’.''',
                style: AppConstants.bulkinDaysTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                '''Please be also aware that when you leave our website, other sites may have different privacy policies and terms which are beyond our control. Please be sure to check the Privacy Policies of these sites as well as their “Terms of Service” before engaging in any business or uploading any information. Our Privacy Policy was created by the Privacy Policy Generator.''',
                style: AppConstants.bulkinDaysTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Consent',
              style: AppConstants.bulkinDaysTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                '''By using our website, you hereby consent to our disclaimer and agree to its terms.''',
                style: AppConstants.bulkinDaysTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Update',
              style: AppConstants.bulkinDaysTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                '''Should we update, amend or make any changes to this document, those changes will be prominently posted here.''',
                style: AppConstants.bulkinDaysTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
