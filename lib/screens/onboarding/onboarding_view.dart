import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:studentapp/utils/colors/app_colors.dart';

import '../../controllers/onboarding_controller.dart';
import '../../widgets/custom_button.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  IconData getIllustration(int index) {
    switch (index) {
      case 0:
        return Icons.account_balance_outlined;
      case 1:
        return Icons.smart_toy_outlined;
      default:
        return Icons.task_alt_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isSmallScreen = size.height < 700;

    final illustrationSize = (size.width * 0.58).clamp(150.0, 240.0);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.goToLogin,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.onboardingData.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    final item = controller.onboardingData[index];

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        final imageSize = illustrationSize.clamp(
                          120.0,
                          constraints.maxHeight * 0.43,
                        );

                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: imageSize,
                                  height: imageSize,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlueColor,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: imageSize * 0.70,
                                        height: imageSize * 0.70,
                                        decoration: const BoxDecoration(
                                          color: AppColors.whiteColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Icon(
                                        getIllustration(index),
                                        size: imageSize * 0.40,
                                        color: AppColors.primaryColor,
                                      ),
                                      Positioned(
                                        right: 15,
                                        top: 15,
                                        child: CircleAvatar(
                                          radius: 16,
                                          backgroundColor:
                                              AppColors.lightGreenColor,
                                          child: const Icon(
                                            Icons.check,
                                            size: 19,
                                            color: AppColors.darkGreenColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: isSmallScreen ? 22 : 35),

                                Text(
                                  item['title']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 21 : 25,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.blackColor,
                                  ),
                                ),

                                SizedBox(height: isSmallScreen ? 10 : 15),

                                Text(
                                  item['description']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 13 : 15,
                                    height: 1.5,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              SmoothPageIndicator(
                controller: controller.pageController,
                count: controller.onboardingData.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotColor: AppColors.lightGreyColor,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3,
                ),
              ),

              SizedBox(height: isSmallScreen ? 20 : 30),

              Obx(
                () => CustomButton(
                  title:
                      controller.currentPage.value ==
                          controller.onboardingData.length - 1
                      ? 'Get Started'
                      : 'Continue',
                  onPressed: controller.nextPage,
                  icon: Icons.arrow_forward_rounded,
                ),
              ),

              SizedBox(height: isSmallScreen ? 15 : 25),
            ],
          ),
        ),
      ),
    );
  }
}
