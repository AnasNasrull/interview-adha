import 'package:fluttertest/page/register/api_register.dart';
import 'package:fluttertest/page/register/controller_register.dart';
import 'package:get/get.dart';

class BindingRegister implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<ControllerRegister>(() => ControllerRegister(api: ApiRegister()));
  }
}