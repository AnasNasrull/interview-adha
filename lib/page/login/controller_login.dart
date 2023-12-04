import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:fluttertest/api/local_service.dart';
import 'package:fluttertest/response/user.dart';
import 'package:fluttertest/route/route_names.dart';
import 'package:fluttertest/shared/controller/controller_user.dart';
import 'package:get/get.dart';

import 'api_login.dart';


enum Status {idle, loading, success, failed}

class ControllerLogin extends GetxController{
  final ApiLogin api;
  ControllerLogin({required this.api});

  final formkeyLogin = GlobalKey<FormState>();

  var loading = Status.idle.obs;

  var edtEmail = TextEditingController();
  var edtPassword = TextEditingController();

  ControllerUser controllerUser = Get.find<ControllerUser>();

  @override
  void dispose() {
    edtEmail.dispose();
    edtPassword.dispose();
    super.dispose();
  }

  validator(){
    if(formkeyLogin.currentState!.validate()){
      loginMethod();
    }
  }

  loginMethod()async{
    try{
      loading(Status.loading);
      var r = await api.login(email: edtEmail.text, password: edtPassword.text);
      if(r['message'] == 'success'){
        var tokenValue = r['data']['token'];
        await LocalService().setToken(token: tokenValue);
        await LocalService().setIsLogin(isLogin: true);
        var user = r['data']['profile'];
        var mapUser = User.fromJson(user);
        controllerUser.user.value = mapUser;
        await LocalService().setUser(user: mapUser.toJson());
        loading(Status.success);
        Get.offAllNamed(Routes.HOME);
      }else{
        log('Ada yang salah');
        loading(Status.failed);
      }
    }catch(e){
      log('$e');
      loading(Status.failed);
    }
  }

}