import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ContactInputType { phone, email }

class NewContactController extends GetxController {
  // tabs
  final inputType = ContactInputType.phone.obs;

  // form state
  final countryCode = '+880'.obs;
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final fullNameCtrl = TextEditingController();
  final dob = Rxn<DateTime>();
  final gender = ''.obs; // 'male' | 'female' | 'others'
  final bloodGroup = RxnString(); // e.g. 'A+', 'O-' etc.

  final bloodGroups = const <String>[
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  // simple validation (extend as needed)
  bool get isValid {
    final hasName = fullNameCtrl.text.trim().isNotEmpty;
    final hasDob = dob.value != null;
    final hasGender = gender.value.isNotEmpty;
    final hasBlood = bloodGroup.value != null;

    if (inputType.value == ContactInputType.phone) {
      return hasName &&
          hasDob &&
          hasGender &&
          hasBlood &&
          phoneCtrl.text.trim().length >= 6;
    } else {
      final email = emailCtrl.text.trim();
      final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
      return hasName && hasDob && hasGender && hasBlood && ok;
    }
  }

  Future<void> pickDob() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(1930),
      lastDate: DateTime(now.year, now.month, now.day),
      initialDate: dob.value ?? DateTime(now.year - 25, now.month, now.day),
    );
    if (picked != null) dob.value = picked;
  }

  void submit() {
    if (!isValid) {
      Get.snackbar('Error', 'Please complete all required fields.');
      return;
    }
    // Persist or pass data upward as needed
    Get.back(); // mock close
    Get.snackbar('Success', 'Contact saved (mock).');
  }

  @override
  void onClose() {
    phoneCtrl.dispose();
    emailCtrl.dispose();
    fullNameCtrl.dispose();
    super.onClose();
  }
}
