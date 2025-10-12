import 'package:ambufast/saved_address/model/saved_address.dart';
import 'package:ambufast/saved_address/widgets/promo_carousel.dart';
import 'package:ambufast/utils/bottom_sheet_helper.dart';
import 'package:ambufast/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'saved_address_controller.dart';

class SavedAddressView extends GetView<SavedAddressController> {
  const SavedAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'saved_address'.tr,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Obx(() {
          if (controller.isLoading.value) {
            return ListView(
              children: [
                SizedBox(height: 160.h),
                const Center(child: CircularProgressIndicator()),
                SizedBox(height: 8.h),
                Center(
                  child: Text('loading'.tr, style: TextStyle(fontSize: 13.sp)),
                ),
              ],
            );
          }

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              SizedBox(height: 8.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final address = controller.items[index];
                  return _addressTile(
                    iconPath: 'assets/ride_icons/location_pin.png',
                    address: address,
                    index: index,
                  );
                },
              ),
              _addNewTile(
                onTap: () => controller.onAddressAddSelect(
                  SavedAddress(id: 'new', title: 'add_new_address'.tr),
                  -1,
                ),
              ),
              SizedBox(height: 12.h),
              PromoCarousel(),
              SizedBox(height: 24.h),
            ],
          );
        }),
      ),
    );
  }

  Widget _addressTile({
    required String iconPath,
    required SavedAddress address,
    required int index,
  }) {
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
          leading: CircleAvatar(
            radius: 20.r,
            backgroundColor: neutral100,
            child: Image.asset(
              iconPath,
              color: blackBase,
              width: 18.w,
              fit: BoxFit.cover,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address.title, style: TextStyle(fontSize: 14.sp)),
              if (address.address != null)
                Text(address.address!, style: TextStyle(fontSize: 12.sp)),
            ],
          ),
          trailing: index < 2
              ? null
              : IconButton(
                  onPressed: () => controller.onRemove(index),
                  icon: Icon(Icons.remove, size: 24, color: negativeBase),
                ),
          onTap: () => controller.onAddressAddSelect(address, index),
        ),
        divider(),
      ],
    );
  }

  Widget _addNewTile({required VoidCallback onTap}) {
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
          leading: const Icon(Icons.add, size: 20),
          title: Text('add_new_address'.tr, style: TextStyle(fontSize: 14.sp)),
          onTap: onTap,
        ),
      ],
    );
  }
}
