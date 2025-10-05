import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'my_donation_request_controller.dart';

const _kBg = Color(0xFFF7FBF8);
const _kCardBorder = Color(0xFFE5E7EB);
const _kGreyPill = Color(0xFFF0F2F6);
const _kSuccess = Color(0xFF10B981);
const _kPending = Color(0xFFFFC66A);
const _kRejected = Color(0xFFFF7A85);

class MyDonationRequestView extends GetView<MyDonationRequestController> {
  const MyDonationRequestView({super.key});

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
        title: Text('my_donation_request_title'.tr,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
          child: Column(
            children: [
              _Tabs(
                index: controller.selectedTab.value,
                onChanged: controller.selectTab,
              ),
              SizedBox(height: 12.h),

              if (controller.selectedTab.value == 0) _TotalSupportCard(total: controller.totalSupport),

              // Search by date row
              _SearchBar(
                controller: controller.dateSearchCtrl,
                onTapCalendar: controller.pickDate,
                onTapClear: controller.clearDate,
              ),

              SizedBox(height: 12.h),

              if (controller.selectedTab.value == 0)
                ...controller.filteredSupports.map((s) => _SupportTile(
                  img: s.imageUrl,
                  amount: controller.taka(s.amount),
                  dateText: controller.dateText(s.date),
                  onReceipt: () => controller.onReceiptTap(s),
                ))
              else
                ...controller.filteredRequests.map((r) => _RequestTile(
                  img: r.imageUrl,
                  title: r.title.tr,
                  dateText: controller.dateText(r.date),
                  status: r.status,
                )),
            ],
          ),
        );
      }),
    );
  }
}

// ---------------- UI components ----------------

class _Tabs extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  const _Tabs({required this.index, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F7),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          _TabBtn(
            text: 'support_tab'.tr,
            selected: index == 0,
            onTap: () => onChanged(0),
          ),
          SizedBox(width: 12.w),
          _TabBtn(
            text: 'request_tab'.tr,
            selected: index == 1,
            onTap: () => onChanged(1),
          ),
        ],
      ),
    );
  }
}

class _TabBtn extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;
  const _TabBtn({required this.text, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: selected ? Colors.white : _kGreyPill,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: selected
                ? [BoxShadow(color: Colors.black.withOpacity(.06), blurRadius: 10, offset: Offset(0, 4.h))]
                : [],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1F2937),
            ),
          ),
        ),
      ),
    );
  }
}



class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTapCalendar;
  final VoidCallback onTapClear;

  const _SearchBar({
    required this.controller,
    required this.onTapCalendar,
    required this.onTapClear,
  });

  @override
  Widget build(BuildContext context) {
    final hasText = controller.text.isNotEmpty;

    return Container(
      height: 48.h, // keep size like the screenshot
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3F5),
        borderRadius: BorderRadius.circular(26.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search_rounded, color: Colors.black54, size: 18.sp),
          SizedBox(width: 8.w),

          // Editable field: yyyy-mm-dd
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.datetime,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]')),
                LengthLimitingTextInputFormatter(10), // yyyy-mm-dd
              ],
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: 'search_by_date'.tr, // e.g., “Search by date”
                hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),

          if (hasText)
            IconButton(
              splashRadius: 18.r,
              padding: EdgeInsets.zero,
              icon: Icon(Icons.close_rounded, size: 18.sp, color: Colors.black45),
              onPressed: onTapClear,
            ),

          IconButton(
            splashRadius: 18.r,
            padding: EdgeInsets.zero,
            icon: Icon(Icons.calendar_today_rounded, size: 18.sp, color: Colors.black54),
            onPressed: onTapCalendar, // picker opens only from here
          ),
        ],
      ),
    );
  }
}


class _TotalSupportCard extends StatelessWidget {
  final double total;
  const _TotalSupportCard({required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12.h),

      constraints: BoxConstraints(minHeight: 126.h), // optional: nicer vertical centering
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: _kCardBorder),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 10, offset: Offset(0, 4.h)),
        ],
      ),
      child: Stack(
        alignment: Alignment.center, // <-- center non-positioned children
        children: [
          Positioned(
            right: -2,
            top: 0,
            child: Image.asset(
                'assets/icon/vector_on_total_donation.png',
                width: 200.w,
                fit: BoxFit.contain,
              ),

          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // <-- horizontal center
            children: [
              Text(
                'total_support'.tr,
                textAlign: TextAlign.center,                // <-- center text
                style: TextStyle(
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF6B7280),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '৳${total.toStringAsFixed(2)}',
                textAlign: TextAlign.center,                // <-- center text
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF111827),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class _SupportTile extends StatelessWidget {
  final String img;
  final String amount;
  final String dateText;
  final VoidCallback onReceipt;

  const _SupportTile({
    required this.img,
    required this.amount,
    required this.dateText,
    required this.onReceipt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: _kCardBorder),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 10, offset: Offset(0, 4.h))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(img, width: 58.w, height: 58.w, fit: BoxFit.cover),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(amount, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800, color: const Color(0xFF111827))),
                Text(dateText, style: TextStyle(color: Colors.black45, fontSize: 12.sp, fontWeight: FontWeight.w600)),
                Text('success'.tr, style: TextStyle(color: _kSuccess, fontSize: 12.sp, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          OutlinedButton(
            onPressed: onReceipt,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: _kCardBorder),
              foregroundColor: const Color(0xFF374151),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
            ),
            child: Text('receipt'.tr),
          ),
        ],
      ),
    );
  }
}

class _RequestTile extends StatelessWidget {
  final String img;
  final String title;
  final String dateText;
  final String status; // pending / approved / rejected

  const _RequestTile({
    required this.img,
    required this.title,
    required this.dateText,
    required this.status,
  });

  Color get _pillBg {
    switch (status) {
      case 'approved': return const Color(0xFFE6F9EF);
      case 'rejected': return const Color(0xFFFFEEF0);
      default:         return const Color(0xFFFFF6E6);
    }
  }

  Color get _pillText {
    switch (status) {
      case 'approved': return _kSuccess;
      case 'rejected': return const Color(0xFFE74646);
      default:         return const Color(0xFFB9851A);
    }
  }

  String get _pillLabel {
    switch (status) {
      case 'approved': return 'approved'.tr;
      case 'rejected': return 'rejected'.tr;
      default:         return 'pending'.tr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: _kCardBorder),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 10, offset: Offset(0, 4.h))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(img, width: 58.w, height: 58.w, fit: BoxFit.cover),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800, color: const Color(0xFF111827))),
                SizedBox(height: 4.h),
                Text(dateText, style: TextStyle(color: Colors.black45, fontSize: 12.sp, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(color: _pillBg, borderRadius: BorderRadius.circular(10.r)),
            child: Text(_pillLabel, style: TextStyle(color: _pillText, fontSize: 12.sp, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
