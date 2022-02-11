import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  static const String tag = "LoginScreenController";
  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    super.onClose();
  }
}
