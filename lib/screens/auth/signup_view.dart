import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/colors/app_colors.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width > 600 ? size.width * 0.25 : 24,
              vertical: 20,
            ),
            child: Form(
              key: controller.signupFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Join CampusConnect AI',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: AppColors.blackColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Create your student account to get started.',
                    style: TextStyle(color: AppColors.greyColor),
                  ),

                  const SizedBox(height: 28),

                  CustomTextField(
                    label: 'Full Name',
                    hint: 'Enter your full name',
                    controller: controller.nameController,
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  CustomTextField(
                    label: 'Student ID',
                    hint: 'Enter your student ID',
                    controller: controller.studentIdController,
                    prefixIcon: Icons.badge_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your student ID';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  CustomTextField(
                    label: 'Department',
                    hint: 'e.g. Computer Science',
                    controller: controller.departmentController,
                    prefixIcon: Icons.school_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your department';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  CustomTextField(
                    label: 'University Email',
                    hint: 'Enter your email',
                    controller: controller.emailController,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: controller.validateEmail,
                  ),

                  const SizedBox(height: 18),

                  Obx(
                    () => CustomTextField(
                      label: 'Password',
                      hint: 'Create a password',
                      controller: controller.passwordController,
                      prefixIcon: Icons.lock_outline,
                      obscureText: !controller.isPasswordVisible.value,
                      validator: controller.validatePassword,
                      suffixIcon: IconButton(
                        onPressed: controller.togglePassword,
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Obx(
                    () => CustomTextField(
                      label: 'Confirm Password',
                      hint: 'Re-enter your password',
                      controller: controller.confirmPasswordController,
                      prefixIcon: Icons.lock_reset_outlined,
                      obscureText: !controller.isConfirmPasswordVisible.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != controller.passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: controller.toggleConfirmPassword,
                        icon: Icon(
                          controller.isConfirmPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  CustomButton(
                    title: 'Create Account',
                    onPressed: controller.signup,
                    icon: Icons.person_add_alt_1,
                  ),

                  const SizedBox(height: 15),

                  Center(
                    child: TextButton(
                      onPressed: controller.goToLogin,
                      child: const Text('Already have an account? Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
