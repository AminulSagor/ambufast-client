import 'package:ambufast/ride/bottom_sheets/booking_details_modal.dart';
import 'package:ambufast/widgets/custom_button.dart';
import 'package:ambufast/ride/bottom_sheets/driver_loading_shimmer.dart';
import 'package:ambufast/ride/bottom_sheets/short_info_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/bottom_sheet_helper.dart';
import '../widgets/driver_details.dart';
import 'bottom_sheets/set_location_modal.dart';
import 'request_ride_controller.dart';

class RequestRideBookView extends GetView<RequestRideController> {
  const RequestRideBookView({super.key});

  @override
  Widget build(BuildContext context) {
    final sheetHeightFactor = 0.8;
    final screenHeight = MediaQuery.of(context).size.height;
    final sheetHeight = screenHeight * sheetHeightFactor;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // 1. Background Content (e.g., Map View)
          // The map image is visible in the background, filling the entire screen.
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
          Obx(() {
            if (controller.fixedModalIndex.value != 3) {
              return _locationWithVehicleView();
            }
            if (controller.fixedModalIndex.value == 3) {
              return _foundDriverView();
            }
            return SizedBox();
          }),
          // Placeholder for the navigation arrows/header on the map
          Positioned(
            top: 60.h,
            left: 25.w,
            child: _navigationBack(controller: controller),
          ),
          // 2. The Fixed "Modal Sheet" positioned at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: controller.isNow.value
                  ? BoxConstraints(maxHeight: sheetHeight)
                  : null,
              padding: EdgeInsets.only(bottom: 40.h),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: _fixedBottomSheet(controller: controller),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _navigationBack({required RequestRideController controller}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
      ],
    ),
    child: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        controller.fixedModalIndex.value = 0;
        Get.back();
      },
    ),
  );
}

Widget _locationWithVehicleView() {
  return Stack(
    children: [
      Positioned(
        top: 238.h,
        right: 191.w,
        child: Image.asset(
          'assets/ride_icons/location_pin.png',
          fit: BoxFit.cover,
          width: 28.w,
        ),
      ),
      Positioned(
        top: 109.h,
        right: 222.w,
        child: Transform.rotate(
          angle: -110,
          child: Image.asset(
            'assets/ride_icons/available_vehicle_icon.png',
            fit: BoxFit.cover,
            width: 27.w,
          ),
        ),
      ),
      Positioned(
        top: 308.h,
        right: 231.w,
        child: Transform.rotate(
          angle: 6,
          child: Image.asset(
            'assets/ride_icons/available_vehicle_icon.png',
            fit: BoxFit.cover,
            width: 27.w,
          ),
        ),
      ),
      Positioned(
        top: 164.h,
        right: 73.w,
        child: Transform.rotate(
          angle: -37,
          child: Image.asset(
            'assets/ride_icons/available_vehicle_icon.png',
            fit: BoxFit.cover,
            width: 27.w,
          ),
        ),
      ),
      Positioned(
        top: 379.h,
        right: 100.w,
        child: Transform.rotate(
          angle: 0.2,
          child: Image.asset(
            'assets/ride_icons/available_vehicle_icon.png',
            fit: BoxFit.cover,
            width: 27.w,
          ),
        ),
      ),
    ],
  );
}

Widget _foundDriverView() {
  return Stack(
    children: [
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
        top: 116.h,
        right: 47.w,
        child: Image.asset(
          'assets/ride_icons/destination_pin.png',
          fit: BoxFit.cover,
          width: 28.w,
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
    ],
  );
}

// A helper widget for the detail rows

Widget _fixedBottomSheet({required RequestRideController controller}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Drag handle (for aesthetic)
        if (controller.isNow.value)
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 8.h),
              width: 40.w, // Responsive width
              height: 5.h, // Responsive height
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5.r), // Responsive radius
              ),
            ),
          ),
        SizedBox(height: 20.h),
        Obx(() {
          final index = controller.fixedModalIndex.value;
          if (index == 0) {
            return BookingDetailsModal();
          }
          if (index == 1) {
            if (controller.isManualDestination.value) {
              return SetLocationModal(
                headerText: 'set_your_destionation',
                subHeaderText: 'drag_map_move',
                address: 'jhiga_address',
                buttonText: 'confirm_destionation',
                onTap: controller.onSetDestination,
              );
            }
            return SetLocationModal(
              headerText: 'confirm_pickup_location',
              address: 'jhiga_address',
              buttonText: 'confirm_pickup_location',
              onTap: controller.onConfirmLocation,
            );
          }
          if (index == 2) {
            Future.delayed(const Duration(seconds: 3), () {
              controller.fixedModalIndex.value = 3;
            });
            return DriverLoadingShimmer(headTitle: 'finding_drivers_header');
          }
          if (index == 3) {
            return _confirmDriverModal(controller: controller);
          }
          return SizedBox();
        }),

        // ..._bookingDetailsModal(),
      ],
    ),
  );
}

Widget _confirmDriverModal({required RequestRideController controller}) {
  return Column(
    children: [
      bottomSheetHeader('confirm_driver_header'),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1, color: Color(0xFFE6E6E9)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x1F3E3445),
              offset: Offset(0, 28),
              blurRadius: 48,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            DriverDetails(),
            _buildGallery(),
            SizedBox(height: 10.h),
            divider(),
            _buildArrivalDetails(),
            _buildActionButtons(controller),
          ],
        ),
      ),
    ],
  );
}

// Helper for the image gallery row
Widget _buildGallery() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 4.w,
    children: [
      _imagePlaceholder('assets/ride_images/ambu_pic_1.jpg'),
      _imagePlaceholder('assets/ride_images/ambu_pic_2.jpg'),
      _imagePlaceholder('assets/ride_images/ambu_pic_1.jpg'),
    ],
  );
}

// Generic image placeholder container
Widget _imagePlaceholder(String path) {
  return Container(
    width: 98.33.w,
    height: 76.h,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8.r),
      image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
    ),
  );
}

// Helper for the arrival/distance/cost section
Widget _buildArrivalDetails() {
  return Column(
    children: [
      SizedBox(height: 10.h),
      IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Arrival Time
            Row(
              children: [
                Image.asset('assets/ride_icons/clock-f.png', height: 16.h),
                SizedBox(width: 8.w),
                Text(
                  'arrival_time'.tr,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 2.w),
                Text(
                  '2 ${'min'.tr}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            VerticalDivider(width: 1, color: Colors.grey),
            // Distance
            Row(
              children: [
                Image.asset(
                  'assets/ride_icons/map_marker_distance.png',
                  height: 16.h,
                ),
                SizedBox(width: 8.w),
                Text(
                  'distance'.tr,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  '35.56KM',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: 8.h),
      // Arrival Cost
      divider(),
      Padding(
        padding: EdgeInsets.only(top: 15.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'arrival_cost'.tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF295BFF),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                '-' * 100, // Fill with dots, adjust length as needed
                maxLines: 1,
                overflow: TextOverflow.clip, // Prevent dots from wrapping
                textAlign: TextAlign.center, // Center the dots
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF295BFF),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Row(
              children: [
                Text(
                  'BDT 00.00',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF295BFF),
                  ),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () {
                    _showInfoModalSheet();
                  },
                  child: const Icon(
                    Icons.info,
                    color: Color(0xFF295BFF),
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

// Helper for the action buttons row
Widget _buildActionButtons(RequestRideController controller) {
  return Row(
    children: [
      // Cancel Button
      Expanded(
        child: CustomButton(
          btnTxt: 'cancel',
          borderColor: Color(0xFFD4D5D9),
          btnColor: Color(0xFFF7F8F8),
          txtColor: Color(0xFF404557),
          onTap: controller.onCancelRide,
        ),
      ),
      SizedBox(width: 16.w),
      Expanded(
        child: CustomButton(
          btnTxt: 'payment',
          borderColor: Color(0xFFD4D5D9),
          btnColor: Color(0xFFF43023),
          txtColor: Colors.white,
          onTap: controller.onPayment,
        ),
      ),
    ],
  );
}

void _showInfoModalSheet() {
  Get.bottomSheet(
    _buildInfoModal(distance: 15, arrivalCost: 500.00),
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: false, // Don't take up the full screen height
    backgroundColor: Colors
        .transparent, // Crucial: Allows the container's margin/shadow to show
  );
}

Widget _buildInfoModal({
  required double arrivalCost,
  required double distance,
}) {
  // Determine currency symbol based on locale (Bangali often uses '৳' or 'টাকা')
  final String currency = Get.locale?.languageCode == 'bn' ? 'টাকা' : '৳';
  final String costFormatted = arrivalCost.toStringAsFixed(2);

  // Construct the localized message string with interpolated values
  final String message = 'info_ambulance_distance'.trParams({
    'distance': distance.toInt().toString(),
    'cost': '$currency $costFormatted',
  });

  return ShortInfoModal(message: message);
}
