import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/page/main/page_main.dart';
import 'package:get/get.dart';

class ControllerHome extends GetxController{
  late PageController pageController;

  var currentPage = 0.obs;

  final List<Widget> pages = [
    PageMain(),
    Container(
      width: Get.width,
      height: Get.height,
      color: Colors.green,
    ),
    Container(
      width: Get.width,
      height: Get.height,
      color: Colors.blue,
    ),
    Container(
      width: Get.width,
      height: Get.height,
      color: Colors.orange,
    ),
    Container(
      width: Get.width,
      height: Get.height,
      color: Colors.purple,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage.value);
  }

  @override
  void onReady() {
    super.onReady();
    var pageArg = Get.arguments;
    if (pageArg != null) {
      changePage(pageArg);
      pageController.jumpToPage(pageArg);
    }
  }

  void changePage(index) => currentPage.value = index;
}