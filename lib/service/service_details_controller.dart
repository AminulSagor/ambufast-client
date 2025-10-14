import 'package:ambufast/routes/app_routes.dart';
import 'package:get/get.dart';

class ServiceDetailsController extends GetxController {
  // For additional services checkboxes
  final RxMap<String, bool> additionalServices = {
    'doctor': false,
    'oxygen': false,
    'stretcher': false,
    'helper': false,
  }.obs;

  void toggleService(String key) {
    if (additionalServices.containsKey(key)) {
      additionalServices[key] = !additionalServices[key]!;
    }
  }

  void onBookNow() {
    Get.toNamed(Routes.requestRide);
  }
}
