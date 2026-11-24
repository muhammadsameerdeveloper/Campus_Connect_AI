import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();

  final currentPage = 0.obs;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Your Campus, One App',
      'description':
          'Access university services, updates and everything you need in one place.',
    },
    {
      'title': 'Smart AI Assistant',
      'description':
          'Get instant answers about university departments, exams and facilities.',
    },
    {
      'title': 'Report & Track Complaints',
      'description':
          'Submit complaints and track their progress without visiting offices.',
    },
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      goToLogin();
    }
  }

  void goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
