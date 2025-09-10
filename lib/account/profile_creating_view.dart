// lib/modules/account/profile_creating_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileCreatingView extends StatelessWidget {
  const ProfileCreatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // nice soft background (optional)
      body: SafeArea(
        child: Stack(
          children: [
            // --- subtle gradient bg (optional; remove if you have one already) ---
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFF9FCFF), Color(0xFFF7FAFB)],
                  ),
                ),
              ),
            ),

            // --- blob shape behind the phone (do NOT cover full screen) ---
            Positioned(
              top: 210.h,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 230.w,              // control size
                  child: Image.asset(
                    // update the path if your files live in assets/icon/
                    'assets/successful_profile_creation_mobile_back.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // --- phone illustration on top of the blob ---
            Positioned(
              top: 220.h,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/mobile.png',        // or 'assets/icon/mobile.png'
                  height: 220.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // --- texts below the illustration ---
            Column(
              children: [
                SizedBox(height: 480.h),      // pushes text under the phone
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'profile_creating'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                      color: const Color(0xFF2F3440),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'profile_customising'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Text(
                    'powered'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11.sp, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
