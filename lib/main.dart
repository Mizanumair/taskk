import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payhub/src/core/config/routes.dart';
import 'package:payhub/src/core/constants/palette.dart';
import 'package:payhub/src/features/auth/login/login_binding.dart';
import 'package:payhub/src/features/auth/register/register_binding.dart';



 void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            theme: ThemeData(
              fontFamily: 'Metropolis',
              primarySwatch: Colors.pink,
              colorScheme: const ColorScheme.light(
                primary: AppColors.blue,
              ),
              scaffoldBackgroundColor: AppColors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.white,
                elevation: 0,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 3,
                backgroundColor: AppColors.white,
              ),
            ),
            debugShowCheckedModeBanner: false,
            smartManagement: SmartManagement.full,
            initialRoute: AppRoutes.getLoginRoute(),
            initialBinding:  LoginBinding(),
            // initialRoute: AppRoutes.getAddOrderOneRoute(),
            // initialBinding: AddOrderBinding(),
            getPages: AppRoutes.getPages(),
            onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
          );
        });
  }
}
