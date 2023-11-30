import 'package:get/get.dart';
import 'package:payhub/src/core/database/user_model.dart';

import 'database_helper.dart';

class UserController extends GetxController{
  RxList<User> userList = <User>[].obs;

  Future<void> registerUser(String name, String email, String password, String confirmPassword) async {
    User user = User(name: name, email: email, password: password);
    await DatabaseHelper().insertUser(user);
  }

  Future<User?> loginUser(String email, String password) async {
    return await DatabaseHelper().getUserByEmail(email);
  }

}