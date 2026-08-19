import 'package:derpy/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/font_weight_helper.dart';

class ProfileItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;
  const ProfileItem({super.key, required this.iconPath, required this.label,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.secondary),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/$iconPath.svg',
              width: 24.w,
              height: 24.h,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                AppColors.greenHover,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.white,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              'assets/icons/arrow-right.svg',
              width: 24.w,
              height: 24.h,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
