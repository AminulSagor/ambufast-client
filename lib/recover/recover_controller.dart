// lib/modules/recover/recover_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class RecoverController extends GetxController {
  final tabIndex = 0.obs; // 0 = phone, 1 = email

  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  void changeTab(int i) => tabIndex.value = i;

  void sendOtp() {
    Get.toNamed(
      Routes.verify,
      arguments: {
        'isEmail': true,             // or false for phone
        'destination': 'user@mail.com', // optional, if you want to display/obscure
      },
    );

  }

  void goBack() => Get.back();

  void goToLogin() => Get.offAllNamed(Routes.login);

  @override
  void onClose() {
    phoneController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
