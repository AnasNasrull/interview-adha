import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertest/page/welcome/controller_welcome.dart';
import 'package:fluttertest/route/route_names.dart';
import 'package:get/get.dart';

class PageWelcome extends GetView<ControllerWelcome>{
  const PageWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const Image(
              image: AssetImage('assets/images/bg_welcome.png')
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: Get.height * 0.47,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(18)
                )
              ),
              child: Column(
                children: <Widget>[
                  const Image(
                      height: 150,
                      width: 150,
                      image: AssetImage('assets/images/logo login.png')
                  ),
                  const Text(
                    'Making Memories',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Helvetica Bold',
                    ),
                  ),
                  const Text(
                    'of Those Giving Their Best',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: ()=> Get.toNamed(Routes.REGISTER),
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              backgroundColor: const Color(0XFFA67C52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                              ),
                              fixedSize: Size(Get.width * 0.4, Get.height * 0.06)
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                color: Colors.white,
                                fontSize: 12
                              ),
                            )
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: ()=> Get.toNamed(Routes.LOGIN),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                  width: 1,
                                  color: Color(0XFFA67C52),
                                )
                              ),
                              fixedSize: Size(Get.width * 0.4, Get.height * 0.06)
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                color: Color(0XFFA67C52),
                                fontSize: 12
                              ),
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}