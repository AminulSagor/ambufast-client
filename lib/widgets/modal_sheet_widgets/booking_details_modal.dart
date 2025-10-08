import 'package:ambufast/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../choose_date_time_controller.dart';
import '../request_ride_controller.dart';
import '../../utils/bottom_sheet_helper.dart';

class BookingDetailsModal extends GetView<RequestRideController> {
  const BookingDetailsModal({super.key});

  @override
  Widget build(BuildContext context) {
    var dateTimeValue = 'pickup_now';
    final isNow = controller.isNow.value;
    if (!isNow) {
      final dateTimeController = Get.find<ChooseDateTimeController>();
      dateTimeValue = dateTimeController.getFormattedFullDateTime(
        Get.locale?.toString() ?? Locale('en', 'US').toString(),
      );
    }
    return Column(
      children: [
        // Header
        bottomSheetHeader('booking_details'),

        // Details Rows (all labels/values are now localized keys)
        divider(),
        _buildDetailRow('date_time', dateTimeValue, controller: controller),
        divider(),
        _buildDetailRow('contact', 'for_me', controller: controller),
        divider(),
        _buildDetailRow('vehicle', 'ac_ambulance', controller: controller),
        divider(),
        _buildDetailRow('trip_type', 'single_trip', controller: controller),
        divider(),
        _buildDetailRow(
          'category',
          controller.isNow.value ? 'emergency' : 'Scheduled',
          isCat: true,
          controller: controller,
        ),

        divider(),
        _buildLocationDisplay(),

        // Lowest Fare Section
        Container(
          width: double.infinity,
          color: Color(0xFFFDD6D3).withAlpha(155),
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: GestureDetector(
            onTap: controller.onLowestFareClick,
            child: Text(
              'lowest_fare'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),

        // Ad Banner (Placeholder)
        GestureDetector(
          onTap: controller.onLowestFareClick,
          child: Image.asset(
            'assets/ride_images/lowest_fare.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        SizedBox(height: 16.h),

        // Total Fare
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'total'.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'without_toll_fee'.tr,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: Colors.amber.shade700,
                    ),
                  ), // Localized
                ],
              ),
              Text(
                'bdt_fare'.tr,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),

        // Payment Method
        divider(),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Image.asset('assets/ride_icons/money.png'),
              SizedBox(width: 5.w),
              Text(
                'cash'.tr,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey.shade700,
                size: 16,
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Next Button
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
          child: controller.isNow.value
              ? CustomButton(
                  btnTxt: 'request_send',
                  onTap: controller.onSendRequest,
                )
              : CustomButton(
                  btnTxt: 'confirm_trip',
                  onTap: controller.onConfirmTrip,
                ),
        ),
      ],
    );
  }
}

Widget _buildDetailRow(
  String labelKey,
  String valueKey, {
  required RequestRideController controller,
  bool isCat = false,
  Widget? trailingIcon,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          labelKey.tr,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                valueKey.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              if (trailingIcon != null) trailingIcon,
              if (trailingIcon == null && !isCat)
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey.shade700,
                      size: 14,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    ),
  );
}

// A helper widget for the location display
Widget _buildLocationDisplay() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 16.w),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color.fromARGB(255, 230, 230, 230)),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 'From' location
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'from'.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ), // Localized
                  SizedBox(height: 4.h),
                  Text(
                    'jhiga_address'.tr,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            // 'To' location
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'to'.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ), // Localized
                  SizedBox(height: 4.h),
                  Text(
                    'square_address'.tr,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        divider(),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'distance_est_time'.tr,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
            ), // Localized
            SizedBox(width: 8.w),
            Text(
              'distance_value'.tr,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ), // Localized
          ],
        ),
        SizedBox(height: 8.h),
      ],
    ),
  );
}
