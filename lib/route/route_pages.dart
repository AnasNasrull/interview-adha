import 'package:fluttertest/page/home/binding_home.dart';
import 'package:fluttertest/page/login/binding_login.dart';
import 'package:fluttertest/page/login/page_login.dart';
import 'package:fluttertest/page/register/binding_register.dart';
import 'package:fluttertest/page/register/page_register.dart';
import 'package:fluttertest/page/splash_screen/binding_splash.dart';
import 'package:fluttertest/page/splash_screen/page_splash.dart';
import 'package:fluttertest/route/route_names.dart';
import 'package:get/get.dart';
import '../page/home/page_home.dart';
import '../page/welcome/binding_welcome.dart';
import '../page/welcome/page_welcome.dart';

class RoutingPages{
  static final pages =[
    GetPage(
        name: Routes.INITIAL,
        page: ()=> const PageSplash(),
        binding: BindingSplash()
    ),
    GetPage(
        name: Routes.WELCOME,
        page: ()=> const PageWelcome(),
        binding: BindingWelcome()
    ),
    GetPage(
        name: Routes.LOGIN,
        page: ()=> const PageLogin(),
        binding: BindingLogin()
    ),
    GetPage(
        name: Routes.REGISTER,
        page: ()=> const PageRegister(),
        binding: BindingRegister()
    ),
    GetPage(
        name: Routes.HOME,
        page: ()=> const PageHome(),
        binding: BindingHome()
    ),
  ];
}