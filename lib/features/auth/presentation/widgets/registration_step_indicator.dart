import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_text_styles.dart';

class RegistrationStepIndicator extends StatelessWidget {
  const RegistrationStepIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 3,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white.withOpacity(0.15)),
        borderRadius: BorderRadius.circular(AppRadius.round),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Step $currentStep of $totalSteps',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.white,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
          SizedBox(width: 12.w),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(totalSteps, (index) {
              final bool isActive = index < currentStep;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? AppColors.greenHover : Colors.white,
                    ),
                  ),
                  if (index < totalSteps - 1)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      width: 25.w,
                      height: 2.h,
                      color: index < currentStep - 1
                          ? AppColors.greenHover
                          : AppColors.white,
                    ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
