import 'package:derpy/core/theme/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class PositionSelector extends StatefulWidget {
  final String? selectedPosition;
  final ValueChanged<String> onChanged;
  const PositionSelector({
    super.key,
    required this.selectedPosition,
    required this.onChanged,
  });

  @override
  State<PositionSelector> createState() => _PositionSelectorState();
}

class _PositionSelectorState extends State<PositionSelector> {
  final List<String> positions = [
    'Goalkeeper',
    'Defender',
    'Midfielder',
    'Winger',
    'Forward',
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
            'Tab the role that fits you well on the pitch',
            style: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: positions.map((position) {
              final isSelected = widget.selectedPosition == position;
              return GestureDetector(
                onTap: () {
                  widget.onChanged(position);
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
                    position,
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
