import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/screens/complaints/complaint_view.dart';

import 'app_routes.dart';
import '../../controllers/lost_found_controller.dart';
import '../../screens/lost_found/lost_found_view.dart';
// Controllers
import '../../controllers/splash_controller.dart';
import '../../controllers/onboarding_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/ai_assistant_controller.dart';
import '../../controllers/complaint_controller.dart';
import '../../controllers/my_complaints_controller.dart';
import '../../screens/complaints/my_complaints_view.dart';
// Screens
import '../../screens/splash/splash_view.dart';
import '../../screens/onboarding/onboarding_view.dart';
import '../../screens/auth/login_view.dart';
import '../../screens/auth/signup_view.dart';
import '../../screens/auth/forgot_password_view.dart';
import '../../screens/dashboard/dashboard_view.dart';
import '../../screens/ai_assistant/ai_assistant_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: BindingsBuilder(() {
        Get.put<SplashController>(SplashController());
      }),
    ),

    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<OnboardingController>(() => OnboardingController());
      }),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),

    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DashboardController>(() => DashboardController());
      }),
    ),

    GetPage(
      name: AppRoutes.aiAssistant,
      page: () => const AIAssistantView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AIAssistantController>(() => AIAssistantController());
      }),
    ),

    // Report Complaint
    GetPage(
      name: AppRoutes.reportComplaint,
      page: () => const ComplaintView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ComplaintController>(() => ComplaintController());
      }),
    ),

    // My Complaints
    // My Complaints
    GetPage(
      name: AppRoutes.myComplaints,
      page: () => const MyComplaintsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<MyComplaintsController>(() => MyComplaintsController());
      }),
    ),

    // Lost & Found
    // Lost & Found
    GetPage(
      name: AppRoutes.lostFound,
      page: () => const LostFoundView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LostFoundController>(() => LostFoundController());
      }),
    ),

    // My Profile
    GetPage(
      name: AppRoutes.profile,
      page: () => const FeaturePlaceholderView(
        title: 'My Profile',
        icon: Icons.person_rounded,
      ),
    ),
  ];
}

// Temporary screens
class FeaturePlaceholderView extends StatelessWidget {
  final String title;
  final IconData icon;

  const FeaturePlaceholderView({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF17315F),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 65, color: const Color(0xFF2563EB)),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'This screen is coming soon.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
