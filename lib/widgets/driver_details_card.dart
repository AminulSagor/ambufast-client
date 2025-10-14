import 'package:ambufast/model/driver_info.dart';
import 'package:ambufast/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../ride/request_ride_controller.dart';

class DriverDetailsCard extends GetView<RequestRideController> {
  final bool showTimer;
  final bool showCallBtn;
  final DriverInfo driverInfo;
  final VoidCallback? onCall;
  const DriverDetailsCard({
    super.key,
    this.showTimer = false,
    this.showCallBtn = false,
    required this.driverInfo,
    this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Driver Image/Avatar
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: Container(
            width: 58.w,
            height: 58.h,
            color: Colors.grey[300],
            child: Image.asset('assets/ride_images/rider_image.jpg'),
          ),
        ),
        SizedBox(width: 15.w),

        // Name and Vehicle Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                driverInfo.name,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    driverInfo.rating.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Icon(Icons.star, color: Colors.orange, size: 18.w),
                  SizedBox(width: 2.w),
                  Text(
                    '(${driverInfo.ratingCount.toStringAsFixed(1)} ratings)',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                driverInfo.vehicleDetails,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // Timer Badge
        if (showTimer)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF04F34).withOpacity(0.1),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Text(
              '04:09', // Timer text
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        if (showCallBtn)
          InkWell(
            onTap: onCall,
            child: Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: onCall == null ? neutralBase : posititveBase,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Image.asset(
                'assets/trip/phone-call.png',
                fit: BoxFit.cover,
                height: 14.w,
              ),
            ),
          ),
      ],
    );
  }
}
