import 'package:ambufast/routes/app_routes.dart';
import 'package:get/get.dart';
import 'low_cost_intercity_controller.dart';
import 'vehicle_service_model.dart';

class IntercityDetailController extends GetxController {
  late final IntercityOffer offer = Get.arguments as IntercityOffer;

  final services = <VehicleService>[].obs;
  final selectedServiceId = RxnString();
  final selectedAddons = <String, Set<String>>{}.obs; // serviceId -> option ids

  @override
  void onInit() {
    super.onInit();
    _seed();
  }

  void _seed() {
    services.assignAll([
      VehicleService(
        id: 'non_ac',
        title: 'non_ac_ambulance'.tr,
        subtitle: 'request_ride_tagline'.tr,
        options: const [
          AdditionalServiceOption(id: 'oxygen', name: 'oxygen', price: 1200),
          AdditionalServiceOption(
            id: 'wheel_chair',
            name: 'wheel_chair',
            price: 0,
          ),
          AdditionalServiceOption(
            id: 'hand_stretcher',
            name: 'hand_stretcher',
            price: 0,
          ),
          AdditionalServiceOption(
            id: 'staff_helper',
            name: 'additional_staff_helper',
            price: 0,
          ),
        ],
      ),
      VehicleService(
        id: 'ac',
        title: 'ac_ambulance'.tr,
        subtitle: 'request_ride_tagline'.tr,
        options: const [
          AdditionalServiceOption(id: 'oxygen', name: 'oxygen', price: 1200),
          AdditionalServiceOption(
            id: 'wheel_chair',
            name: 'wheel_chair',
            price: 0,
          ),
        ],
      ),
    ]);
    selectedServiceId.value = services.first.id; // default select first
  }

  bool isSelected(String id) => selectedServiceId.value == id;
  void onSelectService(String id) => selectedServiceId.value = id;

  Set<String> selectedFor(String serviceId) =>
      selectedAddons[serviceId] ?? <String>{};

  void toggleAddon(String serviceId, String optionId, bool value) {
    final set = {...selectedFor(serviceId)};
    value ? set.add(optionId) : set.remove(optionId);
    selectedAddons[serviceId] = set;
  }

  void onBookNow() {
    Get.toNamed(
      Routes.requestRide,
      arguments: {'isIntercity': true, 'intercityOffer': offer},
    );
  }
}
