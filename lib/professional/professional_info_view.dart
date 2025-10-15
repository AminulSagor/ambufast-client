import 'package:ambufast/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/custom_button.dart';
import 'professional_info_controller.dart';

class ProfessionalInfoView extends GetView<ProfessionalInfoController> {
  const ProfessionalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'professional_info_title'.tr,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: neutral700,
          ),
        ),
      ),
      body: Obx(() {
        final info = controller.info.value;
        final isReview = controller.underReview.value;
        final isNotApproved = controller.notApproved.value;
        return Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  // NEW: Under-review info card
                  if (isReview) _underReviewCard(),
                  if (isReview) SizedBox(height: 12.h),

                  if (isNotApproved) _notApprovedCard(), // NEW pink card
                  if (isNotApproved) SizedBox(height: 12.h),

                  _box('affiliation_type'.tr, info.affiliationType),
                  12.h.verticalSpace,
                  _box('org_business_name'.tr, info.organisationName),
                  12.h.verticalSpace,
                  _box('your_role'.tr, info.role),
                  12.h.verticalSpace,
                  _box('zone_area'.tr, info.zone),
                  12.h.verticalSpace,

                  _uploadStatus('work_id'.tr, info.workIdPath != null),
                  12.h.verticalSpace,
                  _uploadStatus('nid_front'.tr, info.nidFrontPath != null),
                  12.h.verticalSpace,
                  _uploadStatus('nid_back'.tr, info.nidBackPath != null),
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 12.h),
                child: CustomButton(
                  btnTxt: 'edit'.tr,
                  onTap: isReview ? null : controller.goToEdit,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _box(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 48,
            color: Colors.black.withAlpha(10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: neutralBase,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: neutral800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _uploadStatus(String title, bool uploaded) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: neutral100,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.description_outlined, color: neutral600),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 14.sp, color: neutral600),
            ),
          ),
          Image.asset(
            'assets/download-one.png',
            height: 20.h,
            color: neutral600,
          ),
        ],
      ),
    );
  }

  Widget _underReviewCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: orange50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFFFE3B3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, color: neutral700),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'under_review_title'.tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: neutral700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'under_review_desc'.tr,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: neutral700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _notApprovedCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: negative50, // light pink
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFF8C7D3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, color: neutral700),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'docs_not_approved_title'.tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: neutral700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'docs_not_approved_desc'.tr,
                  style: TextStyle(fontSize: 14.sp, color: neutral700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
