import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:validators/validators.dart';

import '../features/dashboard/home_screen.dart';
import 'login/login_screen.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  final RxString email = ''.obs;
  final RxString password = ''.obs;

  final RxString emailError = RxString('');
  final RxString passwordError = RxString('');


  void validateEmail(String? value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value!)) {
      emailError.value = '';
    } else {
      emailError.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.length < 8) {
      passwordError.value = '';
    } else {
      passwordError.value = '';
    }
  }

  bool get isFormValid => emailError.value.isEmpty && passwordError.value.isEmpty;


  RxMap<String, dynamic> loggedInUser = RxMap<String, dynamic>();

  Future<dynamic> register(String name, String email, String password, String confirmPassword) async {


    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!isEmail(email)) {
      Get.snackbar('Error', 'Enter a valid email address',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (password.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters long',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }


    if (storage.hasData(email)) {
      Get.snackbar('Error', 'User with this email already exists');
      return;
    }

    storage.write(email, {'name': name, 'email': email, 'password': password});
    Get.toNamed('/login');
    Get.snackbar('Success', 'Registration successful');

  }

  Future<void> login(String email, String password) async {
    if (!storage.hasData(email)) {
      Get.snackbar('Error', 'User with this email does not exist');
      return;
    }

    final userData = storage.read(email);
    if (userData['password'] == password) {
      loggedInUser?.value = userData;
      Get.snackbar('Success', 'Login successful');
      Get.offAll(HomeScreen());
    } else {
      Get.snackbar('Error', 'Incorrect password');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }


  void logout() {
    loggedInUser.value = RxMap<String, dynamic>();
    Get.offAll(LoginScreen());
    Get.snackbar('Success', 'Logout successful');
  }
}
