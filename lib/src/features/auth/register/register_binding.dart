import 'package:get/get.dart';
import 'package:payhub/src/features/auth/register/register_controller.dart';

class RegisterBinding implements Bindings{

  @override
  void dependencies(){
    Get.put<RegisterController>(RegisterController());
  }
}