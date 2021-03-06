import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/models/plan_model.dart';
import 'package:hollythackwray/providers/firebase_provider.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/screens/change_program/change_program_screen.dart';
import 'package:hollythackwray/screens/journel2/journel_2_screen.dart';
import 'package:hollythackwray/screens/journel6/journel_6_screen.dart';
import 'package:hollythackwray/screens/program_details/program_details_screen.dart';
import 'package:hollythackwray/screens/scan/scan_screen.dart';
import 'package:hollythackwray/screens/settings/settings_screen.dart';
import 'package:hollythackwray/screens/snacks/snacks_screen.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

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
    return Consumer<FirebaseProvider>(
      builder: (context, value, child) => Scaffold(
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
                            IconButton(
                              onPressed: () {
                                Get.to(() => ScanScreen());
                              },
                              icon: Icon(
                                Icons.qr_code_scanner,
                                // Images.setting,
                                size: 36,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Get.to(() => SettingsScreen());
                              },
                              icon: Icon(
                                Icons.settings,
                                // Images.setting,
                                size: 36,
                                color: Theme.of(context).iconTheme.color,
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
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                          });
                        },
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Theme.of(context).iconTheme.color,
                          size: 50,
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
                        height: 50,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                          });
                        },
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.keyboard_arrow_up,
                          color: Theme.of(context).dividerColor,
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 177,
                        width: 177,
                        decoration: BoxDecoration(
                          image: value.user!.profilePic == null
                              ? DecorationImage(
                                  image: AssetImage(
                                    Images.person,
                                  ),
                                  colorFilter: ColorFilter.mode(Theme.of(context).dividerColor, BlendMode.srcIn),
                                  fit: BoxFit.contain,
                                )
                              : DecorationImage(
                                  image: NetworkImage(
                                    value.user!.profilePic!,
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
                        value.user!.firstName! + ' ' + value.user!.lastName!,
                        style: AppConstants.nameTextStyle,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          value.user!.professionalAccount!
                              ? Get.to(() => Journel6Scren())
                              : Get.to(() => Journel2Screen());
                        },
                        child: Row(
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
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('plans').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Container(
                              height: size.height * 0.3,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          if (value.user!.currentProgram!.length == 0) {
                            return Center(
                              child: Text("No Program Selected", style: AppConstants.labelStyle),
                            );
                          }

                          return Column(
                            children: snapshot.data!.docs.map((e) {
                              PlanModel plan = PlanModel.fromMap(e.data() as Map<String, dynamic>);
                              int showOnce = 0;

                              if (value.user!.currentProgram!.any((element) => element!.id == plan.id)) {
                                int time = value
                                    .user!
                                    .currentProgram![
                                        value.user!.currentProgram!.indexWhere((element) => element!.id == plan.id)]!
                                    .date;
                                showOnce++;
                                return Column(
                                  children: [
                                    showOnce == 1
                                        ? Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Divider(
                                                color: Theme.of(context).dividerColor,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              value.user!.currentProgram!.length == 0
                                                  ? Text(
                                                      'No Program Selected :(',
                                                      style: AppConstants.bulkinDaysTextStyle,
                                                      textAlign: TextAlign.center,
                                                    )
                                                  : Container(),
                                              value.user!.currentProgram!.length == 0
                                                  ? Container()
                                                  : IconButton(
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
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() => SnacksScreen());
                                                },
                                                child: Text(
                                                  'SNACKS',
                                                  style: AppConstants.buttonTextStyle.copyWith(
                                                      color: AppColors.darkerBlueBorder,
                                                      decoration: TextDecoration.underline),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => ProgramDetailsScreen(
                                            planModel: plan,
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Successfully on ${plan.title} since ${Jiffy(DateTime.fromMillisecondsSinceEpoch(time)).fromNow()}'
                                            .replaceAll(' ago', ''),
                                        style: AppConstants.toneTextStyle.copyWith(
                                          color: Theme.of(context).dividerColor,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: plan.icons
                                            .map(
                                              (e) => Container(
                                                margin: EdgeInsets.symmetric(horizontal: 5),
                                                child: Image.asset(
                                                  e,
                                                  height: 28,
                                                  // fit: BoxFit.contain,
                                                  color: AppColors.lightBlue,
                                                ),
                                              ),
                                            )
                                            .toList()),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              }
                              return Container();
                            }).toList(),
                          );
                        },
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ChangeProgramScreen());
                            },
                            child: Text(
                              'Change program',
                              style: AppConstants.buttonTextStyle.copyWith(
                                color: AppColors.darkerBlueBorder,
                              ),
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
      ),
    );
  }
}
