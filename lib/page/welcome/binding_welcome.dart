import 'package:get/get.dart';

import 'controller_welcome.dart';

class BindingWelcome implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerWelcome>(() => ControllerWelcome());
  }
}