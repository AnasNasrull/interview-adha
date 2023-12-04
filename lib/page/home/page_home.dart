import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertest/page/home/controller_home.dart';
import 'package:get/get.dart';

class PageHome extends GetView<ControllerHome>{
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: const Color(0xFFF4F0ED),
      body: IndexedStack(
        index: controller.currentPage.value,
        children: controller.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: const Color(0xFFA67C52),
        currentIndex: controller.currentPage.value,
        onTap: (index) => controller.changePage(index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_rounded),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_rounded),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: '',
              backgroundColor: Colors.white),
        ],
      ),
    )
    );
  }
}