import 'package:ambufast/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String btnTxt;
  final void Function()? onTap;
  final Color? btnColor;
  final Color? txtColor;
  final Color? borderColor;
  final Widget? leading;
  final Widget? trailing;
  const CustomButton({
    super.key,
    required this.btnTxt,
    required this.onTap,
    this.btnColor,
    this.txtColor,
    this.borderColor,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: btnColor ?? primaryBase,
        minimumSize: Size(double.infinity, 44.h), // Responsive height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(width: 1, color: borderColor ?? neutral100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) ...[leading!, 8.w.horizontalSpace],
          Text(
            btnTxt.tr,
            style: TextStyle(
              fontSize: 16.sp,
              color: txtColor ?? Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
          if (trailing != null) ...[8.w.horizontalSpace, trailing!],
        ],
      ), // Localized
    );
  }
}
