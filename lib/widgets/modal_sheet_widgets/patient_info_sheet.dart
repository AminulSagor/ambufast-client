import 'package:ambufast/utils/bottom_sheet_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaitentInfo {
  final String name;
  final DateTime dob;
  final String phone;
  final String gender; // e.g. 'Male' / 'Female' / 'Others'
  final String bloodGroup; // e.g. 'B+'
  final String? avatarUrl; // optional

  const PaitentInfo({
    required this.name,
    required this.dob,
    required this.phone,
    required this.gender,
    required this.bloodGroup,
    this.avatarUrl,
  });
}

class PatientInfoSheet extends StatelessWidget {
  final PaitentInfo info;
  const PatientInfoSheet({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final locale = Get.locale?.toLanguageTag() ?? 'en_US';
    final dobText = DateFormat('MMM dd, yyyy', locale).format(info.dob);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            bottomSheetHeader('contact_information'.tr),

            // Avatar
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: const Color(0xFFEFEFEF),
                backgroundImage: info.avatarUrl != null
                    ? AssetImage(info.avatarUrl!)
                    : null,
                child: info.avatarUrl == null
                    ? Text(
                        info.name.isNotEmpty
                            ? info.name.trim().characters.first
                            : '👤',
                        style: TextStyle(fontSize: 20.sp),
                      )
                    : null,
              ),
            ),

            // Rows
            _row(label: 'name_label'.tr, value: info.name),
            _row(label: 'dob_label'.tr, value: dobText),
            _row(label: 'phone_label'.tr, value: info.phone),
            _row(label: 'gender_label'.tr, value: info.gender),
            _row(label: 'blood_group_label'.tr, value: info.bloodGroup),

            SizedBox(height: 14.h),

            // Close
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53935),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                onPressed: () => Get.back<void>(),
                child: Text(
                  'close'.tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row({required String label, required String value}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF2F4F7), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFF6B7280),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF111827),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
