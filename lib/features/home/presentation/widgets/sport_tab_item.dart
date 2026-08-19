import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/font_weight_helper.dart';

class SportTabItem extends StatelessWidget {
  final String label;
  final String? iconPath;
  final bool isSelected;

  const SportTabItem({
    super.key,
    required this.label,
    this.iconPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.greenHover : AppColors.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isSelected ? AppColors.greenHover : AppColors.secondary,
        ),
      ),
      child: Row(
        children: [
          if (iconPath != null) ...[
            SvgPicture.asset(
              iconPath!,
              width: 20.w,
              height: 20.h,
              fit: .scaleDown,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primary : AppColors.primaryGreen,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 10.w),
          ],
          Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              color: isSelected ? AppColors.primary : AppColors.white,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ],
      ),
    );
  }
}
