import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/model/day_model.dart';

class DayItem extends StatelessWidget {
  final DayModel day;
  final bool isSelected;

  const DayItem({super.key, required this.day, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.greenHover : AppColors.primary,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isSelected ? AppColors.greenHover : AppColors.secondary,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day.day,
            style: AppTextStyles.bodyMedium.copyWith(
              color: isSelected ? AppColors.primary : AppColors.white,
            ),
          ),
          Text(
            day.date,
            style: AppTextStyles.titleLarge.copyWith(
              color: isSelected ? AppColors.primary : AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
