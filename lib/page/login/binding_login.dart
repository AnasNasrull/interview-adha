import 'package:fluttertest/page/login/controller_login.dart';
import 'package:get/get.dart';

import 'api_login.dart';

class BindingLogin implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerLogin>(() => ControllerLogin(api: ApiLogin()));
  }
}