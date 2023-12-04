import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertest/page/splash_screen/controller_splash.dart';
import 'package:get/get.dart';

class PageSplash extends GetView<ControllerSplash>{
  const PageSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
            width: 200,
            height: 200,
            image: AssetImage('assets/images/logo login.png')
        ),
      ),
    );
  }
}