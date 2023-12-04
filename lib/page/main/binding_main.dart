import 'package:fluttertest/page/main/api_main.dart';
import 'package:fluttertest/page/main/controller_main.dart';
import 'package:get/get.dart';

class BindingMain implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerMain>(() => ControllerMain(api: ApiMain()));
  }
}