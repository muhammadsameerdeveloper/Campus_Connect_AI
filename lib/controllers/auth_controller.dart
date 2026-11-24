import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/routes/app_routes.dart';

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final nameController = TextEditingController();
  final studentIdController = TextEditingController();
  final departmentController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final forgotEmailController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isLoading = false.obs;

  void togglePassword() {
    isPasswordVisible.toggle();
  }

  void toggleConfirmPassword() {
    isConfirmPasswordVisible.toggle();
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    if (!GetUtils.isEmail(value.trim())) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 6) {
      return 'Password must contain at least 6 characters';
    }

    return null;
  }

  void login() {
    Get.offAllNamed(AppRoutes.dashboard);
  }

  void signup() {
    if (!signupFormKey.currentState!.validate()) return;

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Password Error',
        'Passwords do not match',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.snackbar(
      'Demo Account',
      'Signup UI is working. Firebase registration will be added later.',
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.offAllNamed(AppRoutes.dashboard);
  }

  void sendResetLink() {
    if (!GetUtils.isEmail(forgotEmailController.text.trim())) {
      Get.snackbar('Invalid Email', 'Please enter a valid email address');
      return;
    }

    Get.snackbar(
      'Demo Mode',
      'Password reset will work after Firebase integration.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void goToSignup() {
    Get.toNamed(AppRoutes.signup);
  }

  void goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  void goToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    studentIdController.dispose();
    departmentController.dispose();
    confirmPasswordController.dispose();
    forgotEmailController.dispose();

    super.onClose();
  }
}
