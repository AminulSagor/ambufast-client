import 'package:ambufast/home/home_controller.dart';
import 'package:ambufast/service/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../combine_controller/location_controller.dart';
import '../model/service_tile_model.dart';
import '../widgets/ambu_app_bar_widget.dart';
import '../widgets/bottom_nav_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/section_header_widget.dart';
import '../widgets/service_tile_card_widget.dart';

class ServiceView extends GetView<ServiceController> {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = Get.find<LocationController>();
    final homeController = Get.isRegistered<HomeController>()
        ? Get.find<HomeController>()
        : Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AmbuAppBar(
        locationBuilder: (ctx) => Obx(
          () => Text(
            loc.locationText.value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp, // <-- was missing
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ),
        isLocationMissing: () {
          final v = loc.locationText.value.trim();
          return v.isEmpty || v.contains('not available');
        },
        onRequestDeviceLocation: loc.refreshFromDevice,
        showNotificationDot: true,
      ),

      body: SafeArea(
        child: Obx(
          () => CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SearchBarRow(controller: homeController),
              ),
              SliverToBoxAdapter(
                child: SectionHeader(title: 'home_emergency'.tr),
              ),
              SliverToBoxAdapter(
                child: _GridServices(
                  tiles: controller.emergencyTiles,
                  onTap: controller.onTileTap,
                ),
              ),
              SliverToBoxAdapter(
                child: SectionHeader(title: 'home_non_emergency'.tr),
              ),
              SliverToBoxAdapter(
                child: _GridServices(
                  tiles: controller.nonEmergencyTiles,
                  onTap: controller.onTileTap,
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
      // Bottom nav (matching your assets)
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}

class _GridServices extends StatelessWidget {
  final List<ServiceTile> tiles;
  final void Function(ServiceTile) onTap;
  const _GridServices({required this.tiles, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tiles.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 90,
          crossAxisSpacing: 8, // match spacing from mock
          mainAxisSpacing: 12,
        ),
        itemBuilder: (_, i) {
          final t = tiles[i];
          return ServiceTileCard(
            asset: t.asset,
            title: t.titleKey.tr,
            onTap: () => onTap(t),
          );
        },
      ),
    );
  }
}
