import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  final bool showHandle;
  final Widget child;
  const CustomBottomSheet({
    super.key,
    required this.child,
    this.showHandle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: SingleChildScrollView(
        // Padding for the content inside the scroll view
        // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            if (showHandle) ...[
              Container(
                width: 48.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFD1D5DB),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 15.h),
            ],
            child,
          ],
        ),
      ),
    );
  }
}
