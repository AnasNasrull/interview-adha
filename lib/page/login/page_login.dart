import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertest/route/route_names.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'controller_login.dart';

class PageLogin extends GetView<ControllerLogin>{
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF4F0ED),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: const Color(0xFFF4F0ED),
        leading: InkWell(
            onTap: ()=> Get.back(),
            child: const Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
              size: 30,
            )
        ),

      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: Get.height * 0.88,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18)
                  )
              ),
              child: Form(
                key: controller.formkeyLogin,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 200, 10, 10),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontFamily: 'Helvetica Bold',
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F0ED),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: TextFormField(
                          controller: controller.edtEmail,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 12
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Email / Phone number',
                            hintStyle: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 12
                            ),
                            border: InputBorder.none
                          ),
                          validator: Validatorless.multiple([
                            Validatorless.required('Email tidak boleh kosong'),
                            Validatorless.email('Email tidak sesuai')
                          ]),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F0ED),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: TextFormField(
                          obscureText: true,
                          controller: controller.edtPassword,
                          keyboardType: TextInputType.visiblePassword,
                          style: const TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 12
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 12
                            ),
                            suffixIcon: Icon(
                                Icons.key_outlined,
                                color: Color(0XFFE1D3C9)
                            ),
                            border: InputBorder.none,
                          ),
                          validator: Validatorless.multiple([
                            Validatorless.required('Password tidak boleh kosong'),
                            Validatorless.min(3, 'Password tidak boleh kurang dari 3 karakter')
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            onPressed: ()=> controller.validator(),
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                backgroundColor: const Color(0XFFA67C52),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                fixedSize: Size(Get.width * 0.8, Get.height * 0.06)
                            ),
                            child: const Text(
                              'Login ',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Colors.white,
                                  fontSize: 12
                              ),
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 120),
                        child: TextButton(
                            onPressed: (){},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Helvetica',
                                  color: Color(0xFFA67C52),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFFA67C52)
                              ),
                            )
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Helvetica',
                                color: Color(0xFFA67C52),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFA67C52)
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                  text: 'Create Your Free Account. ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Helvetica',
                                      color: Colors.black,
                                      decoration: TextDecoration.none
                                  )
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){}
                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: const Image(
                      height: 120,
                      width: 120,
                      image: AssetImage('assets/images/logo login.png')
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}