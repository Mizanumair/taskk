import 'package:get/get.dart';
import 'package:payhub/src/features/auth/login/login_controller.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies(){
    Get.put<LoginController>(LoginController());
  }
}