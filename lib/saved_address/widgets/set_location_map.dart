import 'package:ambufast/saved_address/widgets/custom_bottom_sheet.dart';
import 'package:ambufast/widgets/modal_sheet_widgets/set_location_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetLocationMap extends StatelessWidget {
  const SetLocationMap({super.key});

  @override
  Widget build(BuildContext context) {
    final onLocaitonSet = Get.arguments ?? () {} as VoidCallback;
    return Scaffold(
      body: Stack(
        children: [
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
          Positioned(
            top: 338.h,
            right: 162.w,
            child: Image.asset(
              'assets/ride_icons/location_pin.png',
              fit: BoxFit.cover,
              width: 28.w,
            ),
          ),
          // Placeholder for the navigation arrows/header on the map
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
          // 2. The Fixed "Modal Sheet" positioned at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // constraints: BoxConstraints(maxHeight: Get.height * 0.5),
              padding: EdgeInsets.only(bottom: 20.h),
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
              child: SafeArea(
                top: false,
                child: CustomBottomSheet(
                  showHandle: false,
                  child: SetLocationModal(
                    headerText: 'set_your_destionation',
                    subHeaderText: 'drag_map_move',
                    buttonText: 'confirm_destionation',
                    address: 'jhiga_address',
                    onTap: onLocaitonSet,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
