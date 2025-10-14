import 'package:ambufast/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget divider() {
  return Divider(
    thickness: 1.h,
    color: const Color.fromARGB(255, 230, 230, 230),
    height: 1.h,
  );
}

Widget bottomSheetHeader(
  String title, {
  bool showGradientDivider = true,
  bool showDragHandle = true,
  String? subTitle,
  Color? titleColor,
  Color? subTitleColor,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      if (showDragHandle) ...[
        SizedBox(height: 8.h),
        // drag handle
        Container(
          width: 48.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: neutral100,
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
        SizedBox(height: 12.h),
      ],
      Text(
        title.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: titleColor ?? Color(0xFF1C2130),
        ),
      ),
      if (subTitle != null)
        Text(
          subTitle.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: subTitleColor ?? Color(0xFF1C2130),
          ),
        ),
      16.h.verticalSpace,
      if (showGradientDivider) gradientDivider(),
    ],
  );
}

Widget gradientDivider() {
  return Container(
    height: 2.h,
    margin: EdgeInsets.symmetric(horizontal: 30.w),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.white,
          Colors.red.shade600,
          Colors.white,
        ], // Define your gradient colors
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
    ),
  );
}
