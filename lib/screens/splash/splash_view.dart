import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/colors/app_colors.dart';

import '../../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final logoSize = (size.width * 0.38).clamp(120.0, 190.0);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFFEFF6FF), Color(0xFFE6F9EF)],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: logoSize,
                          height: logoSize,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(0.12),
                                blurRadius: 35,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(27),
                            child: Image.asset(
                              'assets/images/campus_connect_logo.png',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.account_balance_rounded,
                                  size: 75,
                                  color: AppColors.primaryColor,
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        const Text(
                          'CampusConnect AI',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w800,
                            color: AppColors.darkBlueColor,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Your Smart University Companion',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.greyColor,
                          ),
                        ),

                        const Spacer(),

                        const SizedBox(
                          height: 28,
                          width: 28,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                            strokeWidth: 2.5,
                          ),
                        ),

                        const SizedBox(height: 35),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
