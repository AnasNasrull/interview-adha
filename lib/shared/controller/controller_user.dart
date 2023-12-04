import 'package:fluttertest/api/local_service.dart';
import 'package:get/get.dart';

import '../../response/user.dart';

class ControllerUser extends GetxController{
  var user = User().obs;

  @override
  void onInit() async {
    super.onInit();
    await setUserData();
  }

  setUserData() async {
    var data = await LocalService().getUser();
    if (data != null) {
      user.value = User.fromJson(data);
    }
  }
}