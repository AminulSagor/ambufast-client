import 'package:ambufast/utils/bottom_sheet_helper.dart';
import 'package:ambufast/utils/colors.dart';
import 'package:ambufast/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum PaymentType { online, cash }

class PaymentSelection {
  final PaymentType booking; // booking-time payment method
  final PaymentType completion; // completion-time payment method
  const PaymentSelection({required this.booking, required this.completion});
}

class PaymentMethodModal extends StatelessWidget {
  final PaymentType initialBooking;
  final PaymentType initialCompletion;
  final String? bannerAsset; // e.g. 'assets/promo_1.jpg'

  const PaymentMethodModal({
    super.key,
    this.initialBooking = PaymentType.online,
    this.initialCompletion = PaymentType.online,
    this.bannerAsset,
  });

  @override
  Widget build(BuildContext context) {
    // ephemeral controller only for this sheet
    final _c = Get.put(
      _PaymentSheetCtrl(booking: initialBooking, completion: initialCompletion),
    );

    return Material(
      borderRadius: BorderRadius.circular(16.r),
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              bottomSheetHeader(
                'select_payment_method'.tr,
                showDragHandle: true,
              ),

              SizedBox(height: 12.h),
              Text(
                'booking_payment'.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: blackBase,
                ),
              ),
              SizedBox(height: 8.h),

              // Booking Payment group (online only in mock; kept extensible)
              Obx(
                () => _PaymentTile(
                  leading: const _IconBadge(
                    icon: Icons.wifi_tethering,
                    color: Color(0xFFFFA000),
                  ),
                  title: 'online_payment'.tr,
                  subtitle: 'payment_methods_subtitle'.tr,
                  selected: _c.booking.value == PaymentType.online,
                  onTap: () => _c.booking.value = PaymentType.online,
                ),
              ),

              SizedBox(height: 10.h),

              // Banner
              bannerAsset != null
                  ? Image.asset(bannerAsset!, height: 64.h, fit: BoxFit.cover)
                  : Container(height: 64.h, color: const Color(0xFFF3F4F6)),

              SizedBox(height: 14.h),
              Text(
                'completion_payment'.tr,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8.h),

              // Completion Payment group
              Obx(
                () => _PaymentTile(
                  leading: const _IconBadge(
                    icon: Icons.wifi_tethering,
                    color: Color(0xFFFFA000),
                  ),
                  title: 'online_payment'.tr,
                  subtitle: 'payment_methods_subtitle'.tr,
                  selected: _c.completion.value == PaymentType.online,
                  onTap: () => _c.completion.value = PaymentType.online,
                ),
              ),
              SizedBox(height: 8.h),
              Obx(
                () => _PaymentTile(
                  leading: const _IconBadge(
                    icon: Icons.payments_rounded,
                    color: Color(0xFFEF5DA8),
                  ),
                  title: 'cash_payment'.tr,
                  subtitle: 'cash_payment_subtitle'.tr,
                  selected: _c.completion.value == PaymentType.cash,
                  onTap: () => _c.completion.value = PaymentType.cash,
                ),
              ),

              SizedBox(height: 14.h),

              // Done
              CustomButton(
                btnTxt: 'done'.tr,
                onTap: () {
                  Get.back(
                    result: PaymentSelection(
                      booking: _c.booking.value,
                      completion: _c.completion.value,
                    ),
                  );
                  if (Get.isRegistered<_PaymentSheetCtrl>()) {
                    Get.delete<_PaymentSheetCtrl>(); // cleanup
                  }
                },
              ),
              16.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

// --- internal helpers ---

class _PaymentSheetCtrl extends GetxController {
  _PaymentSheetCtrl({
    required PaymentType booking,
    required PaymentType completion,
  }) {
    this.booking.value = booking;
    this.completion.value = completion;
  }
  final booking = PaymentType.online.obs;
  final completion = PaymentType.online.obs;
}

class _PaymentTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _PaymentTile({
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(0xFFFBFBFD),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            leading,
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: neutralBase,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected
                  ? const Color(0xFFE53935)
                  : const Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _IconBadge({required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(icon, color: color, size: 20.sp),
    );
  }
}
