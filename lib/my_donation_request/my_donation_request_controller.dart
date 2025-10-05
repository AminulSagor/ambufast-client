import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SupportItem {
  final double amount;
  final DateTime date;
  final String imageUrl; // avatar / thumbnail
  SupportItem({required this.amount, required this.date, required this.imageUrl});
}

class RequestItem {
  final String title;
  final DateTime date;
  final String status; // pending | approved | rejected
  final String imageUrl;
  RequestItem({required this.title, required this.date, required this.status, required this.imageUrl});
}

class MyDonationRequestController extends GetxController {
  // 0 = Support, 1 = Request
  final RxInt selectedTab = 0.obs;

  final Rxn<DateTime> selectedDate = Rxn<DateTime>();
  final TextEditingController dateSearchCtrl = TextEditingController();

  // Seed data (replace with API)
  final supports = <SupportItem>[
    SupportItem(amount: 2000, date: DateTime(2025, 7, 1, 22, 0), imageUrl: 'https://i.pravatar.cc/120?img=21'),
    SupportItem(amount: 2000, date: DateTime(2025, 7, 1, 22, 0), imageUrl: 'https://i.pravatar.cc/120?img=22'),
    SupportItem(amount: 800,  date: DateTime(2025, 7, 1, 22, 0), imageUrl: 'https://i.pravatar.cc/120?img=23'),
    SupportItem(amount: 0,    date: DateTime(2025, 7, 1, 22, 0), imageUrl: 'https://i.pravatar.cc/120?img=24'),
  ].obs;

  final requests = <RequestItem>[
    RequestItem(title: 'ambulance_fare', date: DateTime(2025, 7, 1, 22, 0), status: 'pending',  imageUrl: 'https://i.pravatar.cc/120?img=31'),
    RequestItem(title: 'ambulance_fare', date: DateTime(2025, 7, 1, 22, 0), status: 'approved', imageUrl: 'https://i.pravatar.cc/120?img=32'),
    RequestItem(title: 'ambulance_fare', date: DateTime(2025, 7, 1, 22, 0), status: 'rejected', imageUrl: 'https://i.pravatar.cc/120?img=33'),
  ].obs;

  // Helpers
  String taka(double v) => '৳${v.toStringAsFixed(2)}';
  String dateText(DateTime d) => DateFormat("dd MMM, h:mm a").format(d);

  double get totalSupport => supports.fold(0.0, (sum, it) => sum + it.amount);

  List<SupportItem> get filteredSupports {
    if (selectedDate.value == null) return supports;
    final d = selectedDate.value!;
    return supports.where((s) => _isSameDate(s.date, d)).toList();
  }

  List<RequestItem> get filteredRequests {
    if (selectedDate.value == null) return requests;
    final d = selectedDate.value!;
    return requests.where((r) => _isSameDate(r.date, d)).toList();
  }

  bool _isSameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  void selectTab(int index) => selectedTab.value = index;




  void onReceiptTap(SupportItem _) {
    // TODO: open receipt details/download
    Get.snackbar('receipt'.tr, 'success'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1));
  }

@override
  void onInit() {
    super.onInit();
    // Keep selectedDate in sync if user types manually (yyyy-MM-dd)
    dateSearchCtrl.addListener(() {
      final t = dateSearchCtrl.text.trim();
      if (t.isEmpty) {
        selectedDate.value = null;
        return;
      }
      try {
        final d = DateFormat('yyyy-MM-dd').parseStrict(t);
        selectedDate.value = d;
      } catch (_) {
        // Ignore invalid typing; keep previous selectedDate
      }
    });
  }

  @override
  void onClose() {
    dateSearchCtrl.dispose();
    super.onClose();
  }

  Future<void> pickDate() async {
    final now = DateTime.now();
    final initial = selectedDate.value ?? now;
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: initial,
      firstDate: DateTime(now.year - 3),
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null) {
      selectedDate.value = picked;
      dateSearchCtrl.text = DateFormat('yyyy-MM-dd').format(picked); // reflect in field
    }
  }

  void clearDate() {
    selectedDate.value = null;
    dateSearchCtrl.clear();
  }


}
