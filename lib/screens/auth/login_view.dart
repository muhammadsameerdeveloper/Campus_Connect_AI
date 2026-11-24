import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/colors/app_colors.dart';
import 'package:studentapp/widgets/custom_button.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_textfield.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width > 600 ? size.width * 0.25 : 24,
              vertical: 25,
            ),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.account_balance_rounded,
                        color: AppColors.primaryColor,
                        size: 45,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Center(
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Center(
                    child: Text(
                      'Login to continue to your campus',
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  CustomTextField(
                    label: 'University Email',
                    hint: 'Enter your email',
                    controller: controller.emailController,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: controller.validateEmail,
                  ),

                  const SizedBox(height: 22),

                  Obx(
                    () => CustomTextField(
                      label: 'Password',
                      hint: 'Enter your password',
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

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: controller.goToForgotPassword,
                      child: const Text('Forgot Password?'),
                    ),
                  ),

                  const SizedBox(height: 15),

                  CustomButton(
                    title: 'Login',
                    onPressed: controller.login,
                    icon: Icons.login_rounded,
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                      TextButton(
                        onPressed: controller.goToSignup,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
