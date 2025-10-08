import 'package:ambufast/ride/request_ride_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'choose_date_time_controller.dart';

final _txtColor = Color(0xFF404557);
final _colorNeutral50 = Color(0xFFF7F8F8);
final _colorNeutral100 = Color(0xFFE6E6E9);
final _colorPrimaryBase = Color(0xFFF43023);

class ChooseDateTimeView extends GetView<ChooseDateTimeController> {
  const ChooseDateTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize date formatting for the current locale
    initializeDateFormatting(Get.locale?.toString());
    final currentLocale = Get.locale?.toString() ?? 'en_US';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'choose_date_time'.tr,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: _txtColor,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info, color: _txtColor),
          ),
          SizedBox(width: 31.w),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Obx(
                () => Column(
                  children: [
                    _buildEstimatedTimeCard(
                      controller.getFormattedFullDateTime(currentLocale),
                    ),
                    SizedBox(height: 16.h),
                    _buildPickerButton(
                      text: controller.getFormattedTime(currentLocale),
                      onTap: controller.showTimePicker,
                    ),
                    SizedBox(height: 16.h),
                    _buildPickerButton(
                      text: controller.getFormattedDate(currentLocale),
                      onTap: controller.showDatePicker,
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildEstimatedTimeCard(String dateTimeString) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Color(0xFFE6F0FF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Text(
            'estimated_pickup'.tr,
            style: TextStyle(
              fontSize: 14.sp,
              color: _txtColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            dateTimeString,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: _txtColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickerButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: _colorNeutral100,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
      decoration: BoxDecoration(
        color: _colorNeutral50,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'time_disclaimer'.tr,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: ElevatedButton(
              onPressed: () => controller.goToNextPage(
                controller: Get.find<RequestRideController>(),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _colorPrimaryBase,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'next'.tr,
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
}
