import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    debugPrint('SplashController onReady called');

    goToNextScreen();
  }

  Future<void> goToNextScreen() async {
    debugPrint('Waiting for 3 seconds...');

    await Future.delayed(const Duration(seconds: 3));

    debugPrint('Navigating to Onboarding...');

    Get.offAllNamed(AppRoutes.onboarding);
  }
}
