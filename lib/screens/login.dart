import 'dart:ui';

import 'package:fitness_app/constants.dart';
import 'package:fitness_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: ListView(
            children: [
              Image.asset(
                'assets/images/login.png',
                width: double.infinity,
              ),
              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(0, 0),
                        blurRadius: 20)
                  ],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'نام و نام خانوادگی'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(0, 0),
                        blurRadius: 20)
                  ],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const TextField(
                  decoration:
                      InputDecoration(border: InputBorder.none, hintText: 'سن'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(0, 0),
                        blurRadius: 20)
                  ],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                // padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.kPrimaryColor,
                  ),
                  onPressed: () {
                    Get.off(
                      () => HomeScreen(),
                      transition: Transition.zoom,
                      duration: Duration(milliseconds: 1000),
                    );
                  },
                  child: Text(
                    'تایید',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
