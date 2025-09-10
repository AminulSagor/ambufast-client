// lib/modules/set_password/set_password_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SetPasswordController extends GetxController {
  final pwCtrl = TextEditingController();
  final cpwCtrl = TextEditingController();

  final obscurePw = true.obs;
  final obscureCpw = true.obs;

  void togglePw() => obscurePw.value = !obscurePw.value;
  void toggleCpw() => obscureCpw.value = !obscureCpw.value;

  void submit() {
    final p = pwCtrl.text.trim();
    final c = cpwCtrl.text.trim();

    if (p.length < 8) {
      Get.snackbar('Error', 'pw_too_short'.tr,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (p != c) {
      Get.snackbar('Error', 'pw_mismatch'.tr,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // TODO: call your API to set password
    Get.snackbar('Success', 'pw_updated'.tr,
        snackPosition: SnackPosition.BOTTOM);

    // e.g. navigate to Login
    // Get.offAllNamed(Routes.login);
  }

  void goBack() => Get.back();

  @override
  void onClose() {
    pwCtrl.dispose();
    cpwCtrl.dispose();
    super.onClose();
  }
}
