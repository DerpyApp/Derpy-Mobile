import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_colors.dart';

class CustomBottomNavItem extends StatelessWidget {
  const CustomBottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Container(
              width: 32,
              height: 2,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: AppColors.greenHover,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          if (!isSelected) const SizedBox(height: 7),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.greenHover : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: isSelected ? AppColors.greenHover : AppColors.secondary,
                width: 1,
              ),
            ),
            child: SvgPicture.asset(
              'assets/icons/$icon.svg',
              width: 24,
              height: 24,
              fit: .scaleDown,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.primary
                    : AppColors.primaryGreen.withValues(alpha: .41),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(height: 3),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            style: TextStyle(
              color: isSelected ? AppColors.greenHover : AppColors.secondary,
              fontSize: 10,
              fontWeight: FontWeightHelper.regular,
            ),
            child: Text(label),
          ),
          const SizedBox(height: 3),
        ],
      ),
    );
  }
}
