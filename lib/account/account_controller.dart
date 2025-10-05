// lib/modules/account/account_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../storage/token_storage.dart';

class AccountController extends GetxController {
  final userName = 'Md Kamrul Hasan'.obs;
  final phone = '+8801790260630'.obs;
  final avatarUrl = ''.obs; // supply if you fetch from API
  final rating = 5.0.obs;
  // in AccountController
  final RxInt unreadCount = 1.obs; // set from API; >0 shows the dot


  /// Navigate to a named route when tapping an item in the account page
  void onItemTap(String routeName) {
    if (routeName.isEmpty) return;
    Get.toNamed(routeName);
  }

  /// New: handle notification bell tap
  void onTapNotifications() {
    // Replace '/notifications' with the actual route in your AppPages
    Get.toNamed('/notifications');
  }

  /// Clear user session and go back to home/login etc.

  Future<void> logout() async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      await TokenStorage.clearTokens();
      // await TokenStorage.clearCredentials(); // if you also want to forget saved login

      // Clear all registered deps but KEEP navigator
      Get.deleteAll(force: true);
    } finally {
      if (Get.isDialogOpen == true) Get.back();
    }

    // Navigate after cleanup
    Get.offAllNamed(Routes.login);
  }
}
