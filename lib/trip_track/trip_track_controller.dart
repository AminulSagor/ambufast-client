import 'dart:async';
import 'package:ambufast/widgets/modal_sheet_widgets/cancel_confirmation_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/driver_info.dart';
import '../routes/app_routes.dart';
import 'model/trip_track_state.dart';
import 'widgets/emergency_assist_sheet.dart';

enum ActiveAddress { pickup, drop }

enum TripStage { approaching, arrived, inProgress, completed }

class TripTrackController extends GetxController {
  final _service = TripService();

  final isLoading = true.obs;
  final state = Rxn<TripTrackState>();

  final active = ActiveAddress.pickup.obs;

  // stage + destination ETA
  final stage = TripStage.approaching.obs;
  final destinationEta = Rxn<DateTime>(); // shows "by 03:24 PM"

  // ETA countdown to pickup
  final remainingSecs = 0.obs;
  Timer? _etaTimer;

  String formatCurrency(num v, {String symbol = 'BDT '}) {
    final locale = Get.locale?.toLanguageTag() ?? 'en_US';
    return NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: 2,
    ).format(v);
  }

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final s = await _service.fetchTrackState();
    state.value = s;
    isLoading.value = false;

    stage.value = TripStage.approaching;
    _updateHeader(); // rebuild header only

    // countdown to pickup
    remainingSecs.value = s.etaMinutes * 60;
    _etaTimer?.cancel();
    _etaTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSecs.value <= 0) {
        t.cancel();
        // Switch to ARRIVED, then auto move to IN_PROGRESS after a short pause (mock)
        stage.value = TripStage.arrived;
        _updateHeader();
        Future.delayed(const Duration(seconds: 3), () {
          if (state.value == null) return;
          destinationEta.value = DateTime.now().add(
            Duration(minutes: state.value!.destinationEtaMinutes),
          );
          active.value = ActiveAddress.drop;
          stage.value = TripStage.inProgress;
          _updateHeader();
          Future.delayed(const Duration(seconds: 6), () {
            if (state.value == null) return;
            stage.value = TripStage.completed;
            _updateHeader(); // trigger header AnimatedSwitcher
            Future.delayed(const Duration(seconds: 5), () {
              if (Get.currentRoute == Routes.tripTrack &&
                  stage.value == TripStage.completed) {
                Get.toNamed(Routes.tripPayment);
              }
            });
          });
        });
      } else {
        remainingSecs.value -= 60;
      }
    });
  }

  // Badge text for "approaching" header
  String get remainingBadgeText {
    final m = (remainingSecs.value / 60).ceil();
    return '$m ${'min'.tr}';
  }

  // ---- actions ----
  void onChangeDestinationInfo() {
    Get.toNamed(Routes.changeDestination);
  }

  void onChangeDestination() {
    Get.toNamed(Routes.requestRide, arguments: {'changeDestination': true});
  }

  void onCancelTrip() {
    Get.bottomSheet(CancelConfirmationModal());
  }

  void onCallDriver() =>
      Get.snackbar('Call', 'Would call driver: ${state.value?.driver.phone}');

  // ---- header-only rebuild id ----
  void _updateHeader() => update(['header']);

  @override
  void onClose() {
    _etaTimer?.cancel();
    super.onClose();
  }

  void openEmergencySheet() {
    final s = state.value!;
    Get.bottomSheet(
      isDismissible: true,
      EmergencyAssistSheet(
        currentLocation: s.pickupAddress, // mock current location
        vehicleDetails: s.driver.vehicleDetails,
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(.35),
    );
  }

  // Called by the sheet
  Future<void> shareMyTrip(String text) async {
    try {
      await Share.share(text);
    } catch (_) {
      Get.snackbar('Share', 'Unable to share (mock)');
    }
  }

  Future<void> call999() async {
    final uri = Uri.parse('tel:999');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        Get.snackbar('Call', 'Cannot place call on this device (mock)');
      }
    } catch (_) {
      Get.snackbar('Call', 'Call failed (mock)');
    }
  }
}

/// mock service

class TripService {
  Future<TripTrackState> fetchTrackState() async {
    await Future.delayed(const Duration(seconds: 1));
    return TripTrackState(
      pickupAddress: 'Jhigatola Road, Dhaka, Bangladesh',
      dropAddress: 'Square Hospital, Panthapath, Dhaka 1205, Bangladesh',
      dueAmount: 580.85,
      etaMinutes: 5,
      destinationEtaMinutes: 24,
      driver: const DriverInfo(
        name: 'Md Kamrul Hasan',
        rating: 5.0,
        ratingCount: 1.2,
        vehicleDetails: 'Toyota | Dhaka Metro 12 5896',
        phone: '+8801700000000',
      ),
    );
  }
}
