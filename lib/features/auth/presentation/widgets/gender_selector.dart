import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_durations.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/signup_cubit.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.gender,
    required this.onChanged,
  });

  final Gender? gender;
  final ValueChanged<Gender> onChanged;

  bool get isMale => gender == Gender.male;
  bool get isFemale => gender == Gender.female;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(Gender.male),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isMale ? AppColors.greenHover : AppColors.secondary,
                ),
                child: Text(
                  'Male',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(Gender.female),
              child: AnimatedContainer(
                duration: AppDurations.normal,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isFemale ? AppColors.greenHover : AppColors.secondary,
                ),
                child: Text(
                  'Female',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
