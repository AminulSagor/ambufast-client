import 'package:ambufast/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './request_ride_payment_controller.dart';

class RequestRidePaymentView extends GetView<RequestRidePaymentController> {
  const RequestRidePaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final sheetHeightFactor = 0.8;
    final screenSize = MediaQuery.of(context).size;
    final sheetHeight = screenSize.height * sheetHeightFactor;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -240.h,
              child: Container(
                color: Colors.grey[200], // Placeholder for the map widget
                child: Center(
                  child: Image.asset(
                    'assets/ride_images/payment_bg.jpg',
                    fit: BoxFit.cover,
                    width: screenSize.width,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50.h,
              left: 20.w,
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                constraints: BoxConstraints(maxHeight: sheetHeight),
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
                child: _paymentInfoDetails(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentInfoDetails() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 18.h),
              _buildHeader(),
              SizedBox(height: 18.h),
              _gradientDivider(),
              SizedBox(height: 16.h),
              _buildInfoTile('confirmation_payment_required'.tr),
              SizedBox(height: 12.h),
              _buildInfoTile('driver_on_standby'.tr),
              SizedBox(height: 48.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'cancellation_policy'.tr,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Image.asset(
                'assets/ride_images/lowest_fare.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              SizedBox(height: 16.h),
              _buildCouponSection(),
              SizedBox(height: 12.h),
              _buildAppliedCouponCard(),

              Container(
                color: Color(0xFFF5F7FA),
                child: Column(
                  children: [
                    _buildPriceDetail(
                      title: 'total'.tr,
                      subTitle: 'without_toll'.tr,
                      amount: Get.locale?.languageCode == 'bn'
                          ? '৫৮০.৮৫ টাকা' //HARD CODED NEED FIXING
                          : 'BDT 580.85',
                      hasInfo: true,
                    ),
                    SizedBox(height: 12.h),
                    _buildPriceDetail(
                      title: 'payable_now'.tr,
                      amount: Get.locale?.languageCode == 'bn'
                          ? '১০০.৮৫ টাকা'
                          : 'BDT 100.85',
                    ),
                    SizedBox(height: 24.h),
                    _buildPayButton(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _gradientDivider() {
    return Container(
      height: 2.h,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.red.shade600,
            Colors.white,
          ], // Define your gradient colors
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          Text(
            '${'booking_details'.tr} →',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          Image.asset(
            'assets/ride_icons/ticket_detailed.png',
            fit: BoxFit.cover,
            height: 20.h,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/ride_icons/flash-payment.png', width: 16.w),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade700,
                height: 1.4,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'coupon_promo_code'.tr,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.couponController,
                  decoration: InputDecoration(
                    hintText: 'enter_code'.tr,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    fillColor: Color(0xFFF7F8F8),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xFFE6E6E9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xFFE6E6E9)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 6.w),
              SizedBox(
                height: 48.h,
                child: ElevatedButton(
                  onPressed: controller.applyCoupon,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(110.w, 44.h),
                    backgroundColor: const Color(0xFFF43023),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'apply'.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceDetail({
    required String title,
    required String amount,
    bool hasInfo = false,
    String? subTitle,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF404557),
                ),
              ),
              if (subTitle != null) ...[
                SizedBox(width: 5.w),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.amber.shade600,
                  ),
                ),
              ],
              if (hasInfo) ...[
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      _priceBreakdownDialog(),
                      // Prevents closing by tapping outside the dialog
                      barrierDismissible: false,
                    );
                  },
                  child: Icon(
                    Icons.info,
                    color: Color(0xFF404557),
                    size: 14.sp,
                  ),
                ),
              ],
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF404557),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppliedCouponCard() {
    return Obx(() {
      if (!controller.isCouponApplied.value) {
        return const SizedBox.shrink();
      }
      return Container(
        margin: EdgeInsets.only(top: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3F8),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Image.asset(
                    'assets/ride_icons/bxs_discount.png',
                    width: 24.w,
                  ),
                ),
                SizedBox(width: 12.w),

                // Texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.appliedCouponCode.value,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'coupon_applied_message'.trParams({
                          'amount': controller.discountAmount.value,
                        }),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),

                // Close Button
                InkWell(
                  onTap: controller.removeCoupon,
                  child: Icon(
                    Icons.close,
                    color: Colors.pink.shade300,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      );
    });
  }

  Widget _buildPayButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.processPayment,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFFF43023),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'pay_now'.tr,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Dialog _priceBreakdownDialog() {
    final currency = Get.locale?.languageCode == 'bn'
        ? 'taka_currency'.tr
        : 'bdt_currency'.tr;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the dialog wrap its content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildPriceHeader(),
            SizedBox(height: 16.h),
            Text(
              'price_breakdown_description'.tr,
              style: TextStyle(
                fontSize: 14.sp,
                color: Color(0xFF33394C),
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24.h),
            _buildPriceRow('base_fare'.tr, "$currency 400.00"),
            _buildPriceRow('per_km_rate'.tr, "$currency 50.00"),
            _buildPriceRow('waiting_charges'.tr, "$currency 0.00"),
            _buildPriceRow('arrival_cost'.tr, "$currency 00.00"),
            _buildPriceRow('booking_fee'.tr, "$currency 10.00"),
            _buildPriceRow('vat_tax'.tr, "$currency 0.00"),
            SizedBox(height: 24.h),
            _buildCloseButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'price_breakdown'.tr,
          style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.close, color: Colors.red.shade400, size: 14.sp),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String title, String amount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xFF33394C),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8.w),
          const Expanded(child: DottedLine()),
          SizedBox(width: 8.w),
          Text(
            amount,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildCloseButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Get.back(), // Close the dialog
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE53935),
          padding: EdgeInsets.symmetric(vertical: 8.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'close'.tr,
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// Helper widget for the dotted line
class DottedLine extends StatelessWidget {
  const DottedLine({super.key, this.height = 1, this.color = Colors.grey});
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        const dashHeight = 1.0;
        const dashSpace = 3.0;
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}
