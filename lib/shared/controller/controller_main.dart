import 'package:fluttertest/page/splash_screen/controller_splash.dart';
import 'package:fluttertest/shared/controller/controller_user.dart';
import 'package:get/get.dart';

class ControllerMain extends Bindings{
  @override
  void dependencies() {
    Get.put(ControllerSplash());
    Get.put(ControllerUser());
  }
}
