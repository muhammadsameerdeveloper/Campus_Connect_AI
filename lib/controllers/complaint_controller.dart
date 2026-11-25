import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  final selectedCategory = 'Maintenance'.obs;
  final isAnalyzing = false.obs;
  final isSubmitting = false.obs;

  final aiCategory = ''.obs;
  final aiPriority = ''.obs;
  final aiDepartment = ''.obs;
  final aiSummary = ''.obs;

  final List<String> categories = [
    'Maintenance',
    'Electrical',
    'Cleanliness',
    'Internet',
    'Classroom',
    'Other',
  ];

  String? validateField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  // AI Complaint Analyzer (Demo)
  Future<void> analyzeComplaint() async {
    final description = descriptionController.text.trim();

    if (description.isEmpty) {
      Get.snackbar(
        'Description Required',
        'Please describe your complaint first.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isAnalyzing.value = true;

    await Future.delayed(const Duration(seconds: 2));

    final text = description.toLowerCase();

    String category = 'General';
    String priority = 'Medium';
    String department = 'Administration';
    String summary = 'General university complaint detected.';

    if (text.contains('ac') ||
        text.contains('air conditioner') ||
        text.contains('fan')) {
      category = 'Maintenance';
      priority = 'High';
      department = 'Maintenance Department';
      summary = 'Classroom cooling or ventilation issue detected.';
    } else if (text.contains('electric') ||
        text.contains('light') ||
        text.contains('power')) {
      category = 'Electrical';
      priority = 'High';
      department = 'Electrical Department';
      summary = 'Electrical problem detected.';
    } else if (text.contains('water') ||
        text.contains('leak') ||
        text.contains('pipe')) {
      category = 'Plumbing';
      priority = 'High';
      department = 'Plumbing Department';
      summary = 'Water supply or plumbing issue detected.';
    } else if (text.contains('clean') ||
        text.contains('garbage') ||
        text.contains('dirty')) {
      category = 'Cleanliness';
      priority = 'Medium';
      department = 'Cleaning Department';
      summary = 'Cleanliness issue detected.';
    } else if (text.contains('internet') ||
        text.contains('wifi') ||
        text.contains('network')) {
      category = 'Internet';
      priority = 'Medium';
      department = 'IT Department';
      summary = 'Internet or network connectivity issue detected.';
    } else if (text.contains('urgent') ||
        text.contains('danger') ||
        text.contains('emergency')) {
      category = 'Emergency';
      priority = 'Critical';
      department = 'Administration';
      summary = 'Potential urgent issue detected.';
    }

    aiCategory.value = category;
    aiPriority.value = priority;
    aiDepartment.value = department;
    aiSummary.value = summary;

    isAnalyzing.value = false;

    Get.snackbar(
      'AI Analysis Complete',
      'Your complaint has been analyzed successfully.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Submit Complaint (Demo)
  void submitComplaint() {
    if (!formKey.currentState!.validate()) return;

    if (aiCategory.value.isEmpty) {
      Get.snackbar(
        'AI Analysis Required',
        'Please analyze your complaint before submitting.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isSubmitting.value = true;

    Get.snackbar(
      'Complaint Submitted',
      'Your complaint has been submitted successfully! (Demo)',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );

    isSubmitting.value = false;
  }

  @override
  void onClose() {
    titleController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
