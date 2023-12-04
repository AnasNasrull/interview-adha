import 'package:fluttertest/page/splash_screen/controller_splash.dart';
import 'package:get/get.dart';

class BindingSplash implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerSplash>(() => ControllerSplash());
  }
}