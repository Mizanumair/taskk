
import 'package:get/get.dart';
import 'package:payhub/src/features/auth/register/register_binding.dart';
import 'package:payhub/src/features/auth/register/register_screen.dart';
import 'package:payhub/src/features/features/dashboard/home_binding.dart';
import 'package:payhub/src/features/features/dashboard/home_screen.dart';

import '../../features/auth/login/login_binding.dart';
import '../../features/auth/login/login_screen.dart';


class AppRoutes {

  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';


  static String getLoginRoute() => login;
  static String getRegisterRoute() => register;
  static String getHomeRoute() => home;


  static generateRoute( settings) {
    switch (settings.name) {
      case login:
        return GetPageRoute(
            settings: settings,
            routeName: getLoginRoute(),
            page: () => LoginScreen());
      case register:
        return GetPageRoute(
            settings: settings,
            routeName: getRegisterRoute(),
            page: () =>  RegisterScreen());
      case home:
        return GetPageRoute(
            settings: settings,
            routeName: getHomeRoute(),
            page: () =>  HomeScreen());

      default:
        return null;
    }
  }

  static getPages() => [

        GetPage(
          name: login,
          page: () => LoginScreen(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: register,
          page: () => RegisterScreen(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: home,
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),

      ];
}
