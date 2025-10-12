import 'package:ambufast/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'new_contact_controller.dart';

const _black_front_s = Color(0xFF363B47);
const _black_base = Color(0xFF1C2130);
const _neutral_base = Color(0xFF8C8F9A);
const _neutral_100 = Color(0xFFE6E6E9);
const _neutral_300 = Color(0xFFBFC1C7);
const _base_white_50 = Color(0xFFE6E6E9);

class NewContactView extends GetView<NewContactController> {
  const NewContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: const BorderSide(color: _neutral_300),
    );

    Widget label(String t) => Padding(
      padding: EdgeInsets.only(bottom: 12.h, top: 16.h),
      child: Text(
        t,
        style: TextStyle(
          fontSize: 16.sp,
          color: _black_base,
          fontWeight: FontWeight.w400,
        ),
      ),
    );

    InputDecoration deco(String hint) => InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      enabledBorder: border,
      focusedBorder: border,
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(fontSize: 13.sp, color: _neutral_base),
    );

    final locale = Get.locale?.toLanguageTag() ?? 'en_US';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabs: Phone / Email
        Container(
          height: 44.h,
          decoration: BoxDecoration(color: _neutral_100),
          child: Obx(() {
            final t = controller.inputType.value;
            return Row(
              children: [
                _tab(
                  text: 'phone_number'.tr,
                  selected: t == ContactInputType.phone,
                  onTap: () =>
                      controller.inputType.value = ContactInputType.phone,
                ),
                _tab(
                  text: 'email_address'.tr,
                  selected: t == ContactInputType.email,
                  onTap: () =>
                      controller.inputType.value = ContactInputType.email,
                ),
              ],
            );
          }),
        ),

        // Phone / Email form section
        Obx(() {
          final t = controller.inputType.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label(t == ContactInputType.phone ? 'phone'.tr : 'email'.tr),
              if (t == ContactInputType.phone)
                Row(
                  children: [
                    Container(
                      width: 86.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(color: _neutral_300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/bd_flag.png'),
                          9.w.horizontalSpace,
                          Text(
                            '+880',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextField(
                        controller: controller.phoneCtrl,
                        keyboardType: TextInputType.phone,
                        decoration: deco('enter_phone_number'.tr),
                      ),
                    ),
                  ],
                )
              else
                TextField(
                  controller: controller.emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: deco('enter_email'.tr),
                ),

              // Full name
              label('full_name'.tr),
              TextField(
                controller: controller.fullNameCtrl,
                decoration: deco('enter_full_name'.tr),
              ),

              // DOB
              label('dob'.tr),
              Obx(() {
                final d = controller.dob.value;
                final text = d == null
                    ? 'select'.tr
                    : DateFormat.yMMMd(locale).format(d);
                return InkWell(
                  onTap: controller.pickDob,
                  child: InputDecorator(
                    decoration: deco(''),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: d == null ? _neutral_base : _black_base,
                          ),
                        ),
                        const Icon(Icons.calendar_today_rounded, size: 18),
                      ],
                    ),
                  ),
                );
              }),

              // Gender
              label('gender_q'.tr),
              Obx(() {
                final g = controller.gender.value;
                return Wrap(
                  spacing: 14.w,
                  children: [
                    _radio('male', g),
                    _radio('female', g),
                    _radio('others', g),
                  ],
                );
              }),

              // Blood group
              label('blood_group'.tr),
              Obx(() {
                return DropdownButtonFormField<String>(
                  value: controller.bloodGroup.value,
                  items: controller.bloodGroups
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) => controller.bloodGroup.value = v,
                  decoration: deco('select'.tr),
                );
              }),

              SizedBox(height: 30.h),

              // Submit
              SizedBox(
                width: double.infinity,
                child: CustomButton(btnTxt: 'done', onTap: controller.submit),
              ),
              SizedBox(height: 18.h),
            ],
          );
        }),
      ],
    );
  }

  Widget _tab({
    required String text,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: selected ? _black_front_s : Colors.transparent,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: selected ? _base_white_50 : _black_base,
            ),
          ),
        ),
      ),
    );
  }

  Widget _radio(String key, String selectedKey) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: key,
          groupValue: selectedKey,
          onChanged: (v) =>
              Get.find<NewContactController>().gender.value = v ?? '',
          visualDensity: VisualDensity.compact,
        ),
        Text(key.tr),
      ],
    );
  }
}
