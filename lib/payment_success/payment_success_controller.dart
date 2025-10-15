// lib/payment/payment_success_controller.dart
import 'package:ambufast/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PaymentSuccessController extends GetxController {
  late final int amount; // passed from previous page
  final paymentFor = 'default'.obs;

  @override
  void onInit() {
    final args = (Get.arguments as Map?) ?? const {};
    amount = (args['amount'] as int?) ?? 0;
    paymentFor.value = (args['paymentFor'] as String?) ?? 'default';
    super.onInit();
  }

  void goToActivity() {
    // TODO: navigate to your activity/history screen
    // e.g. Get.offAllNamed(Routes.activity);
    Get.back(); // placeholder
  }

  void backHome() {
    // TODO: navigate to home
    // e.g. Get.offAllNamed(Routes.home);
    Get.offAllNamed('/home'); // or Routes.home if defined
  }

  void onTrackTrip() {
    Get.offNamedUntil(
      Routes.tripTrack,
      (route) => route.settings.name == Routes.home,
    );
  }
}
