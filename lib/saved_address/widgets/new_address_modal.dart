import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/bottom_sheet_helper.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../model/saved_address.dart';
import '../saved_address_controller.dart';

class NewAddressModal extends StatelessWidget {
  final String addressTitle;
  final String address;
  const NewAddressModal({
    super.key,
    required this.addressTitle,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: const BorderSide(color: neutral200),
    );

    final controller = Get.find<SavedAddressController>();

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.h),
              child: Center(
                child: Text(
                  'address_name_title'.tr,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            divider(),

            // Name label
            24.h.verticalSpace,
            Text(
              'name_label'.tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: blackBase,
              ),
            ),

            // Name input
            12.h.verticalSpace,
            TextField(
              controller: controller.addressNameController,
              decoration: InputDecoration(
                hintText: 'enter_name'.tr,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.h,
                  horizontal: 12.w,
                ),
                enabledBorder: border,
                focusedBorder: border,
              ),
              style: TextStyle(fontSize: 13.sp),
            ),

            SizedBox(height: 16.h),

            InkWell(
              borderRadius: BorderRadius.circular(10.r),
              onTap: () {},
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          addressTitle,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: blackFrontS,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          address,
                          style: TextStyle(fontSize: 12.sp, color: neutral700),
                        ),
                      ],
                    ),
                  ),

                  const Icon(Icons.arrow_forward_rounded),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Done button
            CustomButton(
              btnTxt: 'done'.tr,
              onTap: () {
                final name = controller.addressNameController.text.trim();
                final newAddress = SavedAddress(
                  id: (controller.items.length + 1).toString(),
                  title: name,
                  addressTitle: addressTitle,
                  address: address,
                );
                controller.onNamingDone(newAddress);
              },
            ),
          ],
        ),
      ),
    );
  }
}
