import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studentapp/utils/routes/app_pages.dart';
import 'package:studentapp/utils/routes/app_routes.dart';
import 'package:studentapp/utils/theme/app_theme.dart';
import 'bindings/app_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const CampusConnectApp());
}

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusConnect AI',
      theme: AppTheme.lightTheme,

      initialBinding: AppBinding(),

      initialRoute: AppRoutes.splash,

      getPages: AppPages.pages,
    );
  }
}
