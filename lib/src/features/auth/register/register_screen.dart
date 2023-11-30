import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:payhub/src/components/custom_button.dart';
import 'package:payhub/src/components/custom_divider.dart';
import 'package:payhub/src/components/custom_textfield.dart';
import 'package:payhub/src/core/constants/dimensions.dart';
import 'package:payhub/src/core/constants/font_weight.dart';
import 'package:payhub/src/core/constants/palette.dart';
import 'package:payhub/src/features/auth/register/register_controller.dart';

import '../auth_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
   RegisterScreen({super.key});

   final AuthController authController = Get.put(AuthController());
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   final TextEditingController nameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: margin_10),
          children: [
            CustomDivider(
              height: height_100,
            ),
             CustomTextField(
                controller: nameController,
                labelText: 'Name',
                prefixIcon: null,
                obscure: false,
                height: height_10,
                textInputType: TextInputType.text),
             CustomTextField(
                controller: emailController,
                labelText: 'Email',
                prefixIcon: null,
                obscure: false,
                height: height_10,
                textInputType: TextInputType.emailAddress,
               errorText: authController.emailError.value,
               onChanged: (value){
                  authController.email.value = value;
                  authController.validateEmail(value);
               },
             ),
             CustomTextField(
                controller: passwordController,
                labelText: 'Password',
                prefixIcon: null,
                obscure: true,
                lines: 1,
                height: height_10,
                textInputType: TextInputType.text,
               errorText: authController.passwordError.value,
               onChanged: (value){
                  authController.password.value=value;
                  authController.validatePassword(value);
               },
             ),
             CustomTextField(
                controller: confirmPasswordController,
                labelText: 'Confirm Password',
                prefixIcon: null,
                obscure: true,
                lines: 1,
                height: height_50,
                textInputType: TextInputType.text),
            CustomButton(
              text: 'Sign Up',
              color: AppColors.white,
              fontWeight: fontWeight600,
              font: font_15,
              onPress: (){
               authController.register(nameController.text, emailController.text, passwordController.text, confirmPasswordController.text,);
               if (authController.isFormValid) {

                 print('Registration Successful');
               } else {
               }
               },
            )
          ],
        ),
      ),
    );
  }
}
