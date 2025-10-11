import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'vehicle_service_model.dart';

//colors used

const _neutral700 = Color(0xFF404557);
const _darkBlack = Color(0xFF0E1116);

class VehicleServiceTile extends StatelessWidget {
  final VehicleService service;
  final String iconPath;
  final bool selected;
  final Set<String> selectedOptionIds;
  final VoidCallback onSelect;
  final void Function(String optionId, bool value) onToggleOption;

  const VehicleServiceTile({
    super.key,
    required this.iconPath,
    required this.service,
    required this.selected,
    required this.selectedOptionIds,
    required this.onSelect,
    required this.onToggleOption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          onTap: onSelect,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(iconPath, width: 20.w, color: Colors.black),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: _darkBlack,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      service.subtitle,
                      style: TextStyle(fontSize: 12.sp, color: _neutral700),
                    ),
                  ],
                ),
              ),
              Radio<bool>(
                value: true,
                activeColor: Colors.black,
                groupValue: selected,
                onChanged: (_) => onSelect(),
              ),
            ],
          ),
        ),
        if (selected) ...[
          Divider(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              'additional_service'.tr,
              style: TextStyle(
                fontSize: 14.sp,
                color: _darkBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ...service.options.map((opt) {
            // price localized with intl
            final locale = Get.locale?.toLanguageTag() ?? 'en_US';
            final price = NumberFormat.currency(
              locale: locale,
              decimalDigits: 0,
              symbol: '৳ ',
            ).format(opt.price);
            return CheckboxListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 8.w),
              visualDensity: VisualDensity.compact,
              value: selectedOptionIds.contains(opt.id),
              onChanged: (v) => onToggleOption(opt.id, v ?? false),
              activeColor: Colors.black,
              title: Text(
                '${opt.name.tr} - $price',
                style: TextStyle(fontSize: 13.sp),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
            );
          }),
        ],
      ],
    );
  }
}
