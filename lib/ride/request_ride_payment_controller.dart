import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestRidePaymentController extends GetxController {
  late final TextEditingController couponController;

  var isCouponApplied = false.obs;
  var appliedCouponCode = ''.obs;
  var discountAmount = '20'.obs;

  @override
  void onInit() {
    super.onInit();
    couponController = TextEditingController();
  }

  void applyCoupon() {
    if (couponController.text.isNotEmpty) {
      // Set the state
      appliedCouponCode.value = couponController.text.toUpperCase();
      isCouponApplied.value = true;
      couponController.clear(); // Clear the input field
      Get.focusScope?.unfocus(); // Hide the keyboard
    } else {
      Get.snackbar('Error', 'Please enter a coupon code');
    }
  }

  void removeCoupon() {
    // Reset the state
    isCouponApplied.value = false;
    appliedCouponCode.value = '';
  }

  void processPayment() {
    Get.back(); // Close the screen
    Get.snackbar('Processing', 'Payment is being processed...');
  }

  @override
  void onClose() {
    couponController.dispose();
    super.onClose();
  }
}
