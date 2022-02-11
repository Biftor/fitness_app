import 'package:fitness_app/constants.dart';
import 'package:fitness_app/model/days.dart';
import 'package:fitness_app/size_config.dart';
import 'package:fitness_app/widget/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivityScreen extends StatelessWidget {
  final int currentDay = 4;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 90,
      width: double.infinity,
      child: Column(
        children: [_buildActivitySection()],
      ),
    );
  }

  Widget _buildActivitySection() {
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: CustomColors.kBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          // Ideally these cards should be the data fetched from API or they have a specific model but for simplicity let's just go like this :)
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildCard(
                  color: CustomColors.kYellowColor,
                  title: 'اندازه گیری ضربان قلب',
                  iconPath: Icons.favorite_border
                ),
                _buildCard(
                  color: CustomColors.kCyanColor,
                  title: 'تعیین شاخص توده بدنی',
                  iconPath: Icons.person_add
                ),
                _buildCard(
                  color: CustomColors.kLightPinkColor,
                  title: 'کالری شمار',
                  iconPath: Icons.slow_motion_video
                ),
                _buildCard(
                  color: CustomColors.kPrimaryColor,
                  title: 'اندازه گیری میزان آلزایمر',
                  iconPath: Icons.update,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildCard(
      {Color color,
      IconData iconPath,
      String title,
      String subtitle,
      String time}) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12.0)),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.2),
              child: Icon(iconPath, color: Colors.white,)
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  Container _buildDateSection() {
    return Container(
      height: SizeConfig.blockSizeVertical * 10,
      // color: Colors.red,
      child: ListView.builder(
          itemCount: days.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            int dayValue = int.parse(days[index].dayNumber);
            return Container(
              padding: EdgeInsets.all(6.0),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Text(
                    days[index].dayName,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: dayValue == currentDay
                            ? CustomColors.kPrimaryColor
                            : currentDay < dayValue
                                ? CustomColors.kLightColor
                                : Colors.black),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  CircleAvatar(
                      backgroundColor: dayValue == currentDay
                          ? CustomColors.kPrimaryColor
                          : Colors.transparent,
                      child: Text(
                        days[index].dayNumber,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: dayValue >= currentDay
                                ? CustomColors.kLightColor
                                : Colors.black),
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
