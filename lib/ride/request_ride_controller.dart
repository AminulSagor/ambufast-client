// lib/ride/request_ride_controller.dart
import 'package:ambufast/low_cost_intercity/low_cost_intercity_controller.dart';
import 'package:ambufast/model/driver_model.dart';
import 'package:ambufast/widgets/modal_sheet_widgets/lowest_fare_widget.dart';
import 'package:ambufast/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets/modal_sheet_widgets/cancel_confirmation_modal.dart';
import '../widgets/modal_sheet_widgets/short_info_modal.dart';

class RequestRideController extends GetxController {
  final isIntercity = false.obs;
  IntercityOffer? intercityOffer;

  final pickupCtrl = TextEditingController();
  final dropoffCtrl = TextEditingController();

  final needRoundTrip = false.obs;

  // Chip labels (kept as before)
  final whenLabel = 'pickup_now'.tr.obs;
  final whoLabel = 'for_me'.tr.obs;
  final typeLabel = 'ac_ambulance'.tr.obs;

  final isNow = false.obs;

  // Popular place i18n keys [titleKey, subtitleKey]
  final placesKeys = const [
    ['place_airport_title', 'place_airport_sub'],
    ['place_jfp_title', 'place_jfp_sub'],
    ['place_bcity_title', 'place_bcity_sub'],
  ];

  //// ----------------------//////////////

  var selectedRelationship = ''.obs;
  var selectedHearingSource = ''.obs;
  var patientPhoneAddress = ''.obs;
  var patientConditionDescription = ''.obs;

  // Static lists for dropdowns (Example data)
  final relationshipOptions = <String>[
    'Self',
    'Family Member',
    'Friend',
    'Other',
  ].obs;

  final hearingSourceOptions = <String>[
    'Social Media',
    'Referral',
    'Advertisement',
    'Search Engine',
    'Other',
  ].obs;

  void updateRelationship(String? newValue) {
    if (newValue != null) {
      selectedRelationship.value = newValue;
    }
  }

  void updateHearingSource(String? newValue) {
    if (newValue != null) {
      selectedHearingSource.value = newValue;
    }
  }

  void onPatientPhoneAddressChanged(String value) {
    patientPhoneAddress.value = value;
  }

  void onPatientConditionChanged(String value) {
    patientConditionDescription.value = value;
  }

  void skipBooking() {
    patientPhoneAddress.value = '';
    patientConditionDescription.value = '';
    // Add logic for skipping if needed
  }

  void checkIsNow() {
    isNow.value = 'pickup_now'.tr.toLowerCase().contains(
      whenLabel.value.toLowerCase(),
    );
  }

  void continueBooking() {
    Get.back();
    if (isNow.value) {
      Get.toNamed(Routes.requestRideBook);
    } else if (isIntercity.value) {
      Get.toNamed(Routes.chooseDateTime, arguments: intercityOffer!.departure);
    } else {
      Get.toNamed(Routes.chooseDateTime);
    }
  }

  void toggleRoundTrip(bool? v) => needRoundTrip.value = v ?? false;

  final isManualDestination = false.obs;
  void pickOnMap(bool isPickup) {
    isManualDestination.value = true;
    fixedModalIndex.value = 1;
    Get.toNamed(Routes.requestRideBook);
  }

  void openSavedAddresses() {}

  void continueFlow() {
    if (pickupCtrl.text.trim().isEmpty || dropoffCtrl.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter pickup and drop-off');
      return;
    }
  }

  // Use Obx for reactive state
  final RxString _fare = '580.85'.obs;
  final RxString _distance = '35.56'.obs;
  final RxString _estTime = '60'.obs;
  final RxString _paymentMethod = 'Cash'.obs;

  String get fare => _fare.value;
  String get distance => _distance.value;
  String get estTime => _estTime.value;
  String get paymentMethod => _paymentMethod.value;

  // Mock data for dropdowns (not strictly needed for this simple screen but good practice)
  final RxList<String> tripOptions = ['Single trip', 'Round trip'].obs;
  final RxList<String> categoryOptions = ['Emergency', 'Scheduled'].obs;

  void requestSend() {
    // Logic for sending the ride request
    Get.snackbar(
      'Request Sent',
      'Booking request has been sent for BDT $fare.',
      duration: const Duration(seconds: 3),
    );
  }

  void openPaymentMethodSelection() {
    // Logic to open a bottom sheet or dialog for payment method selection
    print('Open payment selection for $paymentMethod');
  }

  // booking ride
  final fixedModalIndex = 0.obs;

  final selectedDriver = Driver(
    'Md Kamrul Hasan',
    5.0,
    1.2,
    'Toyota | Dhaka Metro 12 5896',
  ).obs;

  @override
  void onClose() {
    pickupCtrl.dispose();
    dropoffCtrl.dispose();
    super.onClose();
  }

  //lowest fare
  // The index of the currently selected vehicle
  var selectedVehicleIndex = 0.obs;

  // A list of all available vehicles
  final RxList<Vehicle> vehicles = <Vehicle>[
    Vehicle(
      iconPath: 'assets/ride_icons/ambulance_solid.png',
      price: '8000',
      distance: '26KM',
      time: '3 min',
      nameKey: 'freezing_van',
    ),
    Vehicle(
      iconPath: 'assets/ride_icons/ambulance.png',
      price: '5000',
      distance: '26KM',
      time: '3 min',
      nameKey: 'ac_ambulance',
    ),
    Vehicle(
      iconPath: 'assets/ride_icons/ambulance.png',
      price: '3000',
      distance: '26KM',
      time: '3 min',
      nameKey: 'non_ac_ambulance',
    ),
    Vehicle(
      iconPath: 'assets/ride_icons/car.png',
      price: '700',
      distance: '26KM',
      time: '3 min',
      nameKey: 'cng',
    ),
    Vehicle(
      iconPath: 'assets/ride_icons/motorcycle.png',
      price: '500',
      distance: '26KM',
      time: '3 min',
      nameKey: 'motorcycle',
    ),
    Vehicle(
      iconPath: 'assets/ride_icons/motorbike_electric.png',
      price: '300',
      distance: '26KM',
      time: '3 min',
      nameKey: 'moto_saver',
    ),
  ].obs;

  // Method to update the selected vehicle
  void selectVehicle(int index) {
    selectedVehicleIndex.value = index;
  }

  // Method for the "Done" button action
  void confirmSelection() {
    Get.back(); // Close the bottom sheet
    Get.snackbar(
      'Selection Confirmed',
      'You selected ${vehicles[selectedVehicleIndex.value].nameKey.tr}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // cancel request
  final List<String> reasonKeys = [
    'reason_ambulance_long',
    'reason_alternate_transport',
    'reason_wrong_location',
    'reason_booked_mistake',
    'reason_emergency_resolved',
    'reason_other',
  ];

  // A reactive map to hold the checked state of each reason
  late final RxMap<String, bool> selectedReasons;

  @override
  void onInit() {
    super.onInit();
    checkIsNow();
    // Initialize all reasons to false (unchecked)
    selectedReasons = {for (var key in reasonKeys) key: false}.obs;

    //cheking if intercity menu
    if (Get.arguments == null) return;
    isIntercity.value = Get.arguments['isIntercity'] as bool;
    if (isIntercity.value) {
      intercityOffer = Get.arguments['intercityOffer'] as IntercityOffer;
      isNow.value = false;
    } else {
      intercityOffer = null;
    }
  }

  // Toggles the checked state for a given reason key
  void toggleReason(String key) {
    selectedReasons[key] = !selectedReasons[key]!;
  }

  // Action for the "Keep Searching" button
  void keepSearching() {
    Get.back(); // Simply closes the bottom sheet
  }

  // Action for the "Yes, Cancel" button
  void confirmCancellation() {
    // You can add your cancellation logic here.
    // This example finds the selected reasons and shows a snackbar.
    final reasons = selectedReasons.entries
        .where((entry) => entry.value) // Filter for checked items
        .map((entry) => entry.key.tr) // Get the translated text
        .toList();

    Get.back(); // Close the bottom sheet

    if (reasons.isNotEmpty) {
      Get.snackbar(
        'Trip Cancelled',
        'Reason(s): ${reasons.join(', ')}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Trip Cancelled',
        'No reason provided.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void onLowestFareClick() {
    Get.bottomSheet(
      LowestFareWidget(),
      backgroundColor: const Color(0xFFF7F7F7),
      // Set to true if the sheet might be taller than half the screen
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  void onSendRequest() {
    fixedModalIndex.value = 1;
  }

  void onConfirmTrip() {
    Get.toNamed(Routes.requestRidePayment);
  }

  void onConfirmLocation() {
    final index = isNow.value || isIntercity.value ? 2 : 0;
    fixedModalIndex.value = index;
  }

  void onDriverConfirm() {
    if (isIntercity.value) {
      Get.toNamed(Routes.requestRidePayment);
    } else {
      fixedModalIndex.value = 3;
    }
  }

  void onSetDestination() {
    isManualDestination.value = false;
    Get.back();
  }

  void onPayment() {
    Get.toNamed(Routes.requestRidePayment);
  }

  void onRoundTripInfoTap() {
    Get.bottomSheet(
      ShortInfoModal(
        messageTitle: 'round_info_title',
        message: 'round_info_message',
        leadingIcon: Icons.warning,
      ),
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: false, // Don't take up the full screen height
      backgroundColor: Colors
          .transparent, // Crucial: Allows the container's margin/shadow to show
    );
  }

  void onCancelRide() {
    Get.bottomSheet(
      CancelConfirmationModal(),
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}

class Vehicle {
  final String iconPath;
  final String price;
  final String distance;
  final String time;
  final String nameKey; // Use a key for translation

  Vehicle({
    required this.iconPath,
    required this.price,
    required this.distance,
    required this.time,
    required this.nameKey,
  });
}
