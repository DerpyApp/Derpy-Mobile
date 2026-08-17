import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radius.dart';
import '../../../../../core/theme/app_text_styles.dart';

class FavoritesSelector extends StatelessWidget {
  final Set<String> selectedSports;
  final ValueChanged<String> onChanged;

  const FavoritesSelector({
    super.key,
    required this.selectedSports,
    required this.onChanged,
  });

  final List<Map<String, String>> sports = const [
    {
      'name': 'Football',
      'icon': 'assets/icons/football.svg',
    },
    {
      'name': 'Paddle',
      'icon': 'assets/icons/paddle.svg',
    },
  ];

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
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sports.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 28.w,
              mainAxisSpacing: 28.h,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final sport = sports[index];
              final name = sport['name']!;
              final icon = sport['icon']!;
              final isSelected = selectedSports.contains(name);
              return GestureDetector(
                onTap: () {
                  onChanged(name);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.greenHover
                          : AppColors.secondary,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        icon,
                        width: 48.w,
                        height: 48.w,
                        colorFilter: ColorFilter.mode(
                          isSelected
                              ? AppColors.greenHover
                              : AppColors.secondary,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        name,
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}