import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radius.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SkillLevelSelector extends StatelessWidget {
  final int selectedLevel;
  final ValueChanged<int> onChanged;

  const SkillLevelSelector({
    super.key,
    required this.selectedLevel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(
          color: AppColors.secondary,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SLIDE ACROSS 1-5',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 14.h),
          Center(
            child: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  final level = index + 1;
                  final isSelected = selectedLevel == level;

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onChanged(level);
                        },
                        child: Container(
                          width: 33.w,
                          height: 33.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.greenHover
                                  : AppColors.white,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 17.w,
                              height: 17.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? AppColors.greenHover
                                    : AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (index < 4)
                        SizedBox(
                          width: 33.w,
                          child: Container(
                            height: 3.h,
                            color: AppColors.white,
                          ),
                        ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
