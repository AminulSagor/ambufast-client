import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/bottom_sheet_helper.dart';
import 'custom_button.dart';

class DriverLoadingShimmer extends StatelessWidget {
  final String headTitle;
  const DriverLoadingShimmer({super.key, required this.headTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bottomSheetHeader(headTitle), //'finding_drivers_header'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder for Text Lines
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Text Line (Wider)
                    Container(
                      width: 148.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFE8E8E8),
                            Color(0xFFF3F3F3),
                            Color(0xFFE8E8E8),
                          ], // Define your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    12.h.verticalSpace,
                    // Second Text Line (Shorter)
                    Container(
                      width: 264.w, // Shorter width
                      height: 24.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFE8E8E8),
                            Color(0xFFF3F3F3),
                            Color(0xFFE8E8E8),
                          ], // Define your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 16.h), // Space before the next element
                    // Third Placeholder (Rectangular button/detail)
                  ],
                ),
              ),
              // Placeholder for Right Element (e.g., Car icon or Fare)
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(color: Colors.grey[200]),
              ),
            ],
          ),
        ),
        Container(
          width: 96.w,
          height: 48.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE8E8E8),
                Color(0xFFF3F3F3),
                Color(0xFFE8E8E8),
              ], // Define your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        SizedBox(height: 30.h), // Space before the button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomButton(
            onTap: () {
              // _showCancelConfirmBottomSheet();
            },
            btnTxt: 'cancel_request_button',
            btnColor: Color(0xFFFDD2DB),
            txtColor: Color(0xFFF5355F),
            borderColor: Color(0xFFF5355F),
          ),
        ),
      ],
    );
  }
}
