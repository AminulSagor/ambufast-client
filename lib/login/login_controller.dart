// lib/modules/login/login_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final tabIndex = 0.obs; // 0 = phone, 1 = email

  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscurePassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void changeTab(int index) {
    tabIndex.value = index;
  }

  void login() {
    // TODO: implement your API call
    Get.snackbar("Login", "Login pressed!");
  }

  void goToRecover() {
    Get.toNamed('/recover');
  }

  void goToRegister() {
    Get.toNamed('/register');
  }

  void goBack() {
    Get.back();
  }
}
