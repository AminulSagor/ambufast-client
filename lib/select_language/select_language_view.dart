import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'select_language_controller.dart';

const _kBg = Color(0xFFF7FBF8);
const _kCheck = Color(0xFFFF3B30);

class SelectLanguageView extends GetView<SelectLanguageController> {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _kBg,
        foregroundColor: Colors.black87,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 18.sp),
          onPressed: Get.back,
          tooltip: 'Back',
        ),
        title: Text(
          'language_title'.tr, // "Language" / "ভাষা"
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: Obx(() {
        final items = controller.options;
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          itemCount: items.length,
          separatorBuilder: (_, __) => SizedBox(height: 6.h),
          itemBuilder: (_, i) {
            final o = items[i];
            final selected = controller.isSelected(o);
            return InkWell(
              onTap: () => controller.onSelect(o),
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        o.key.tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                    ),
                    if (selected)
                      Icon(Icons.check_circle_rounded, color: _kCheck, size: 18.sp),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
