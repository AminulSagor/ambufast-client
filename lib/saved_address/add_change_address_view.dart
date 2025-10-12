import 'package:ambufast/saved_address/saved_address_controller.dart';
import 'package:ambufast/saved_address/widgets/promo_carousel.dart';
import 'package:ambufast/utils/bottom_sheet_helper.dart';
import 'package:ambufast/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/new_address_modal.dart';

class AddChangeAddressView extends GetView<SavedAddressController> {
  const AddChangeAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          controller.selectedAddress.value.title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              Container(
                height: 55.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: neutral100,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/ride_icons/confirm_location.png'),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        'jhiga_address'.tr, //'jhiga_address'.tr,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: Color(0xFF8C8F9A), size: 24.sp),
                  ],
                ),
              ),
              16.h.verticalSpace,
              ..._popularPlacesList(controller),
              8.h.verticalSpace,
              _ActionRow(
                iconPath: 'assets/ride_icons/set_location.png',
                title: 'set_location_on_map'.tr,
                onTap: controller.onSetLocationMap,
              ),
              16.h.verticalSpace,
              PromoCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Use localized keys from controller.placesKeys
List<Widget> _popularPlacesList(SavedAddressController controller) {
  return controller.placesKeys.map((keys) {
    final title = keys[0].tr;
    final sub = keys[1].tr;
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: blackFrontS,
            ),
          ),
          subtitle: Text(
            sub,
            style: TextStyle(fontSize: 12.sp, color: neutral700),
          ),
          onTap: () => controller.onLocationSelect(
            newAddress: controller.selectedAddress.value.copyWith(
              addressTitle: title,
              address: sub,
            ),
            newAddressModal: NewAddressModal(addressTitle: title, address: sub),
          ),
        ),
        divider(),
      ],
    );
  }).toList();
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.iconPath,
    required this.title,
    required this.onTap,
  });
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Image.asset(iconPath, width: 32.w, height: 32.w),
            12.w.horizontalSpace,
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 15.sp, color: blackFrontS),
              ),
            ),
            // const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
