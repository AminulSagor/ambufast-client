import 'package:ambufast/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'intercity_detail_controller.dart';
import 'vehicle_service_title.dart';

//colors used
const _neutral50 = Color(0xFFF7F8F8);
const _neutral100 = Color(0xFFE6E6E9);
const _neutral700 = Color(0xFF404557);
const _secondary50 = Color(0xFFE6F0FF);

class IntercityDetailView extends GetView<IntercityDetailController> {
  const IntercityDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Get.locale?.toLanguageTag() ?? 'en_US';
    final dateFmt = DateFormat('EEE, MMM dd, yy | hh:mm a', locale);

    Widget blueCard(Widget child) => Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: _secondary50,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: child,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: _neutral100,
              borderRadius: BorderRadius.circular(100.sp),
            ),
            child: const Icon(Icons.close_rounded, size: 25),
          ),
          onPressed: () => Get.back<void>(),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          color: Colors.white,
          child: ListView(
            children: [
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: _neutral50,
                ),
                child: Column(
                  children: [
                    // Estimated pickup
                    blueCard(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'estimated_pickup'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: _neutral700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            dateFmt.format(controller.offer.departure),
                            style: TextStyle(
                              color: _neutral700,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),

                    // Route
                    blueCard(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 18),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  controller.offer.from,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              const Icon(Icons.flag_outlined, size: 18),
                              SizedBox(width: 6.w),
                              Expanded(
                                child: Text(
                                  controller.offer.to,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Vehicle services
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...controller.services.map(
                      (s) => Column(
                        children: [
                          VehicleServiceTile(
                            iconPath: 'assets/ride_icons/ambulance.png',
                            service: s,
                            selected: controller.isSelected(s.id),
                            selectedOptionIds: controller.selectedFor(s.id),
                            onSelect: () => controller.onSelectService(s.id),
                            onToggleOption: (optId, val) =>
                                controller.toggleAddon(s.id, optId, val),
                          ),
                          10.h.verticalSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              24.h.verticalSpace,
              // Booking requirements
              Text(
                'booking_requirement'.tr,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: _neutral700,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.h),
              _bullet(
                'only_from_to_applicable'.trParams({
                  'from': controller.offer.from,
                  'to': controller.offer.to,
                }),
              ),
              _bullet('driver_time'.tr),
              SizedBox(height: 20.h),

              // Book button
              SafeArea(
                top: false,
                child: CustomButton(
                  btnTxt: 'book_now',
                  onTap: controller.onBookNow,
                ),
              ),
              SizedBox(height: 14.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 3.w,
            height: 3.w,
            decoration: const BoxDecoration(
              color: _neutral700,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 12.sp)),
          ),
        ],
      ),
    );
  }
}
