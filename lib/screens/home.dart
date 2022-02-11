import 'package:fitness_app/constants.dart';
import 'package:fitness_app/screens/activity_screen.dart';
import 'package:fitness_app/screens/dashboard_screen.dart';
import 'package:fitness_app/screens/metric_screen.dart';
import 'package:fitness_app/screens/profile_screen.dart';
import 'package:fitness_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;

  final tabs = [
    MetricScreen(),
    ActivityScreen(),
    DashboardScreen(),
    ProfileScreen()
  ];

  final icons = const [
    Icon(Icons.assignment),
    Icon(Icons.favorite),
    Icon(Icons.directions_walk),
    Icon(Icons.person),
  ];

  @override
  void initState() {
    Get.put(DashboardScreenController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // This is to instantiate the class responsible for Responsive UI
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: CustomColors.kPrimaryColor,
                size: 30,
              ),
              onPressed: () {}),
          title: SizedBox(
            height: 50,
            child: Image.asset('assets/images/BGLogo.png'),
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(
                Icons.notifications,
                size: 30,
                color: CustomColors.kPrimaryColor,
              ),
            )
          ],
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 28,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          selectedItemColor: CustomColors.kPrimaryColor,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: List.generate(
            icons.length,
            (index) => BottomNavigationBarItem(
              icon: icons[index],
              label: '',
            ),
          ),
        ),
      ),
    );
  }
}

// BottomNavigationBarItem(
//                 icon: Icon(Icons.favorite),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.directions_walk),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: '',
//               ),
