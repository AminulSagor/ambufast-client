import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String btnTxt;
  final VoidCallback onTap;
  final Color? btnColor;
  final Color? txtColor;
  final Color? borderColor;
  const CustomButton({
    super.key,
    required this.btnTxt,
    required this.onTap,
    this.btnColor,
    this.txtColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: btnColor ?? Color(0xFFF43023),
        minimumSize: Size(double.infinity, 44.h), // Responsive height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(width: 1, color: borderColor ?? Color(0xFFF43023)),
        ),
      ),
      child: Text(
        btnTxt.tr,
        style: TextStyle(
          fontSize: 16.sp,
          color: txtColor ?? Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ), // Localized
    );
  }
}
