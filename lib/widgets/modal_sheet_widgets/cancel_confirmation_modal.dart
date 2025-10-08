import 'package:ambufast/widgets/custom_button.dart';
import 'package:ambufast/ride/request_ride_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CancelConfirmationModal extends GetView<RequestRideController> {
  const CancelConfirmationModal({super.key});

  @override
  Widget build(BuildContext context) {
    final sheetHeightFactor = 0.9;
    final screenHeight = Get.size.height;
    final sheetHeight = screenHeight * sheetHeightFactor;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      constraints: BoxConstraints(maxHeight: sheetHeight),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/ride_icons/cancel_ride.png', height: 48.h),
            SizedBox(height: 16.h),

            // Title
            Text(
              'confirm_cancel_title'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            SizedBox(height: 20.h),

            // Subheading
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'cancel_reason'.tr,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 12.h),

            // Checkbox List
            Obx(
              () => Column(
                spacing: 8.h,
                children: controller.reasonKeys
                    .map((key) => _buildCheckboxTile(controller, key))
                    .toList(),
              ),
            ),
            SizedBox(height: 16.h),

            // Policy Link
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'cancellation_policy_terms'.tr,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 28.h),

            // Buttons
            CustomButton(
              btnTxt: 'keep_searching',
              onTap: controller.keepSearching,
              btnColor: Color(0xFFF43023),
            ),
            SizedBox(height: 12.h),
            CustomButton(
              btnTxt: 'yes_cancel',
              onTap: controller.confirmCancellation,
              btnColor: Color(0xFFFDD2DB),
              txtColor: Color(0xFFF5355F),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCheckboxTile(RequestRideController controller, String key) {
  return InkWell(
    onTap: () => controller.toggleReason(key),
    child: Row(
      children: [
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: Transform.scale(
            scale: 0.7,
            child: Checkbox(
              value: controller.selectedReasons[key],
              onChanged: (value) => controller.toggleReason(key),
              activeColor: Colors.red,
            ),
          ),
        ),
        Text(
          key.tr,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
