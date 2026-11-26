import 'package:get/get.dart';
import 'package:studentapp/screens/complaints/complaints_overview_view.dart';
import 'package:studentapp/screens/complaints/my_complaints_view.dart';

// Controllers
import '../../controllers/splash_controller.dart';
import '../../controllers/onboarding_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/ai_assistant_controller.dart';
import '../../controllers/complaint_controller.dart';
import '../../controllers/lost_found_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../screens/announcements/announcements_view.dart';
import '../../screens/help_support/help_support_view.dart';
// Screens
import '../../screens/splash/splash_view.dart';
import '../../screens/onboarding/onboarding_view.dart';
import '../../screens/auth/login_view.dart';
import '../../screens/auth/signup_view.dart';
import '../../screens/auth/forgot_password_view.dart';
import '../../screens/dashboard/dashboard_view.dart';
import '../../screens/ai_assistant/ai_assistant_view.dart';
import '../../screens/complaints/complaint_view.dart';
import '../../screens/item_details/item_details_view.dart';
import '../../screens/lost_found/lost_found_view.dart';
import '../../screens/profile/profile_view.dart';
import '../../screens/services/services_view.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),

    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => OnboardingController());
      }),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
    ),

    GetPage(name: AppRoutes.signup, page: () => const SignupView()),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DashboardController());
      }),
    ),

    GetPage(name: AppRoutes.services, page: () => const ServicesView()),

    GetPage(
      name: AppRoutes.complaints,
      page: () => const ComplaintsOverviewView(),
    ),

    GetPage(
      name: AppRoutes.aiAssistant,
      page: () => const AIAssistantView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AIAssistantController());
      }),
    ),

    GetPage(
      name: AppRoutes.reportComplaint,
      page: () => const ComplaintView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ComplaintController());
      }),
    ),

    GetPage(name: AppRoutes.myComplaints, page: () => const MyComplaintsView()),

    GetPage(
      name: AppRoutes.lostFound,
      page: () => const LostFoundView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LostFoundController());
      }),
    ),

    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ProfileController());
      }),
    ),

    GetPage(
      name: AppRoutes.announcements,
      page: () => const AnnouncementsView(),
    ),
    GetPage(name: AppRoutes.itemDetails, page: () => const ItemDetailsView()),

    GetPage(name: AppRoutes.helpSupport, page: () => const HelpSupportView()),
  ];
}
