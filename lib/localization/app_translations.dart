// lib/core/localization/app_translations.dart
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'app_title': 'Tri Gardening',
      'hello': 'Hello',
      'change_lang': 'Change language',
      'welcome': 'Welcome to the app!',
    },
    'bn_BD': {
      'app_title': 'ট্রাই গার্ডেনিং',
      'hello': 'হ্যালো',
      'change_lang': 'ভাষা পরিবর্তন করুন',
      'welcome': 'অ্যাপে স্বাগতম!',
    },
  };
}
