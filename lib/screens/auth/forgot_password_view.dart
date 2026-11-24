import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/colors/app_colors.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class ForgotPasswordView extends GetView<AuthController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width > 600 ? size.width * 0.25 : 24,
              vertical: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 115,
                    height: 115,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlueColor,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Icon(
                      Icons.lock_reset_rounded,
                      size: 60,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Center(
                  child: Text(
                    'Reset Your Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Enter your registered university email. '
                  'We will help you recover your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.greyColor, height: 1.6),
                ),

                const SizedBox(height: 35),

                CustomTextField(
                  label: 'University Email',
                  hint: 'Enter your email',
                  controller: controller.forgotEmailController,
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 25),

                CustomButton(
                  title: 'Send Reset Link',
                  onPressed: controller.sendResetLink,
                  icon: Icons.send_rounded,
                ),

                const SizedBox(height: 15),

                Center(
                  child: TextButton.icon(
                    onPressed: controller.goToLogin,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back to Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
