import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/start_time_model.dart';

class StartTimeItem extends StatelessWidget {
  final StartTimeModel time;
  final bool isSelected;

  const StartTimeItem({
    super.key,
    required this.time,
    required this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.greenHover : AppColors.primary,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isSelected ? AppColors.greenHover : AppColors.secondary,
        ),
      ),
      child: Text(
        time.time,
        textAlign: TextAlign.center,
        style: AppTextStyles.titleSmall.copyWith(
          color: isSelected ? AppColors.primary : AppColors.white,
          fontWeight: FontWeightHelper.semiBold,
        ),
      ),
    );
  }
}
