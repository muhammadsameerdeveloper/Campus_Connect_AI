import 'package:get/get.dart';

import 'app_routes.dart';

import '../../controllers/splash_controller.dart';
import '../../controllers/onboarding_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../screens/splash/splash_view.dart';
import '../../screens/onboarding/onboarding_view.dart';
import '../../screens/auth/login_view.dart';
import '../../screens/auth/signup_view.dart';
import '../../screens/auth/forgot_password_view.dart';
import '../../screens/dashboard/dashboard_view.dart';
import '../../controllers/ai_assistant_controller.dart';
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
  ];
}
