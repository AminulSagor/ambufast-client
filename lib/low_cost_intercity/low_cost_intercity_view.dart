import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../routes/app_routes.dart';
import 'low_cost_intercity_controller.dart';

//colors used
const _neutralBase = Color(0xFF8C8F9A);
const _neutral100 = Color(0xFFE6E6E9);
const _neutral700 = Color(0xFF404557);
const _neutral900 = Color(0xFF1A2035);
const _darkBlack = Color(0xFF0E1116);
const _primaryBase = Color(0xFFF43023);
const _borderInput = Color(0xFFE4E4E7);
const _shadow = Color(0x1F3E3445);
const _colorBg = Color(0xFFFAFFFB);

class LowCostIntercityView extends GetView<LowCostIntercityController> {
  const LowCostIntercityView({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(24.r),
      borderSide: const BorderSide(color: _borderInput),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(
          'low_cost_intercity'.tr,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Obx(() {
          if (controller.isInitialLoading.value) {
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

          final items = controller.filtered;

          return Container(
            color: _colorBg,
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 8.h),
                    child: TextField(
                      onChanged: controller.onSearchChanged,
                      style: TextStyle(fontSize: 14.sp),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12.sp),
                        hintText: 'search_hint'.tr,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: _neutralBase,
                        ),
                        prefixIcon: const Icon(Icons.search, size: 20),
                        enabledBorder: border,
                        focusedBorder: border,
                        filled: true,
                        fillColor: _neutral100,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.only(right: 13),
                          icon: const Icon(
                            Icons.calendar_today_rounded,
                            size: 20,
                            color: _neutral700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  sliver: SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      mainAxisExtent: 140.h,
                    ),
                    itemCount: items.length,
                    itemBuilder: (_, i) {
                      final offer = items[i];
                      return InkWell(
                        onTap: () => Get.toNamed(
                          Routes.intercityDetails,
                          arguments: items[i],
                        ),
                        child: IntercityCard(offer: offer),
                      );
                    },
                  ),
                ),

                // bottom loader / end marker
                SliverToBoxAdapter(
                  child: Obx(() {
                    if (controller.isMoreLoading.value) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    }
                    if (!controller.hasMore.value) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 18.h),
                        child: Center(
                          child: Text(
                            '— no more results —',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF9AA1AE),
                            ),
                          ),
                        ),
                      );
                    }
                    return SizedBox(height: 12.h);
                  }),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class IntercityCard extends StatelessWidget {
  final IntercityOffer offer;
  const IntercityCard({super.key, required this.offer});

  /// Format datetime based on the current locale (from GetX)
  String _formatDateTime(DateTime dt) {
    final locale = Get.locale?.toLanguageTag() ?? 'en_US';
    final formatter = DateFormat('dd MMM, hh:mm a', locale);
    return formatter.format(dt);
  }

  /// Format duration in hours/mins (localized)
  String _formatAfter(Duration d) {
    if (d.inHours >= 1) {
      final h = d.inHours;
      final key = h == 1 ? 'hour' : 'hours';
      return '$h ${key.tr} ${'after'.tr}';
    }
    return '${d.inMinutes} ${'min'.tr} ${'after'.tr}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            color: Colors.black.withAlpha(10),
          ),
          BoxShadow(offset: Offset(0, 28), blurRadius: 48, color: _shadow),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.r),
              topRight: Radius.circular(6.r),
            ),
            child: Image.asset(
              offer.imagePath,
              height: 54.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),

          // Text details
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${offer.from} to ${offer.to}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: _darkBlack,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  '${offer.discountPercent}% ${'discount'.tr}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: _neutral700,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatDateTime(offer.departure),
                      style: TextStyle(fontSize: 10.sp, color: _neutral900),
                    ),
                    Text(
                      '  |  ',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color(0xFFCBD0DA),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        _formatAfter(offer.startsAfter),
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: _primaryBase,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class IntercityCard extends StatelessWidget {
//   final IntercityOffer offer;
//   const IntercityCard({super.key, required this.offer});

//   /// Format datetime based on the current locale (from GetX)
//   String _formatDateTime(DateTime dt) {
//     final locale = Get.locale?.toLanguageTag() ?? 'en_US';
//     final formatter = DateFormat('dd MMM, hh:mm a', locale);
//     return formatter.format(dt);
//   }

//   /// Format duration in hours/mins (localized)
//   String _formatAfter(Duration d) {
//     if (d.inHours >= 1) {
//       final h = d.inHours;
//       final key = h == 1 ? 'hour' : 'hours';
//       return '$h ${key.tr} ${'after'.tr}';
//     }
//     return '${d.inMinutes} ${'min'.tr} ${'after'.tr}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image
//           ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16.r),
//               topRight: Radius.circular(16.r),
//             ),
//             child: Image.asset(
//               offer.imagePath,
//               height: 92.h,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),

//           // Text details
//           Padding(
//             padding: EdgeInsets.all(10.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${offer.from} to ${offer.to}',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w600,
//                     color: const Color(0xFF1D2433),
//                   ),
//                 ),
//                 SizedBox(height: 6.h),
//                 Text(
//                   '${offer.discountPercent}% ${'discount'.tr}',
//                   style: TextStyle(
//                     fontSize: 12.sp,
//                     color: const Color(0xFF6B7280),
//                   ),
//                 ),
//                 SizedBox(height: 6.h),
//                 Row(
//                   children: [
//                     Text(
//                       _formatDateTime(offer.departure),
//                       style: TextStyle(
//                         fontSize: 11.sp,
//                         color: const Color(0xFF9AA1AE),
//                       ),
//                     ),
//                     Text('  |  ',
//                         style: TextStyle(
//                           fontSize: 11.sp,
//                           color: const Color(0xFFCBD0DA),
//                         )),
//                     Text(
//                       _formatAfter(offer.startsAfter),
//                       style: TextStyle(
//                         fontSize: 11.sp,
//                         color: const Color(0xFFE14D4D),
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
