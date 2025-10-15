import 'package:ambufast/utils/bottom_sheet_helper.dart';
import 'package:ambufast/utils/colors.dart';
import 'package:ambufast/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AffiliationTypeSheet extends StatelessWidget {
  final String current;
  final List<String> options;
  const AffiliationTypeSheet({
    super.key,
    required this.current,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    final selected = RxString(current);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 16.h),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'choose'.tr,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 18.h),
              divider(),

              SizedBox(height: 24.h),
              ...options.map(
                (label) => Obx(() {
                  final isSel = selected.value == label;
                  return InkWell(
                    onTap: () => selected.value = label,
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon/cib-when-i-work.png',
                            width: 20.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Text(
                              _affText(label).tr,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: blackFrontS,
                              ),
                            ),
                          ),
                          Icon(
                            isSel
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: isSel
                                ? const Color(0xFFE53935)
                                : const Color(0xFF9CA3AF),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 24.h),
              CustomButton(
                btnTxt: 'done'.tr,
                onTap: () => Get.back(result: selected.value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // map raw labels to translation keys (so you can localize freely)
  String _affText(String raw) {
    switch (raw) {
      case 'Hospital':
        return 'aff_hospital';
      case 'Pharmacy':
        return 'aff_pharmacy';
      case 'NGO/Clinic':
        return 'aff_ngo_clinic';
      case 'Community Health Volunteer':
        return 'aff_chv';
      case 'Other (specify manually)':
        return 'aff_other';
      default:
        return raw; // fallback
    }
  }
}
