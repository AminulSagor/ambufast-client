// --- Helper to build the bottom sheet UI ---
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

const _neutral700 = Color(0xFF404557);
const _primaryBase = Color(0xFFF43023);

Widget buildPickerSheet({
  required String title,
  required Widget picker,
  required VoidCallback onDone,
}) {
  return Container(
    padding: EdgeInsets.only(bottom: Get.bottomBarHeight),
    constraints: BoxConstraints(maxHeight: Get.height * 0.6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: _neutral700,
            ),
          ),
        ),
        Divider(thickness: 2),
        SizedBox(height: 24.h),
        Flexible(child: picker),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          width: double.infinity,
          height: 44.h,
          child: ElevatedButton(
            onPressed: onDone,
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryBase,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'done'.tr,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
