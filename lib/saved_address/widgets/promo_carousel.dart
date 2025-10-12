import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../saved_address_controller.dart';

class PromoCarousel extends StatelessWidget {
  const PromoCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavedAddressController>(
      id: 'banner', // not strictly needed; kept for clarity
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: 122.h,
              child: PageView.builder(
                controller: controller.pageCtrl,
                itemCount: controller.banners.length,
                itemBuilder: (ctx, i) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      controller.banners[i],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8.h),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(controller.banners.length, (i) {
                  final active = controller.bannerIndex.value == i;
                  return Container(
                    width: active ? 24.w : 8.w,
                    height: 4.h,
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                      color: active ? primaryBase : neutral200,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
