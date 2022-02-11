import 'package:fitness_app/screens/login_screen_controller.dart';
import 'package:get/get.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginScreenController());
  }
}
