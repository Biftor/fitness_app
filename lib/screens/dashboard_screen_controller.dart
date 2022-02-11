import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';

class DashboardScreenController extends GetxController {
  static const String tag = "DashboardScreenController";
  RxInt stepsCount = 0.obs;
  RxString pedometerStatus = "".obs;
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;

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
    /// Init streams
    _pedestrianStatusStream = await Pedometer.pedestrianStatusStream;
    _stepCountStream = await Pedometer.stepCountStream;

    /// Listen to streams and handle errors
    _stepCountStream.listen(onStepCount);
    _pedestrianStatusStream.listen(onPedestrianStatusChanged);
  }

  @override
  void onReady() async {
    super.onReady();
    initPlatformState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
