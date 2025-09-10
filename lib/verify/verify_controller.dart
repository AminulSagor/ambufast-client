// lib/modules/verify/verify_controller.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class VerifyController extends GetxController {
  /// true => email verification, false => phone verification
  final isEmail = true.obs;

  /// optional target (masked email/phone) for display if you want
  final destination = ''.obs;

  /// 6-digit OTP inputs
  final List<TextEditingController> otpCtrls =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> otpNodes =
  List.generate(6, (_) => FocusNode());

  /// timer (mm:ss)
  final _seconds = 2 * 60 + 46; // 02:46 to match your UI
  final secondsLeft = 0.obs;
  Timer? _timer;

  RxBool canResend = false.obs;

  @override
  void onInit() {
    // read args
    final args = Get.arguments as Map<dynamic, dynamic>?;

    // fallback: email = true if null
    isEmail.value = (args?['isEmail'] as bool?) ?? true;
    destination.value = (args?['destination'] as String?) ?? '';

    // start timer
    secondsLeft.value = _seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft.value <= 1) {
        t.cancel();
        canResend.value = true;
        secondsLeft.value = 0;
      } else {
        secondsLeft.value--;
      }
    });

    super.onInit();
  }

  String get timerText {
    final m = (secondsLeft.value ~/ 60).toString().padLeft(2, '0');
    final s = (secondsLeft.value % 60).toString().padLeft(2, '0');
    return 'timer_mm_ss'.trArgs([m, s]);
  }

  void onOtpChanged(int index, String value) {
    if (value.isNotEmpty && index < otpNodes.length - 1) {
      otpNodes[index + 1].requestFocus();
    }
  }

  void resendOtp() {
    if (!canResend.value) return;
    // TODO: trigger resend API according to isEmail.value
    canResend.value = false;
    secondsLeft.value = _seconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft.value <= 1) {
        t.cancel();
        canResend.value = true;
        secondsLeft.value = 0;
      } else {
        secondsLeft.value--;
      }
    });
    Get.snackbar('OTP', 'OTP re-sent');
  }

  void changeDestination() {
    // Navigate back to Recover to pick phone/email again
    Get.back();
  }

  void verify() {
    // Get.offAllNamed(Routes.setPassword);
    Get.toNamed(Routes.createAccount);

  }

  void goBack() => Get.back();

  @override
  void onClose() {
    for (final c in otpCtrls) c.dispose();
    for (final n in otpNodes) n.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
