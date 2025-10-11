import 'package:ambufast/ride/bottom_sheet_widgets.dart';
import 'package:ambufast/ride/request_ride_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../routes/app_routes.dart';

class ChooseDateTimeController extends GetxController {
  final currentLocale = Get.locale?.toString() ?? 'en_US';
  // A reactive variable to hold the selected date and time.
  // We initialize it with a future date for demonstration.
  var selectedDateTime = DateTime.now().add(const Duration(days: 1)).obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      selectedDateTime.value = Get.arguments as DateTime;
    }
  }

  // --- Getters for formatted date and time strings ---
  String getFormattedFullDateTime(String locale) {
    // The locale needs to be explicitly passed for correct formatting in Bengali
    final format = DateFormat('E, dd MMM y | hh:mm a', locale);
    return format.format(selectedDateTime.value);
  }

  String getFormattedTime(String locale) {
    final format = DateFormat('hh:mm:ss a', locale);
    return format.format(selectedDateTime.value);
  }

  String getFormattedDate(String locale) {
    final format = DateFormat('E, MMM dd, yy', locale);
    return format.format(selectedDateTime.value);
  }

  // --- Methods to show pickers ---
  void showDatePicker() {
    // A temporary variable to hold the picker's state
    DateTime tempDate = selectedDateTime.value;

    Get.bottomSheet(
      isScrollControlled: true,
      buildPickerSheet(
        title: 'choose_a_date'.tr,
        picker: CupertinoDatePicker(
          initialDateTime: selectedDateTime.value,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (newDate) {
            tempDate = newDate;
          },
        ),
        onDone: () {
          // On "Done" pressed
          final currentDateTime = selectedDateTime.value;
          // Combine the new date with the existing time
          selectedDateTime.value = DateTime(
            tempDate.year,
            tempDate.month,
            tempDate.day,
            currentDateTime.hour,
            currentDateTime.minute,
            currentDateTime.second,
          );
          Get.back();
        },
      ),
    );
  }

  void showTimePicker() {
    DateTime tempTime = selectedDateTime.value;

    Get.bottomSheet(
      buildPickerSheet(
        title: 'choose_a_time'.tr,
        picker: CupertinoDatePicker(
          initialDateTime: selectedDateTime.value,
          mode: CupertinoDatePickerMode.time,
          use24hFormat: false,
          onDateTimeChanged: (newTime) {
            tempTime = newTime;
          },
        ),
        onDone: () {
          // On "Done" pressed
          selectedDateTime.value = tempTime;
          Get.back();
        },
      ),
    );
  }

  void goToNextPage({required RequestRideController controller}) {
    Get.toNamed(Routes.requestRideBook);
    controller.fixedModalIndex.value = 1;
  }
}
