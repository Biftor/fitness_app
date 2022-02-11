import 'package:fitness_app/constants.dart';
import 'package:fitness_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleSplash();
  }

  handleSplash() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(
        () => const Login(),
        transition: Transition.zoom,
        duration: Duration(milliseconds: 1000),
        binding: LoginScreenBinding(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: CustomColors.kBackgroundColor,
          body: Center(
            child: Image.asset(
              'assets/images/BGLogo.png',
              scale: 5,
            ),
          ),
        ),
      ),
    );
  }
}
