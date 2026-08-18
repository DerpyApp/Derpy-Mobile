import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.greenHover.withValues(alpha: .28),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/location.svg',
            width: 24,
            height: 24,
            fit: .scaleDown,
          ),
          const SizedBox(width: 4),
          Text(
            'Cairo',
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.white,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.white),
        ],
      ),
    );
  }
}
