import 'package:derpy/core/theme/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProfileSetup extends StatelessWidget {
  const ProfileSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greenHover.withOpacity(0.16),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.greenHover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  color: AppColors.greenHover,
                ),
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  width: 24.w,
                  height: 24.h,
                  fit: .scaleDown,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Profile Setup',
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            'Complete your Profile',
            style: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 10.h),
          Text(
            'Tell us how you play and what you like-we use this so service better courts, matches, and teammates',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
