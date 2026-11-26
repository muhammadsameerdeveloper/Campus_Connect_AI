import 'package:get/get.dart';
import 'package:studentapp/utils/routes/app_routes.dart';

class DashboardController extends GetxController {
  final selectedIndex = 0.obs;

  // Bottom Navigation
  void changeTab(int index) {
    selectedIndex.value = index;

    switch (index) {
      case 0:
        // Home
        selectedIndex.value = 0;
        break;

      case 1:
        // Services
        Get.toNamed(AppRoutes.services)?.then((_) {
          selectedIndex.value = 0;
        });
        break;

      case 2:
        // Complaints
        Get.toNamed(AppRoutes.complaints)?.then((_) {
          selectedIndex.value = 0;
        });
        break;

      case 3:
        // Profile
        Get.toNamed(AppRoutes.profile)?.then((_) {
          selectedIndex.value = 0;
        });
        break;
    }
  }

  // Notifications
  void openNotifications() {
    Get.snackbar(
      'Notifications',
      'You have no new notifications.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Search
  void openSearch() {
    Get.snackbar(
      'Search',
      'University services search will be available soon.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Dashboard Features
  void openFeature(String feature) {
    Get.snackbar(
      feature,
      '$feature section will be connected soon.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // AI Campus Assistant
  void openAIAssistant() {
    Get.toNamed(AppRoutes.aiAssistant);
  }

  // Report Complaint
  void openReportComplaint() {
    Get.toNamed(AppRoutes.reportComplaint);
  }

  // My Complaints
  void openMyComplaints() {
    Get.toNamed(AppRoutes.myComplaints);
  }

  // Lost & Found
  void openLostFound() {
    Get.toNamed(AppRoutes.lostFound);
  }

  // My Profile
  void openProfile() {
    Get.toNamed(AppRoutes.profile);
  }
}
