import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertest/api/local_service.dart';
import 'package:fluttertest/page/main/api_main.dart';
import 'package:fluttertest/shared/controller/controller_user.dart';
import 'package:get/get.dart';
import '../../response/recent.dart';

enum Status {idle, loading, success, failed}

class ControllerMain extends GetxController{
  final ApiMain api;
  ControllerMain({required this.api});

  var listService = [
    {
      'feature_name' : 'Get\nPhotographer',
      'img' : 'assets/images/first_item.png',
      'color' : const Color(0XFFF4F0ED)
    },
    {
      'feature_name' : 'Request\nLive\nStreaming',
      'img' : 'assets/images/fourth_item.png',
      'color' : const Color(0XFFEDEDF5)
    },
    {
      'feature_name' : 'Rent\nEquipment',
      'img' : 'assets/images/second_item.png',
      'color' : const Color(0XFFF8F2EC)
    },
    {
      'feature_name' : 'Offer\nService',
      'img' : 'assets/images/third_item.png',
      'color' : const Color(0XFFEFEFEF)
    },
  ].obs;

  var isLogin = false.obs;

  var loading = Status.idle.obs;

  RxList<Recent> items = <Recent>[].obs;

  ControllerUser controllerUser = Get.find<ControllerUser>();

  final LocalService localService = LocalService();

  @override
  void onInit() async {
    super.onInit();
    var status = await localService.getLoginStatus();
    if(status != null){
      isLogin.value = status;
    }
    log('status login from local => $status');
    log('status login from class => $isLogin');
    getRecent();
  }

  getRecent ()async{
    try{
      loading(Status.loading);
      var r = await api.recentRequest();

      if(r['message'] == "success"){
        var list = r['data'];
        items(RxList<Recent>.from(list.map((e)=> Recent.fromJson(e))));
        loading(Status.success);
      }else{
        log('Something is wrong');
        loading(Status.failed);
      }
    }catch(e){
      loading(Status.failed);
      log('$e');
    }

  }

}