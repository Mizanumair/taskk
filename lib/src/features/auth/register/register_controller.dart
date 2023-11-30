import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payhub/src/components/custom_text.dart';
import 'package:payhub/src/core/constants/dimensions.dart';
import 'package:payhub/src/core/constants/palette.dart';
import 'package:payhub/src/core/database/user_controller.dart';

import '../../../core/constants/font_weight.dart';
import '../../../core/database/database_helper.dart';
import '../../../core/database/user_model.dart';

class RegisterController extends GetxController {
  final UserController userController = Get.put(UserController());
  final Rx<TextEditingController> nameController = TextEditingController().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  final Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  Future<dynamic> registerUser() async {
    String name = nameController.value.text;
    String email = emailController.value.text;
    String password = passwordController.value.text;
    String confirmPassword = confirmPasswordController.value.text;

    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      await userController.registerUser(name, email, password, confirmPassword).obs;

      Get.toNamed('/login');
    } else {
      CustomText(
          text: 'Invalid',
          color1: AppColors.blue,
          fontWeight: fontWeight800,
          fontSize: font_25);

    }
  }
}
