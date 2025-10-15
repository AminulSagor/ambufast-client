// lib/payment/payment_success_view.dart
import 'package:ambufast/utils/colors.dart';
import 'package:ambufast/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'payment_success_controller.dart';

class PaymentSuccessView extends GetView<PaymentSuccessController> {
  const PaymentSuccessView({super.key});

  static const _titleColor = Color(0xFF0F1728); // close to mock dark title
  static const _bodyColor = Color(0xFF6B7280); // subtle gray
  static const _primaryRed = Color(0xFFE53935);
  static const _border = Color(0xFFE6E6E9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.h.verticalSpace,
              // Success icon
              Image.asset(
                'assets/icon/done_mark.png',
                width: 112.w,
                height: 112.w,
              ),
              18.h.verticalSpace,

              // Title
              Text(
                'payment_success_title'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  height: 1.35,
                  color: _titleColor,
                ),
              ),
              14.h.verticalSpace,
              // Body with amount injected
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  'payment_success_body'.trParams({
                    'amount': controller.amount.toString(),
                  }),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    height: 1.6,
                    color: _bodyColor,
                  ),
                ),
              ),
              24.h.verticalSpace,

              // for default
              if (controller.paymentFor.value == 'default') ...[
                // Primary CTA
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: controller.goToActivity,
                    child: Text(
                      'go_to_my_activity'.tr,
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
                12.h.verticalSpace,
              ],

              // for ride now
              if (controller.paymentFor.value == 'ride_now') ...[
                // Primary CTA
                CustomButton(btnTxt: 'add_another_vehicle'.tr, onTap: () {}),
                16.h.verticalSpace,
                if (controller.paymentFor.value == 'ride_now')
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          btnTxt: 'trip_details'.tr,
                          onTap: () {},
                        ),
                      ),
                      16.w.horizontalSpace,
                      Expanded(
                        child: CustomButton(
                          btnTxt: 'track_trip'.tr,
                          onTap: controller.onTrackTrip,
                        ),
                      ),
                    ],
                  ),
                //for ride later
                if (controller.paymentFor.value == 'ride_later')
                  CustomButton(btnTxt: 'details'.tr, onTap: () {}),
                16.h.verticalSpace,
              ],

              // for ride complete
              if (controller.paymentFor.value == 'ride_complete') ...[
                // Primary CTA
                CustomButton(btnTxt: 'rebook_this_trip'.tr, onTap: () {}),
                16.h.verticalSpace,
                CustomButton(btnTxt: 'rate_of_driver'.tr, onTap: () {}),
                16.h.verticalSpace,
              ],

              // Back to home
              CustomButton(
                btnTxt: 'back_to_home'.tr,
                onTap: controller.backHome,
                btnColor: neutral50,
                txtColor: neutral700,
                borderColor: neutral200,
              ),

              18.h.verticalSpace,

              // Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  'assets/support_page_image.png',
                  height: 80.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              16.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
