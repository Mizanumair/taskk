import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:payhub/src/components/custom_button.dart';
import 'package:payhub/src/components/custom_divider.dart';
import 'package:payhub/src/components/custom_text.dart';
import 'package:payhub/src/components/custom_textfield.dart';
import 'package:payhub/src/core/constants/assets.dart';
import 'package:payhub/src/core/constants/dimensions.dart';
import 'package:payhub/src/core/constants/palette.dart';
import 'package:payhub/src/core/constants/strings.dart';
import 'package:payhub/src/features/auth/login/login_controller.dart';

import '../../../core/constants/font_weight.dart';
import '../auth_controller.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: margin_15),
          children: [
            CustomDivider(
              height: height_40,
            ),
            CustomText(
              text: strLetLog,
              color1: AppColors.darkBlue,
              fontWeight: fontWeight700,
              fontSize: font_25,
              height: height_10,
            ),
            CustomTextField(
                controller: emailController,
                labelText: 'Email',
                prefixIcon: null,
                obscure: false,
                height: height_10,
                textInputType: TextInputType.emailAddress),
            CustomTextField(
                controller: passwordController,
                labelText: 'Password',
                prefixIcon: null,
                obscure: true,
                lines: 1,
                height: height_10,
                textInputType: TextInputType.text),
            CustomButton(
              text: 'Log In',
              color: AppColors.white,
              fontWeight: fontWeight600,
              font: font_15,
              onPress: () {
                authController.login(
                    emailController.text, passwordController.text);
              },
            ),
            CustomButton(
                text: 'Sign Up',
                color: AppColors.white,
                fontWeight: fontWeight600,
                font: font_15,
                onPress: (){
                  Get.toNamed('/register');
                },
            )
          ],
        ),
      ),
    );
  }
}

// ElevatedButton(
// onPressed: loginController.isLoading.value
// ? null
//     : () => loginController.login(),
// child: loginController.isLoading.value
// ? CircularProgressIndicator()
//     : Text('Login'),
// );
