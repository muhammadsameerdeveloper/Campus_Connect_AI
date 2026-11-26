import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController(text: 'Muhammad Sameer');

  final emailController = TextEditingController(text: 'sameer@student.edu');

  final departmentController = TextEditingController(text: 'Computer Science');

  final studentIdController = TextEditingController(text: 'STU-2026-001');

  final name = 'Muhammad Sameer'.obs;
  final email = 'sameer@student.edu'.obs;
  final department = 'Computer Science'.obs;

  final isNotificationsEnabled = true.obs;

  void saveProfile() {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty) {
      Get.snackbar(
        'Required',
        'Name and email cannot be empty.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    name.value = nameController.text.trim();
    email.value = emailController.text.trim();
    department.value = departmentController.text.trim();

    Get.back();

    Get.snackbar(
      'Profile Updated',
      'Your profile has been updated successfully.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void toggleNotifications(bool value) {
    isNotificationsEnabled.value = value;
  }

  void logout() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      textCancel: 'Cancel',
      textConfirm: 'Logout',
      confirmTextColor: Colors.white,
      buttonColor: const Color(0xFF2563EB),
      onConfirm: () {
        Get.back();
        Get.offAllNamed('/login');
      },
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    departmentController.dispose();
    studentIdController.dispose();
    super.onClose();
  }
}
