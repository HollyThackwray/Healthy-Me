import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/settings/settings_screen.dart';

class HealtthyMeScreen extends StatefulWidget {
  HealtthyMeScreen({Key? key}) : super(key: key);

  @override
  _HealtthyMeScreenState createState() => _HealtthyMeScreenState();
}

class _HealtthyMeScreenState extends State<HealtthyMeScreen> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: false,
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.lightBlue,
              iconTheme: Theme.of(context).iconTheme,
              elevation: 0,
            ),
            body: Stack(
              children: [
                Transform.scale(
                  scale: 1.7,
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.65,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(size.width),
                        bottomRight: Radius.circular(size.width),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 15,
                        child: Container(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      color: AppColors.lightBlue,
                      child: Center(
                        child: Text(
                          "HEALTHY ME",
                          style: AppConstants.topBarTextStyle.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 15,
                        child: Container(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Image.asset(
                            Images.qr_code,
                            color: Theme.of(context).iconTheme.color,
                            height: 33,
                            fit: BoxFit.fill,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=> SettingsScreen());
                            },
                            child: Image.asset(
                              Images.setting,
                              color: Theme.of(context).iconTheme.color,
                              height: 33,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      Images.healthy_me_logo,
                      // color: Theme.of(context).iconTheme.color,
                      height: 233,
                      fit: BoxFit.fill,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                        });
                      },
                      child: Image.asset(
                        Images.down_arrow,
                        color: Theme.of(context).iconTheme.color,
                        height: 13,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                        });
                      },
                      child: Image.asset(
                        Images.up_arrow,
                        color: Theme.of(context).dividerColor,
                        height: 13,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 177,
                      width: 177,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Images.me,
                          ),
                          fit: BoxFit.contain,
                        ),
                        border: Border.all(
                          color: AppColors.lightBlue,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Holly Thackwray',
                      style: AppConstants.nameTextStyle,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Update Journal',
                          style: AppConstants.buttonTextStyle.copyWith(color: AppColors.darkerBlueBorder),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          Images.pencil,
                          height: 18,
                          color: AppColors.darkerBlueBorder,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      color: Theme.of(context).dividerColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Successfully Bulking for 38 days!',
                      style: AppConstants.bulkinDaysTextStyle,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(
                          Images.share,
                        ),
                      ),
                      iconSize: 20,
                      color: Theme.of(context).dividerColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Theme.of(context).dividerColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'SNACKS',
                      style: AppConstants.buttonTextStyle
                          .copyWith(color: AppColors.darkerBlueBorder, decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'TONE',
                      style: AppConstants.toneTextStyle.copyWith(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.dumble,
                          height: 28,
                          fit: BoxFit.fill,
                          color: AppColors.lightBlue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          Images.running_person,
                          height: 28,
                          fit: BoxFit.fill,
                          color: AppColors.lightBlue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          Images.spoons,
                          height: 28,
                          fit: BoxFit.fill,
                          color: AppColors.lightBlue,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'VEGAN',
                      style: AppConstants.toneTextStyle.copyWith(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Images.spoons,
                          height: 28,
                          fit: BoxFit.fill,
                          color: AppColors.lightBlue,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Change program',
                          style: AppConstants.buttonTextStyle.copyWith(
                            color: AppColors.darkerBlueBorder,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
