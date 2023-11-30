import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payhub/src/components/custom_text.dart';
import 'package:payhub/src/core/constants/dimensions.dart';
import 'package:payhub/src/core/constants/font_weight.dart';
import 'package:payhub/src/core/constants/palette.dart';
import '../../../core/database/user_controller.dart';
import '../../../core/database/user_model.dart';

class LoginController extends GetxController {
  final UserController userController = Get.put(UserController());

  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;

  Future<dynamic> loginUser() async {
    String email = emailController.value.text;
    String password = passwordController.value.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      User? user = await userController.loginUser(email, password);
      if (user != null) {
        return CustomText(
            text: 'Success',
            color1: AppColors.blue,
            fontWeight: fontWeight600,
            fontSize: font_25);
      } else {}
    } else {}
  }
}
