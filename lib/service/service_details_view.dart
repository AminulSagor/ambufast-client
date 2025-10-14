import 'package:ambufast/utils/colors.dart';
import 'package:ambufast/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'service_details_controller.dart';

class ServiceDetailsView extends GetView<ServiceDetailsController> {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('service_details_title'.tr),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildServiceInfoCard(),
              SizedBox(height: 20.h),
              _buildAdditionalServices(),
              SizedBox(height: 20.h),
              // _buildPromoCarousel(),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  'assets/slider_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBookNowButton(),
    );
  }

  Widget _buildServiceInfoCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon/home_page_icon/ambulance_icon.png',
            height: 32.h,
            fit: BoxFit.cover,
          ),
          6.h.verticalSpace,
          Text(
            'ac_ambulance_title'.tr,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: neutral700,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'ac_ambulance_desc'.tr,
            style: TextStyle(fontSize: 10.sp, color: blackBase, height: 1.5),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalServices() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'additional_service_title'.tr,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.h),
          Obx(
            () => Column(
              children: [
                _buildServiceCheckbox(
                  titleKey: 'doctor_service',
                  priceKey: 'price_1200',
                  value: controller.additionalServices['doctor']!,
                  onChanged: () => controller.toggleService('doctor'),
                ),
                _buildServiceCheckbox(
                  titleKey: 'oxygen_service',
                  priceKey: 'price_0',
                  value: controller.additionalServices['oxygen']!,
                  onChanged: () => controller.toggleService('oxygen'),
                ),
                _buildServiceCheckbox(
                  titleKey: 'hand_stretcher_service',
                  priceKey: 'price_0',
                  value: controller.additionalServices['stretcher']!,
                  onChanged: () => controller.toggleService('stretcher'),
                ),
                _buildServiceCheckbox(
                  titleKey: 'helper_service',
                  priceKey: 'price_0',
                  value: controller.additionalServices['helper']!,
                  onChanged: () => controller.toggleService('helper'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCheckbox({
    required String titleKey,
    required String priceKey,
    required bool value,
    required VoidCallback onChanged,
  }) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onChanged,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      titleKey.tr,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: neutral700,
                      ),
                    ),
                  ),
                  Text(
                    priceKey.tr,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: neutral700,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Checkbox(
                      value: value,
                      onChanged: (val) => onChanged(),
                      activeColor: const Color(0xFFE53935),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBookNowButton() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
      child: CustomButton(
        btnTxt: 'book_now_button'.tr,
        onTap: controller.onBookNow,
      ),

      // ElevatedButton(
      //   onPressed: () {
      //     // Handle booking logic
      //   },
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: const Color(0xFFE53935),
      //     minimumSize: Size(double.infinity, 50.h),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10.r),
      //     ),
      //   ),
      //   child: Text(
      //     'book_now_button'.tr,
      //     style: TextStyle(
      //       fontSize: 16.sp,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
    );
  }
}
