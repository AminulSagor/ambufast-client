import 'package:ambufast/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/bottom_sheet_helper.dart';
import '../custom_button.dart';

class SetLocationModal extends StatelessWidget {
  final String headerText;
  final String? subHeaderText;
  final String address;
  final String buttonText;
  final VoidCallback onTap;
  const SetLocationModal({
    super.key,
    required this.headerText,
    required this.buttonText,
    required this.address,
    required this.onTap,
    this.subHeaderText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.h.verticalSpace,
        bottomSheetHeader(headerText, subTitle: subHeaderText),
        SizedBox(height: 24.h),
        Container(
          height: 55.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: neutral100,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: <Widget>[
              Image.asset('assets/ride_icons/confirm_location.png'),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  address.tr, //'jhiga_address'.tr,
                  style: TextStyle(fontSize: 16.sp, color: Colors.black54),
                ),
              ),
              Icon(Icons.search, color: Color(0xFF8C8F9A), size: 24.sp),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomButton(btnTxt: buttonText, onTap: onTap),
        ),
      ],
    );
  }
}
