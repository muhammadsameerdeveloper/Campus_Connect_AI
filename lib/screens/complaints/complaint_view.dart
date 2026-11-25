import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/colors/app_colors.dart';

import '../../controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  const ComplaintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        title: const Text(
          'Report Complaint',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: AppColors.darkBlueColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.darkBlueColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF1744B5)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.campaign_rounded, color: Colors.white, size: 35),
                    SizedBox(height: 12),
                    Text(
                      'We are here to help!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Tell us about your university issue. Our AI assistant will help analyze it.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              _heading('Complaint Information'),

              const SizedBox(height: 15),

              _label('Complaint Title'),

              _textField(
                controller: controller.titleController,
                hint: 'e.g. Classroom AC is not working',
                icon: Icons.edit_note_rounded,
                validator: controller.validateField,
              ),

              const SizedBox(height: 18),

              _label('Complaint Category'),

              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedCategory.value,
                  decoration: _decoration(
                    'Select category',
                    Icons.category_outlined,
                  ),
                  items: controller.categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedCategory.value = value;
                    }
                  },
                ),
              ),

              const SizedBox(height: 18),

              _label('Location'),

              _textField(
                controller: controller.locationController,
                hint: 'e.g. Block A, Room 204',
                icon: Icons.location_on_outlined,
                validator: controller.validateField,
              ),

              const SizedBox(height: 18),

              _label('Complaint Description'),

              _textField(
                controller: controller.descriptionController,
                hint: 'Explain your problem in detail...',
                icon: Icons.description_outlined,
                maxLines: 5,
                validator: controller.validateField,
              ),

              const SizedBox(height: 25),

              // AI ANALYZER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFE4EAF3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.auto_awesome, color: AppColors.primaryColor),
                        SizedBox(width: 9),
                        Text(
                          'AI Complaint Analyzer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.darkBlueColor,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Let AI identify the complaint category, priority and responsible department.',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.greyColor,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 17),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Obx(
                        () => ElevatedButton.icon(
                          onPressed: controller.isAnalyzing.value
                              ? null
                              : controller.analyzeComplaint,
                          icon: controller.isAnalyzing.value
                              ? const SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(Icons.psychology_rounded),
                          label: Text(
                            controller.isAnalyzing.value
                                ? 'Analyzing Complaint...'
                                : 'Analyze My Complaint',
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Obx(() {
                      if (controller.aiCategory.value.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 12),

                          _resultRow(
                            'AI Category',
                            controller.aiCategory.value,
                            Icons.category_rounded,
                          ),

                          _resultRow(
                            'Priority',
                            controller.aiPriority.value,
                            Icons.flag_rounded,
                          ),

                          _resultRow(
                            'Department',
                            controller.aiDepartment.value,
                            Icons.apartment_rounded,
                          ),

                          const SizedBox(height: 12),

                          const Text(
                            'AI Summary',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColors.darkBlueColor,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            controller.aiSummary.value,
                            style: const TextStyle(
                              color: AppColors.greyColor,
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                height: 54,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.isSubmitting.value
                        ? null
                        : controller.submitComplaint,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: controller.isSubmitting.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.send_rounded, size: 19),
                              SizedBox(width: 9),
                              Text(
                                'Submit Complaint',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heading(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w800,
        color: AppColors.darkBlueColor,
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppColors.darkBlueColor,
        ),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: _decoration(hint, icon),
    );
  }

  InputDecoration _decoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 12, color: AppColors.greyColor),
      prefixIcon: Icon(icon, color: AppColors.primaryColor, size: 20),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: Color(0xFFE4EAF3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: Color(0xFFE4EAF3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
    );
  }

  Widget _resultRow(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 19),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkBlueColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
