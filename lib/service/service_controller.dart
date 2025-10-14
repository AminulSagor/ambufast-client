import 'package:ambufast/routes/app_routes.dart';
import 'package:get/get.dart';

import '../model/service_tile_model.dart';

class ServiceController extends GetxController {
  final emergencyTiles = <ServiceTile>[].obs;
  final nonEmergencyTiles = <ServiceTile>[].obs;

  @override
  void onInit() {
    super.onInit();
    _seedStaticData();
  }

  void onTileTap(ServiceTile tile) {
    Get.toNamed(Routes.serviceDetails);
  }

  // --- Mock / seed
  void _seedStaticData() {
    emergencyTiles.assignAll([
      ServiceTile(
        'Ac Ambulance',
        'assets/icon/home_page_icon/ambulance_icon.png',
        'home_emergency_ac_ambulance',
      ),
      ServiceTile(
        'Non Ac Ambulance',
        'assets/icon/home_page_icon/ambulance_icon.png',
        'home_emergency_non_ac_ambulance',
      ),
      ServiceTile(
        'ICU/CCU Ambulance',
        'assets/icon/home_page_icon/ambulance_icon.png',
        'home_emergency_icu_ambulance',
      ),
      ServiceTile(
        'Freezing Van',
        'assets/icon/home_page_icon/ambulance_icon.png',
        'home_emergency_freezing_van',
      ),
      ServiceTile(
        'Ac Ambulance',
        'assets/icon/home_page_icon/ambulance_icon.png',
        'home_emergency_ac_ambulance',
      ),
      ServiceTile(
        'Non Ac Ambulance',
        'assets/icon/home_page_icon/ambulance_icon.png',
        'home_emergency_non_ac_ambulance',
      ),
      ServiceTile(
        'ICU/CCU Ambulance',
        'assets/icon/home_page_icon/ambulance_icon.png',
        'home_emergency_icu_ambulance',
      ),
      ServiceTile(
        'Freezing Van',
        'assets/icon/home_page_icon/ambulance_icon.png',
        'home_emergency_freezing_van',
      ),
    ]);

    nonEmergencyTiles.assignAll([
      ServiceTile(
        'moto',
        'assets/icon/home_page_icon/motorcycle_icon.png',
        'home_non_emergency_motorcycle',
      ),
      ServiceTile(
        'cng',
        'assets/icon/home_page_icon/cng_icon.png',
        'home_non_emergency_cng',
      ),
      ServiceTile(
        'micro',
        'assets/icon/home_page_icon/moto_saver_icon.png',
        'home_non_emergency_micro',
      ),
      ServiceTile(
        'Freezing Van',
        'assets/icon/home_page_icon/ambulance_icon.png',
        'home_emergency_freezing_van',
      ),
      ServiceTile(
        'moto',
        'assets/icon/home_page_icon/motorcycle_icon.png',
        'home_non_emergency_motorcycle',
      ),
      ServiceTile(
        'cng',
        'assets/icon/home_page_icon/cng_icon.png',
        'home_non_emergency_cng',
      ),
      ServiceTile(
        'micro',
        'assets/icon/home_page_icon/moto_saver_icon.png',
        'home_non_emergency_micro',
      ),
      ServiceTile(
        'Freezing Van',
        'assets/icon/home_page_icon/ambulance_icon.png',
        'home_emergency_freezing_van',
      ),
    ]);
  }
}
