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
  String? subTitle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        title.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1C2130),
        ),
      ),
      if (subTitle != null)
        Text(
          subTitle.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFF1C2130),
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
