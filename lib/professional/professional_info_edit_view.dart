import 'package:ambufast/utils/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'professional_info_edit_controller.dart';

class ProfessionalInfoEditView extends GetView<ProfessionalInfoEditController> {
  const ProfessionalInfoEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'edit_professional_info'.tr,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  // Section: Professional Information
                  _sectionTitle('professional_information'.tr),
                  24.h.verticalSpace,
                  _fieldLabel('affiliation_type_star'.tr),
                  Obx(
                    () => InkWell(
                      onTap: controller.openAffiliationSheet,
                      borderRadius: BorderRadius.circular(6.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 18.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: neutral200),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                controller.selectedAffiliation.value,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.expand_more_rounded,
                              color: neutralBase,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 48.h),

                  // Section: Affiliation Details
                  _sectionTitle('affiliation_details'.tr),
                  24.h.verticalSpace,
                  _fieldLabel('org_business_name_star'.tr),
                  TextFormField(
                    controller: controller.orgCtrl,
                    decoration: _inputDecoration(hint: 'org_name_hint'.tr),
                    validator: (v) =>
                        (v?.trim().isEmpty ?? true) ? 'required'.tr : null,
                  ),
                  SizedBox(height: 12.h),
                  _fieldLabel('your_role_star'.tr),
                  TextFormField(
                    controller: controller.roleCtrl,
                    decoration: _inputDecoration(hint: 'role_hint'.tr),
                    validator: (v) =>
                        (v?.trim().isEmpty ?? true) ? 'required'.tr : null,
                  ),
                  SizedBox(height: 12.h),
                  _fieldLabel('zone_area_star'.tr),
                  TextFormField(
                    controller: controller.zoneCtrl,
                    decoration: _inputDecoration(hint: 'zone_hint'.tr),
                    validator: (v) =>
                        (v?.trim().isEmpty ?? true) ? 'required'.tr : null,
                  ),

                  SizedBox(height: 48.h),

                  // Document uploads
                  _sectionTitle('document_uploads'.tr),
                  24.h.verticalSpace,
                  _workIdCard(),
                  SizedBox(height: 16.h),
                  _uploadDrop(
                    title: 'nid_front_star'.tr,
                    subtitle: 'nid_front_hint'.tr,
                    maxNote: 'nid_front_maxnote'.tr,
                    onTap: controller.pickNidFront,
                    isUploadedRx: controller.nidFrontPath,
                  ),
                  SizedBox(height: 16.h),
                  _uploadDrop(
                    title: 'nid_back_star'.tr,
                    subtitle: 'nid_back_hint'.tr,
                    maxNote: 'nid_back_maxnote'.tr,
                    onTap: controller.pickNidBack,
                    isUploadedRx: controller.nidBackPath,
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 12.h),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    onPressed: controller.confirmBeforeSubmit,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'update'.tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.arrow_forward_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- UI pieces ----------
  InputDecoration _inputDecoration({String? hint}) => InputDecoration(
    hintText: hint,
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(color: neutral200),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(color: neutral200),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(color: negativeBase),
    ),
  );

  Widget _sectionTitle(String text) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.only(right: 16.w),
          width: double.infinity,
          height: 1.h,
          color: neutral100,
        ),
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF111827),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 16.w),
          width: double.infinity,
          height: 1.h,
          color: neutral100,
        ),
      ),
    ],
  );

  Widget _fieldLabel(String text) => Padding(
    padding: EdgeInsets.only(bottom: 12.h),
    child: Text(
      text,
      style: TextStyle(fontSize: 14.sp, color: blackBase),
    ),
  );

  Widget _workIdCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 50,
            color: Colors.black.withAlpha(20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'work_id_upload_title'.tr,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: blackBase,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'work_id_upload_desc'.tr,
            style: TextStyle(fontSize: 12.sp, color: neutral600),
          ),
          SizedBox(height: 10.h),
          _uploadDrop(
            title: '',
            subtitle: 'drag_or_browse'.tr,
            onTap: controller.pickWorkId,
            isUploadedRx: controller.workIdPath,
            showTitle: false,
            dashColor: posititveBase,
            isWorkId: true,
          ),
          16.h.verticalSpace,
          Text(
            'only_img_10mb'.tr,
            style: TextStyle(fontSize: 13.sp, color: neutral600),
          ),
        ],
      ),
    );
  }

  Widget _uploadDrop({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required RxnString isUploadedRx,
    bool showTitle = true,
    Color? dashColor,
    bool isWorkId = false,
    String? maxNote,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
        if (showTitle) SizedBox(height: 8.h),
        Obx(() {
          final uploaded = isUploadedRx.value != null;
          return InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8.r),
            child: DottedBorder(
              color: dashColor ?? neutral600,
              strokeWidth: 1,
              dashPattern: const [6, 6], // length of dash & gap
              borderType: BorderType.RRect,
              radius: Radius.circular(12.r),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: isWorkId ? 24.h : 47.h,
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 18.r,
                      backgroundColor: uploaded ? posititve50 : negative50,
                      child: (!uploaded && !isWorkId)
                          ? Image.asset('assets/icon/gallery_add.png')
                          : Icon(
                              uploaded
                                  ? Icons.check_rounded
                                  : Icons.cloud_upload_outlined,
                              color: uploaded ? posititveBase : negativeBase,
                            ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      uploaded ? 'uploaded_success'.tr : subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: uploaded ? posititveBase : blackBase,
                        fontWeight: uploaded
                            ? FontWeight.w700
                            : FontWeight.w400,
                      ),
                    ),
                    if (maxNote != null) ...[
                      SizedBox(height: 6.h),
                      Text(
                        maxNote,
                        style: TextStyle(fontSize: 12.sp, color: primaryBase),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
