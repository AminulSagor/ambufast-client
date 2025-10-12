import 'package:ambufast/routes/app_routes.dart';
import 'package:ambufast/saved_address/widgets/custom_bottom_sheet.dart';
import 'package:ambufast/saved_address/widgets/new_address_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model/saved_address.dart';

class SavedAddressController extends GetxController {
  final _service = SavedAddressService();

  final isLoading = true.obs;
  final isAddNew = false.obs;
  final Rx<SavedAddress> selectedAddress = SavedAddress(
    id: 'new',
    title: 'add_new_address',
  ).obs;
  final selectedAddressIndex = (-1).obs;
  final items = <SavedAddress>[].obs;

  final addressNameController = TextEditingController();

  // banner
  final pageCtrl = PageController(viewportFraction: 1);
  final bannerIndex = 0.obs;
  final banners = const ['assets/slider_image.png', 'assets/slider_image.png'];

  @override
  void onInit() {
    super.onInit();
    _load();
    pageCtrl.addListener(() {
      final i = pageCtrl.page?.round() ?? 0;
      if (i != bannerIndex.value) bannerIndex.value = i;
    });
  }

  Future<void> _load() async {
    isLoading.value = true;
    try {
      final data = await _service.fetchSaved();
      items.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() => _load();

  // void onAddNew() {
  //   Get.toNamed(Routes.addChangeAddress);
  // }

  void onAddressAddSelect(SavedAddress address, int index) {
    selectedAddress.value = address;
    selectedAddressIndex.value = index;

    // index < 0 means adding new address
    if (index < 0) {
      isAddNew.value = true;
    } else {
      isAddNew.value = false;
    }
    Get.toNamed(Routes.addChangeAddress);
  }

  void onSetLocationMap() {
    Get.toNamed(
      Routes.setLocationMap,
      arguments: () => onLocationSelect(
        newAddress:
            selectedAddress.value, // should change to choosen location from map
        newAddressModal: NewAddressModal(
          addressTitle: 'hazrat_airport_title'.tr, // change to data from map
          address: 'hazrat_airport_sub'.tr, // change to data from map
        ),
      ),
    );
  }

  void onLocationSelect({
    required SavedAddress newAddress,
    required Widget newAddressModal,
  }) {
    if (isAddNew.value) {
      // final itemIndex = items.indexWhere(
      //   (a) => a.id == selectedAddress.value.id,
      // );
      Get.bottomSheet(
        CustomBottomSheet(showHandle: false, child: newAddressModal),
        isScrollControlled: true, // Use this for variable height
        ignoreSafeArea: false,
        backgroundColor: Colors.transparent,
      );
    } else {
      items[selectedAddressIndex.value!] = newAddress;
      Get.back();
    }
  }

  void onNamingDone(SavedAddress address) {
    addressNameController.clear();
    items.add(address);
    Get.until((route) => route.settings.name == Routes.savedAddress);
  }

  void onRemove(int index) {
    items.removeAt(index);
  }

  // IconData iconFor(AddressType t) {
  //   switch (t) {
  //     case AddressType.home:
  //       return Icons.home_outlined;
  //     case AddressType.office:
  //       return Icons.apartment_outlined;
  //     case AddressType.hospital:
  //       return Icons.local_hospital_outlined;
  //     case AddressType.other:
  //     default:
  //       return Icons.place_outlined;
  //   }
  // }

  @override
  void onClose() {
    pageCtrl.dispose();
    addressNameController.dispose();
    super.onClose();
  }

  // Popular place i18n keys [titleKey, subtitleKey]
  final placesKeys = const [
    ['place_airport_title', 'place_airport_sub'],
    ['place_jfp_title', 'place_jfp_sub'],
    ['place_bcity_title', 'place_bcity_sub'],
  ];
}

// MOCK API
class SavedAddressService {
  Future<List<SavedAddress>> fetchSaved() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      SavedAddress(id: '1', title: 'home'.tr),
      SavedAddress(id: '2', title: 'office'.tr),
    ];
  }
}
