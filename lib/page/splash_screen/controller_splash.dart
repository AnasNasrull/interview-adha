import 'package:fluttertest/route/route_names.dart';
import 'package:get/get.dart';

class ControllerSplash extends GetxController{
  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(Routes.HOME);
    super.onInit();
  }
}