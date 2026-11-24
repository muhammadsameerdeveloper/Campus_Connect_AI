import 'package:flutter/material.dart';
import 'package:studentapp/utils/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isOutlined;
  final bool isLoading;
  final double height;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.isOutlined = false,
    this.isLoading = false,
    this.height = 54,
    this.borderRadius = 14,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.white : AppColors.primaryColor,
          foregroundColor: isOutlined ? AppColors.primaryColor : Colors.white,
          elevation: isOutlined ? 0 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: isOutlined
                ? const BorderSide(color: AppColors.primaryColor, width: 1.3)
                : BorderSide.none,
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 23,
                width: 23,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: 9),
                  ],
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
