import 'dart:math' as math;

import 'package:ambufast/utils/bottom_sheet_helper.dart';
import 'package:ambufast/utils/colors.dart';
import 'package:ambufast/widgets/custom_button.dart';
import 'package:ambufast/widgets/driver_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'trip_track_controller.dart';

class TripTrackView extends GetView<TripTrackController> {
  const TripTrackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: 8.h),
                Text('loading'.tr),
              ],
            ),
          );
        }

        final s = controller.state.value!;
        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.grey[200], // Placeholder for the map widget
                child: Center(
                  child: Image.asset(
                    'assets/ride_images/map_image.png', // Replace with a real map widget (e.g., google_maps_flutter)
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 125.5.h,
              right: 66.w,
              child: Image.asset(
                'assets/ride_images/direction_line.png',
                fit: BoxFit.cover,
                width: 245.w,
                height: 242.5.h,
              ),
            ),
            Positioned(
              top: 110.5.h,
              right: 66.w,
              child: Transform.rotate(
                angle: -90 * (math.pi / 180),
                child: Image.asset(
                  'assets/ride_icons/available_vehicle_icon.png',
                  fit: BoxFit.cover,
                  width: 27.w,
                ),
              ),
            ),
            Positioned(
              top: 354.h,
              right: 293.w,
              child: Image.asset(
                'assets/ride_icons/start_pin.png',
                fit: BoxFit.cover,
                width: 28.w,
              ),
            ),

            // --- Persistent, non-dismissible bottom sheet ---
            // DraggableScrollableSheet never dismisses; it expands/collapses only.
            _buildBottomSheet(),

            Positioned(
              left: 16.w,
              top: 220.h,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                elevation: 0,
                backgroundColor: primaryBase,
                foregroundColor: Colors.white,
                onPressed: controller.openEmergencySheet,
                child: const Icon(Icons.warning),
              ),
            ),

            // back button
            Positioned(
              top: 60.h,
              left: 25.w,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildBottomSheet() {
    final s = controller.state.value!;
    final isCompleted = controller.stage.value == TripStage.completed;
    final isInProgress = controller.stage.value == TripStage.inProgress;
    return DraggableScrollableSheet(
      initialChildSize: isCompleted ? 0.5 : 0.65,
      minChildSize: 0.1,
      maxChildSize: isCompleted ? 0.5 : 0.65,
      snap: true,
      expand: true,
      builder: (context, scrollCtrl) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: ListView(
            controller: scrollCtrl,
            padding: EdgeInsets.zero,
            children: [
              8.h.verticalSpace,
              // drag handle
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  width: 48.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: neutral700,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),

              // >>> Header with smooth stage transitions <<<
              const _HeaderAnimated(), // <-- NEW

              12.h.verticalSpace,
              divider(),

              // driver card
              Container(
                color: neutral50,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: DriverDetailsCard(
                  driverInfo: s.driver,
                  showCallBtn: true,
                  onCall: controller.onCallDriver,
                ),
              ),

              // pickup address (selected)
              Obx(() {
                return _addressTile(
                  title: 'pickup_address'.tr,
                  address: s.pickupAddress,
                  selected: controller.active.value == ActiveAddress.pickup,
                  selectedColor: negative50,
                  trailing: (isInProgress || isCompleted)
                      ? const Icon(
                          Icons.check_box_rounded,
                          color: posititveBase,
                        )
                      : null,
                );
              }),

              // drop address
              Obx(() {
                return _addressTile(
                  title: 'dropoff_address'.tr,
                  address: s.dropAddress,
                  selected: controller.active.value == ActiveAddress.drop,
                  selectedColor: negative50,
                  trailing: isCompleted
                      ? const Icon(
                          Icons.check_box_rounded,
                          color: Color(0xFF22C55E),
                        )
                      : (isInProgress
                            ? const Icon(
                                Icons.radio_button_checked,
                                color: Color(0xFFE11D48),
                              )
                            : null),
                );
              }),

              SizedBox(height: 8.h),

              Container(
                color: adminBg,
                padding: EdgeInsets.all(16.sp),
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      // Due row
                      Row(
                        children: [
                          Text(
                            'due'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: neutral700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          const Icon(Icons.info, size: 16, color: neutral700),
                          const Spacer(),
                          Text(
                            controller.formatCurrency(
                              s.dueAmount,
                              symbol: 'BDT ',
                            ),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: neutral700,
                            ),
                          ),
                        ],
                      ),
                      24.h.verticalSpace,

                      // actions
                      if (!isCompleted) ...[
                        CustomButton(
                          btnTxt: 'change_destination'.tr,
                          onTap: controller.onChangeDestinationInfo,
                          btnColor: posititve50,
                          txtColor: posititveBase,
                          borderColor: posititve300,
                        ),
                        12.h.verticalSpace,
                        CustomButton(
                          btnTxt: 'cancel_trip'.tr,
                          onTap: controller.onCancelTrip,
                          btnColor: negative50,
                          txtColor: negativeBase,
                          borderColor: neutral300,
                        ),
                      ],

                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _addressTile({
    required String title,
    required String address,
    required bool selected,
    required Color selectedColor,
    Widget? trailing, // NEW
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(color: selected ? selectedColor : Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: blackFrontS,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: neutral700,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          trailing ??
              Radio<bool>(
                value: true,
                groupValue: selected,
                onChanged: (_) {},
                activeColor: negativeBase,
              ),
        ],
      ),
    );
  }
}

// ---------------- Header section (isolated & animated) ----------------

class _HeaderAnimated extends GetView<TripTrackController> {
  const _HeaderAnimated();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TripTrackController>();
    return GetBuilder<TripTrackController>(
      id: 'header', // only this small part rebuilds on stage change
      builder: (_) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, anim) => FadeTransition(
            opacity: anim,
            child: SizeTransition(sizeFactor: anim, child: child),
            // child: child,
          ),
          child: () {
            final locale = Get.locale?.toLanguageTag() ?? 'en_US';
            final timeFmt = DateFormat('hh:mm a', locale);

            if (controller.stage.value == TripStage.approaching) {
              return _HeaderApproaching(
                key: const ValueKey('approaching'),
                etaBadge: Obx(
                  () => _EtaBadge(text: controller.remainingBadgeText),
                ),
              );
            } else if (controller.stage.value == TripStage.arrived) {
              return _HeaderOtherStages(
                key: ValueKey('arrived'),
                title: 'driver_arrived'.tr,
                subTitle: 'reach_pickup_in_5min'.tr,
              );
            } else if (controller.stage.value == TripStage.inProgress) {
              final locale = Get.locale?.toLanguageTag() ?? 'en_US';
              final timeFmt = DateFormat('hh:mm a', locale);
              final etaStr = controller.destinationEta.value != null
                  ? timeFmt.format(controller.destinationEta.value!)
                  : '--:--';
              return _HeaderOtherStages(
                key: const ValueKey('inprogress'),
                title: 'ride_in_progress'.tr,
                subTitle: 'reach_destination_by'.trParams({'time': etaStr}),
                titleColor: posititve700,
              );
            } else {
              // COMPLETED
              return _HeaderOtherStages(
                key: ValueKey('completed'),
                title: 'ride_complete'.tr,
                subTitle: 'reached_destination'.tr,
                titleColor: posititveBase,
              );
            }
          }(),
        );
      },
    );
  }
}

class _EtaBadge extends StatelessWidget {
  final String text;
  const _EtaBadge({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51.w,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: primaryBase,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _HeaderApproaching extends StatelessWidget {
  final Widget etaBadge;
  const _HeaderApproaching({super.key, required this.etaBadge});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'driver_arriving'.tr,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: blackFrontS,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'meet_driver_hint'.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: neutral700,
                  ),
                ),
              ],
            ),
          ),
          etaBadge,
        ],
      ),
    );
  }
}

class _HeaderOtherStages extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color? titleColor;
  const _HeaderOtherStages({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleColor,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title.tr, //'driver_arrived'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: titleColor ?? blackFrontS,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            subTitle.tr, //'reach_pickup_in_5min'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: neutral700,
            ),
          ),
        ],
      ),
    );
  }
}
