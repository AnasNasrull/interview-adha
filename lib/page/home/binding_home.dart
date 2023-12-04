import 'package:fluttertest/page/home/controller_home.dart';
import 'package:get/get.dart';
import '../main/api_main.dart';
import '../main/controller_main.dart';

class BindingHome implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerHome>(() => ControllerHome());
    Get.lazyPut<ControllerMain>(() => ControllerMain(api: ApiMain()));
  }
}