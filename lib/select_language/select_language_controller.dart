import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageOption {
  final String key;     // i18n key for display, e.g., 'english_us'
  final Locale locale;  // target locale
  LanguageOption(this.key, this.locale);
}

class SelectLanguageController extends GetxController {
  // List items (match your screenshot order/labels)
  final options = <LanguageOption>[
    LanguageOption('english_us', const Locale('en', 'US')),
    LanguageOption('english_uk', const Locale('en', 'GB')),
    LanguageOption('mandarin',   const Locale('zh', 'CN')),
    LanguageOption('spanish',    const Locale('es', 'ES')),
    LanguageOption('french',     const Locale('fr', 'FR')),
    LanguageOption('arabic',     const Locale('ar', 'SA')),
    LanguageOption('bengali',    const Locale('bn', 'BD')), // Bangla
    LanguageOption('russian',    const Locale('ru', 'RU')),
    LanguageOption('japanese',   const Locale('ja', 'JP')),
    LanguageOption('korean',     const Locale('ko', 'KR')),
    LanguageOption('indonesian', const Locale('id', 'ID')), // label 'Indonesia' in EN per screenshot
    LanguageOption('indian',     const Locale('hi', 'IN')), // label 'Indian' per screenshot
    LanguageOption('germany',    const Locale('de', 'DE')), // label 'Germany' per screenshot
    LanguageOption('chainish',   const Locale('zh', 'CN')), // typo kept to match screenshot
  ].obs;

  // Selected locale
  final Rx<Locale> selected = (Get.locale ?? const Locale('en', 'US')).obs;

  bool isSelected(LanguageOption o) =>
      o.locale.languageCode == selected.value.languageCode &&
          (o.locale.countryCode ?? '') == (selected.value.countryCode ?? '');

  void onSelect(LanguageOption o) {
    selected.value = o.locale;
    Get.updateLocale(o.locale);
    Get.back(); // return to previous screen after selecting
    Get.snackbar('success'.tr, 'language_updated'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1));
  }
}
