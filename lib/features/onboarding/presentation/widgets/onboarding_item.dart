import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/font_weight_helper.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.model});

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(model.image, fit: BoxFit.cover)),
        Positioned.fill(
          child: Container(color: Colors.black.withOpacity(0.35)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.displayLarge.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeightHelper.bold,
                    fontSize: 64.sp,
                  ),
                  children: [
                    TextSpan(text: model.firstTitle),
                    TextSpan(
                      text: model.highlightedTitle,
                      style: TextStyle(color: AppColors.greenHover),
                    ),
                    TextSpan(text: model.lastTitle),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.headlineSmall,
                  children: [
                    TextSpan(
                      text: model.descriptionHover,
                      style: TextStyle(color: AppColors.greenHover),
                    ),
                    TextSpan(text: model.description),
                  ],
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ],
    );
  }
}
