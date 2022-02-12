import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardScreenController extends GetxController {
  static const String tag = "DashboardScreenController";
  dynamic args;
  String name = "";
  int age = 0;
  RxInt stepsCount = 0.obs;
  RxString pedometerStatus = "".obs;
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;

  DashboardScreenController(
    this.args,
  );

  void onStepCount(StepCount event) {
    /// Handle step count changed
    int steps = event.steps;
    stepsCount(steps);
    //DateTime timeStamp = event.timeStamp;
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    /// Handle status changed
    String status = event.status;
    pedometerStatus(status);
    //DateTime timeStamp = event.timeStamp;
  }

  Future<void> initPlatformState() async {
    bool activityRecognitionGranted =
        await Permission.activityRecognition.request().isGranted;
    if (activityRecognitionGranted) {
      /// Init streams
      _pedestrianStatusStream = await Pedometer.pedestrianStatusStream;
      _stepCountStream = await Pedometer.stepCountStream;

      /// Listen to streams and handle errors
      _stepCountStream.listen(onStepCount);
      _pedestrianStatusStream.listen(onPedestrianStatusChanged);
    } else {
      if (Get.context != null)
        ScaffoldMessenger.of(Get.context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                "دسترسی مورد نیاز به برنامه داده نشده است",
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
    }
  }

  @override
  void onInit() async {
    super.onInit();
    if (args != null && args["name"] != null) {
      name = args["name"];
      age = args["age"];
    }
  }

  @override
  void onReady() async {
    super.onReady();
    initPlatformState();
  }

  int getRandomAge() {
    Random rnd;
    int min = 20;
    int max = 35;
    rnd = Random();
    return min + rnd.nextInt(max - min);
  }
}
