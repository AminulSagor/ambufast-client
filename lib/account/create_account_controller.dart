// lib/modules/account/create_account_controller.dart
import 'package:ambufast/account/profile_creating_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountController extends GetxController {
  // ===== Form =====
  final formKey = GlobalKey<FormState>();

  // Text fields
  final fullNameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmCtrl  = TextEditingController();

  // Reactive fields
  final dob        = Rxn<DateTime>();   // nullable Rx for date
  final gender     = ''.obs;            // 'male' | 'female' | 'others'
  final bloodGroup = ''.obs;            // 'A+', 'O-', ...

  // UI state
  final obscurePass    = true.obs;
  final obscureConfirm = true.obs;

  // 🔁 Reactive overall validity the UI can watch with Obx
  final canSubmit = false.obs;

  // -------- Lifecycle --------
  @override
  void onInit() {
    super.onInit();
    // Recompute validity whenever user types
    fullNameCtrl.addListener(_recompute);
    passwordCtrl.addListener(_recompute);
    confirmCtrl.addListener(_recompute);
  }

  @override
  void onClose() {
    fullNameCtrl.dispose();
    passwordCtrl.dispose();
    confirmCtrl.dispose();
    super.onClose();
  }

  // ===== Derived validity (optional: still handy elsewhere) =====
  bool get isFormValid =>
      fullNameCtrl.text.trim().isNotEmpty &&
          dob.value != null &&
          gender.value.isNotEmpty &&
          bloodGroup.value.isNotEmpty &&
          passwordCtrl.text.isNotEmpty &&
          confirmCtrl.text.isNotEmpty &&
          passwordCtrl.text == confirmCtrl.text &&
          passwordCtrl.text.length >= 6;

  // Recompute reactive validity
  void _recompute() {
    // Run validators for text fields (if any)
    final fieldsOk = formKey.currentState?.validate() ?? false;

    // Non-text checks
    final extraOk = dob.value != null &&
        gender.value.isNotEmpty &&
        bloodGroup.value.isNotEmpty;

    canSubmit.value = fieldsOk && extraOk;
  }

  // ===== Actions =====
  Future<void> pickDob(BuildContext context) async {
    final now = DateTime.now();
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900, 1, 1),
      lastDate: now,
    );
    if (selected != null) {
      dob.value = selected;
      _recompute();
    }
  }

  void chooseGender(String value) {
    gender.value = value;
    _recompute();
  }

  Future<void> chooseBloodGroup(BuildContext context) async {
    final List<String> items = [
      'A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-',
    ];

    final selected = await showModalBottomSheet<String>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 4.h),
              Container(
                width: 40.w, height: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFCDD2D6),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(height: 12.h),
              Text('choose'.tr,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
              SizedBox(height: 8.h),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, i) {
                    final bg = items[i];
                    return RadioListTile<String>(
                      value: bg,
                      groupValue: bloodGroup.value,
                      onChanged: (v) => Get.back(result: v),
                      title: Text(bg, style: TextStyle(fontSize: 16.sp)),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    );
                  },
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: double.infinity, height: 48.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF43023),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () => Get.back(
                    result: bloodGroup.value.isNotEmpty ? bloodGroup.value : null,
                  ),
                  child: Text(
                    'done'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (selected != null && selected.isNotEmpty) {
      bloodGroup.value = selected;
      _recompute();
    }
  }

  /// Called by the "Next" button
  void onNext(BuildContext context) {
    // Ensure form validators run before checking
    final ok = formKey.currentState?.validate() ?? false;

    if (!ok || !isFormValid) {
      Get.snackbar(
        'invalid_title'.tr,
        'invalid_msg'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black.withOpacity(.75),
        colorText: Colors.white,
      );
      return;
    }

    _showTermsSheet(context);
  }

  void _showTermsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 4.h),
              Container(
                width: 40.w, height: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF535353),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(height: 20.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(text: 'terms_pre_a'.tr),
                    TextSpan(
                      text: 'terms_pre_b'.tr,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 18.h),
              SizedBox(
                width: double.infinity, height: 52.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF43023),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {
                    Get.back(); // close sheet
                    // TODO: navigate to next step / call API
                    // Get.toNamed(Routes.nextStep);
                    Get.to(() => const ProfileCreatingView());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'agree_continue'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      const Icon(Icons.arrow_forward_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
