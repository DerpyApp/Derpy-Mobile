import 'package:derpy/core/theme/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class YourCitySelector extends StatefulWidget {
  final String? selectedCity;
  final ValueChanged<String> onChanged;
  const YourCitySelector({
    super.key,
    required this.selectedCity,
    required this.onChanged,
  });

  @override
  State<YourCitySelector> createState() => _YourCitySelectorState();
}

class _YourCitySelectorState extends State<YourCitySelector> {
  final List<String> cities = [
    'Cairo',
    'New Cairo',
    'Sheikh Zayed',
    'Maadi',
    'North Coast',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.secondary, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose the city you live in',
            style: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: cities.map((city) {
              final isSelected = widget.selectedCity == city;
              return GestureDetector(
                onTap: () {
                  widget.onChanged(city);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.greenHover
                          : AppColors.secondary,
                    ),
                  ),
                  child: Text(
                    city,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: isSelected
                          ? AppColors.greenHover
                          : AppColors.secondary,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
