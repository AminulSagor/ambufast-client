// lib/modules/account/account_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../legal/legal_policy_controller.dart';
import '../routes/app_routes.dart';
import '../storage/token_storage.dart';
import '../widgets/delete_account_sheet.dart';

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

  void onTapItem(String key) {
    // Centralized navigation/events
    print(key);
    switch (key) {
      case 'profile':
        Get.toNamed(Routes.profileDetails);
        break;
      case 'reviews':
        Get.toNamed(Routes.allReview);
        break;
      case 'my_booking':
        Get.snackbar('Open', 'My Booking');
        break;
      case 'my_donation_request':
        Get.snackbar('Open', 'my_donation_request');
        break;
      case 'save_address':
        Get.snackbar('Open', 'save_address');
        break;
      case 'language':
        Get.snackbar('Open', 'Language');
        break;
      case 'notification':
        Get.toNamed(Routes.notification);
        break;
      case 'delete_account':
        _openDeleteAccountSheet();
        break;
      case 'change_password':
        Get.toNamed(Routes.changePassword);
        break;
      case 'tap_sos':
        Get.toNamed(Routes.emergencySos);
        break;
      case 'help_center':
        Get.toNamed(Routes.helpCenter);

      case 'contact_support':
        Get.toNamed(Routes.contactSupport);
      case 'terms_conditions':
        _openPolicy(PolicyType.terms);
        break;
      case 'privacy_policy':
        _openPolicy(PolicyType.privacy);
        break;
      case 'cancellation_policy':
        _openPolicy(PolicyType.cancellation);
        break;
      case 'refund_policy': // ✅ newly added
        _openPolicy(PolicyType.refund);
        break;

      default:
        break;
    }
  }

  void _openPolicy(PolicyType type) {
    Get.toNamed(Routes.legalPolicy, arguments: {'type': type.name});
  }

  /// New: handle notification bell tap
  void onTapNotifications() {
    // Replace '/notifications' with the actual route in your AppPages
    Get.toNamed('/notifications');
  }

  void _openDeleteAccountSheet() {
    Get.bottomSheet(
      DeleteAccountSheet(
        onNo: () => Get.back(), // just close
        onYes: () {
          Get.back(); // close sheet
          Get.toNamed(Routes.deleteAccount);
        },
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.35),
    );
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
