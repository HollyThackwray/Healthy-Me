import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';

class Journel8Screen extends StatefulWidget {
  Journel8Screen({Key? key}) : super(key: key);

  @override
  _Journel8ScreenState createState() => _Journel8ScreenState();
}

class _Journel8ScreenState extends State<Journel8Screen> {
  final List<String> clients = [
    'HThack_02',
    'EBaguley',
    'Jamie.Smit',
    'Gym.Bud',
    'Com_Fit',
    'Micheal_88',
  ];

  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.lightBlue.withOpacity(0.20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Image.asset(
                    Images.pencil_extra_large,
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
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
                  subTitle: 'JOURNAL',
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          Theme.of(context).dividerColor == Colors.black ? AppColors.lightBlackHeading : Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoSearchTextField(
                      itemColor: Theme.of(context).dividerColor,
                      controller: _searchController,
                      placeholder: 'Search With Username or Email',
                      // decoration: BoxDecoration(
                      //   border: Border.all(
                      //     color: Theme.of(context).dividerColor,
                      //   ),
                      // ),
                      backgroundColor: Colors.transparent,

                      borderRadius: BorderRadius.circular(30),
                      placeholderStyle: AppConstants.bulkinDaysTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: clients
                      .map(
                        (e) => Column(
                          children: [
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle, color: AppColors.darkerBlueBorder),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    e,
                                    style: AppConstants.buttonTextStyle,
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors.lightBlue,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 40, top: 10, bottom: 10, right: 10),
                                      child: Image.asset(
                                        Images.forward_arrow,
                                        height: 12,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
