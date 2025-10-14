import 'package:ambufast/routes/app_pages.dart';
import 'package:ambufast/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'combine_controller/location_controller.dart';
import 'combine_service/location_service.dart';
import 'localization/app_translations.dart';

// Load saved locale from SharedPreferences
Future<Locale> _loadInitialLocale() async {
  final sp = await SharedPreferences.getInstance();
  final code = sp.getString('lang_code') ?? 'en';
  return code == 'bn' ? const Locale('bn', 'BD') : const Locale('en', 'US');
}

// Entry point
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1️⃣ load locale
  final initialLocale = await _loadInitialLocale();

  // 2️⃣ load .env
  await dotenv.load(fileName: ".env");

  // 3️⃣ check if token exists
  final sp = await SharedPreferences.getInstance();
  final hasToken = sp.getString('auth_token') != null;

  // 4️⃣ decide initial route
  final initialRoute = hasToken ? Routes.rating : Routes.rating;

  runApp(AmbuFastApp(initialLocale: initialLocale, initialRoute: initialRoute));
}

class AmbuFastApp extends StatelessWidget {
  final Locale initialLocale;
  final String initialRoute;

  const AmbuFastApp({
    super.key,
    required this.initialLocale,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) {
        return GetMaterialApp(
          initialBinding: BindingsBuilder(() {
            final bkKey = dotenv.env['BARIKOI_API_KEY'] ?? '';

            Get.put<LocationService>(
              LocationService(barikoiApiKey: bkKey), // <-- pass key here
              permanent: true,
            );
            Get.put<LocationController>(
              LocationController(Get.find()),
              permanent: true,
            );
          }),

          debugShowCheckedModeBanner: false,
          title: 'AmbuFast',
          translations: AppTranslations(),
          locale: initialLocale,
          fallbackLocale: const Locale('en', 'US'),
          initialRoute: initialRoute, // 👈 dynamic route here
          getPages: AppPages.routes,
          theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFAFFFB)),
        );
      },
    );
  }
}
