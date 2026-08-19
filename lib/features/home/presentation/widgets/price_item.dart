import 'package:derpy/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/font_weight_helper.dart';
import '../../data/price_model.dart';

class PriceItem extends StatelessWidget {
  final PriceModel price;
  final bool isSelected;

  const PriceItem({super.key, required this.price, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? AppColors.greenHover : AppColors.primary,
        border: Border.all(color: AppColors.secondary),
      ),
      child: Text(
        price.text,
        style: AppTextStyles.titleSmall.copyWith(
          color: isSelected ? AppColors.primary : AppColors.white,
          fontWeight: isSelected
              ? FontWeightHelper.bold
              : FontWeightHelper.semiBold,
        ),
      ),
    );
  }
}
