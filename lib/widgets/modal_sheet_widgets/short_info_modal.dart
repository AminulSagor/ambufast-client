import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShortInfoModal extends StatelessWidget {
  final String message;
  final String? messageTitle;
  final IconData? leadingIcon;
  const ShortInfoModal({
    super.key,
    required this.message,
    this.leadingIcon,
    this.messageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, Get.bottomBarHeight - 20),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: const Color(
            0xFFF9E7D0,
          ), // Light beige/yellow color from the image
          borderRadius: BorderRadius.circular(
            12.r,
          ), // Standard rounded corners for a card
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Icon
            if (leadingIcon != null) ...[
              Icon(leadingIcon, size: 40.sp),
              16.w.horizontalSpace,
            ],
            // Text Content
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (messageTitle != null) ...[
                    Text(
                      messageTitle!.tr,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1.4,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    4.h.verticalSpace,
                  ],
                  Text(
                    message.tr,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16.sp,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            16.w.horizontalSpace,

            // Close Button
            GestureDetector(
              onTap: () {
                // This closes the modal sheet
                Get.back();
              },
              child: Icon(Icons.close, color: Colors.black, size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
