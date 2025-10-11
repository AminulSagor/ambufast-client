import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../ride/request_ride_controller.dart';
import '../../utils/bottom_sheet_helper.dart';

class LowestFareWidget extends GetView<RequestRideController> {
  const LowestFareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sheetHeightFactor = 0.9;
    final screenHeight = Get.height;
    final sheetHeight = screenHeight * sheetHeightFactor;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      constraints: BoxConstraints(maxHeight: sheetHeight),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          // Header
          Column(
            children: [
              Text(
                'lowest_fare'.tr,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16.h),
              gradientDivider(),
            ],
          ),
          SizedBox(height: 20.h),

          // Vehicle List
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = controller.vehicles[index];
                return Obx(
                  () => _buildVehicleTile(
                    controller: controller,
                    vehicle: vehicle,
                    index: index,
                    isSelected: controller.selectedVehicleIndex.value == index,
                  ),
                );
              },
            ),
          ),

          // Done Button
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: ElevatedButton(
              onPressed: controller.confirmSelection,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF43023),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              child: Text(
                'done'.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 35.h),
        ],
      ),
    );
  }
}

Widget _buildVehicleTile({
  required RequestRideController controller,
  required Vehicle vehicle,
  required int index,
  required bool isSelected,
}) {
  final bdtSymbol = Get.locale?.languageCode == 'bn' ? '৳' : '৳';
  return GestureDetector(
    onTap: () => controller.selectVehicle(index),
    child: Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFFEE8E7) : Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: isSelected ? Colors.red : Colors.transparent,
          width: isSelected ? 1 : 0,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            vehicle.iconPath,
            width: 32.w,
            fit: BoxFit.cover,
            color: isSelected ? Color(0xFFF43023) : Color(0xFF666A79),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$bdtSymbol ${vehicle.price}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  '${vehicle.distance} | ${vehicle.time}',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Color(0xFF959595),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  vehicle.nameKey.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xFF959595),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Radio<int>(
            value: index,
            groupValue: controller.selectedVehicleIndex.value,
            onChanged: (value) => controller.selectVehicle(value!),
            activeColor: Colors.red,
          ),
        ],
      ),
    ),
  );
}
