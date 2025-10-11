import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LowCostIntercityController extends GetxController {
  final _service = IntercityService();

  // pagination
  final scrollController = ScrollController();
  static const int pageSize = 10;
  int _offset = 0;

  final isInitialLoading = true.obs;
  final isMoreLoading = false.obs;
  final hasMore = true.obs;

  final items = <IntercityOffer>[].obs;
  final query = ''.obs;

  List<IntercityOffer> get filtered {
    final q = query.value.trim().toLowerCase();
    if (q.isEmpty) return items;
    return items
        .where((o) => ('${o.from} ${o.to}').toLowerCase().contains(q))
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    _loadInitial();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!hasMore.value || isMoreLoading.value || isInitialLoading.value) return;
    final pos = scrollController.position;
    if (pos.pixels >= (pos.maxScrollExtent - 300)) {
      loadMore();
    }
  }

  Future<void> _loadInitial() async {
    isInitialLoading.value = true;
    _offset = 0;
    items.clear();
    hasMore.value = true;
    final first = await _service.fetchOffers(offset: _offset, limit: pageSize);
    items.addAll(first);
    _offset += first.length;
    if (first.length < pageSize) hasMore.value = false;
    isInitialLoading.value = false;
  }

  Future<void> loadMore() async {
    if (!hasMore.value) return;
    isMoreLoading.value = true;
    final next = await _service.fetchOffers(offset: _offset, limit: pageSize);
    items.addAll(next);
    _offset += next.length;
    if (next.length < pageSize) hasMore.value = false;
    isMoreLoading.value = false;
  }

  Future<void> refreshData() => _loadInitial();

  void onSearchChanged(String v) => query.value = v;

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

// Future<List<IntercityOffer>> _fetchOffers() async {
//   // Simulate API latency (1 second)
//   await Future.delayed(const Duration(seconds: 1));

//   final now = DateTime(2025, 7, 2, 22, 0); // 02 Jul, 10:00 PM
//   return List.generate(10, (i) {
//     return IntercityOffer(
//       id: 'offer_$i',
//       from: 'Naogaon',
//       to: 'Dhaka',
//       discountPercent: 30,
//       departure: now,
//       startsAfter: const Duration(hours: 2),
//       imagePath: 'assets/ambulance_written.png',
//     );
//   });
// }

class IntercityOffer {
  final String id;
  final String from;
  final String to;
  final int discountPercent;
  final DateTime departure; // date + time
  final Duration startsAfter;
  final String imagePath; // asset or url

  IntercityOffer({
    required this.id,
    required this.from,
    required this.to,
    required this.discountPercent,
    required this.departure,
    required this.startsAfter,
    required this.imagePath,
  });
}

// service intercity
class IntercityService {
  IntercityService() {
    _generateAll(); // build the in-memory dataset once
  }

  final List<IntercityOffer> _all = [];

  void _generateAll() {
    // Some sample cities to vary data
    const cities = [
      'Naogaon',
      'Dhaka',
      'Rajshahi',
      'Chattogram',
      'Sylhet',
      'Khulna',
      'Barishal',
      'Rangpur',
      'Cumilla',
      'Gazipur',
    ];

    final base = DateTime(2025, 7, 2, 22, 0); // 02 Jul, 10:00 PM
    for (int i = 0; i < 1000; i++) {
      final from = cities[i % cities.length];
      final to = cities[(i + 1) % cities.length];
      final dt = base.add(Duration(minutes: (i % 24) * 30)); // stagger times
      final after = Duration(minutes: 30 * ((i % 5) + 1));
      _all.add(
        IntercityOffer(
          id: 'offer_$i',
          from: from,
          to: to,
          discountPercent: 30 + (i % 3) * 5, // 30/35/40
          departure: dt,
          startsAfter: after,
          imagePath: 'assets/ambulance_written.png',
        ),
      );
    }
  }

  int get total => _all.length;

  /// Paginated fetch with simulated latency
  Future<List<IntercityOffer>> fetchOffers({
    required int offset,
    required int limit,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final end = (offset + limit) > _all.length ? _all.length : (offset + limit);
    if (offset >= _all.length) return [];
    return _all.sublist(offset, end);
  }
}
