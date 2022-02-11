import 'package:fitness_app/constants.dart';
import 'package:fitness_app/size_config.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dashboard_screen_controller.dart';

class DashboardScreen extends GetView<DashboardScreenController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 90,
      child: Column(
        children: [_buildDashboardCards()],
      ),
    );
  }

  Widget _buildDashboardCards() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: CustomColors.kBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Obx(() {
              return _buildCard(
                  color1: CustomColors.kCyanColor,
                  color2: CustomColors.kYellowColor,
                  color3: CustomColors.kPurpleColor,
                  color4: CustomColors.kLightPinkColor,
                  value: 0.8,
                  iconPath: 'assets/icons/footprints.svg',
                  metricType: 'تعداد قدم ها',
                  metricCount1: controller.stepsCount.value.toString(),
                  metricCount2: '860');
            }),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(children: [
                      Container(
                        alignment: Alignment.center,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: CustomColors.kPrimaryColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'سن واقعی',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            const Text(
                              '24',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: -20,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: SizeConfig.blockSizeHorizontal * 8,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        right: 20,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        right: -15,
                        // left: 0,
                        // top: 0,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 30,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Stack(children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: CustomColors.kPrimaryColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'سن فیزیولوژیک',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            const Text(
                              '21',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 100,
                        right: -40,
                        // left: 0,
                        // top: 0,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        top: -40,
                        right: 0,
                        left: 0,
                        // left: 0,
                        // top: 0,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            radius: 50,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: -120,
                        bottom: -60,
                        // left: 0,
                        // top: 0,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.lime,
                            radius: 50,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildCard(
      {Color color1,
      Color color2,
      Color color3,
      Color color4,
      String metricType,
      String metricCount1,
      String metricCount2,
      double value,
      String iconPath}) {
    return Container(
      height: SizeConfig.blockSizeVertical * 30,
      // 30% of screen
      width: SizeConfig.blockSizeHorizontal * 90,
      // 90% of total width of screen
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
      decoration: BoxDecoration(
          color: CustomColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(20.0)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: SizeConfig.blockSizeVertical * 12, // 12% of screen
              width:
                  SizeConfig.blockSizeHorizontal * 23, // 23% of width of screen
              decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(130),
                      topRight: Radius.circular(20))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: CircleAvatar(
                backgroundColor: color2,
                radius: SizeConfig.blockSizeHorizontal * 8,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: SizeConfig.blockSizeVertical * 10, // 12% of screen
              width:
                  SizeConfig.blockSizeHorizontal * 10, // 23% of width of screen
              decoration: BoxDecoration(
                  color: color3,
                  borderRadius: BorderRadius.only(
                      topRight:
                          Radius.circular(SizeConfig.blockSizeVertical * 5),
                      bottomRight:
                          Radius.circular(SizeConfig.blockSizeVertical * 5))),
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 10,
            left: SizeConfig.blockSizeHorizontal * 16,
            child: CircleAvatar(
              backgroundColor: color4,
              radius: SizeConfig.blockSizeHorizontal * 2,
            ),
          ),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            right: SizeConfig.blockSizeHorizontal * 10,
            child: CircleAvatar(
              backgroundColor: color4,
              radius: SizeConfig.blockSizeHorizontal * 6,
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 3,
            left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeVertical * 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        metricType,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        metricCount1,
                        style: CustomTextStyle.metricTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    metricCount2,
                    style: CustomTextStyle.metricTextStyle,
                  ),
                  Text(
                    ' m',
                    style: TextStyle(color: CustomColors.kLightColor),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: SizeConfig.blockSizeVertical * 1, // 12% of screen
              width:
                  SizeConfig.blockSizeHorizontal * 75, // 23% of width of screen
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: LinearProgressIndicator(
                    value: value,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                    backgroundColor: CustomColors.kLightColor.withOpacity(0.2)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildDaysBar() {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
        bottom: SizeConfig.blockSizeVertical * 2,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Today',
            style: CustomTextStyle.dayTabBarStyleActive,
          ),
          Text(
            'Week',
            style: CustomTextStyle.dayTabBarStyleInactive,
          ),
          Text(
            'Month',
            style: CustomTextStyle.dayTabBarStyleInactive,
          ),
          Text(
            'Year',
            style: CustomTextStyle.dayTabBarStyleInactive,
          )
        ],
      ),
    );
  }
}
