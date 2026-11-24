import 'package:get/get.dart';
import 'package:studentapp/utils/routes/app_routes.dart';

class DashboardController extends GetxController {
  final selectedIndex = 0.obs;

  // Bottom Navigation
  void changeTab(int index) {
    selectedIndex.value = index;

    if (index != 0) {
      Get.snackbar(
        'Coming Soon',
        'This section will be available soon.',
        snackPosition: SnackPosition.BOTTOM,
      );

      selectedIndex.value = 0;
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
