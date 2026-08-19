import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/font_weight_helper.dart';

class BadgeItem extends StatelessWidget {
  const BadgeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/badge.png', height: 400, width: 300),
        Positioned(
          top: 70,
          left: 50,
          child: Text(
            '88',
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.primary,
              fontSize: 48,
              fontFamily: 'Oswald',
              fontWeight: FontWeightHelper.medium,
            ),
          ),
        ),
        Positioned(
          top: 120,
          left: 50,
          child: Text(
            'ST',
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.primary,
              fontSize: 48,
              fontFamily: 'Oswald',
              fontWeight: FontWeightHelper.regular,
            ),
          ),
        ),
        Positioned(
          top: 185,
          left: 55,
          child: Container(width: 30, height: 1.5, color: AppColors.primary),
        ),
        Positioned(
          top: 195,
          left: 55,
          child: Image.asset('assets/images/chel.png'),
        ),
        Positioned(
          top: 40,
          right: 10,
          child: Image.asset(
            'assets/images/player_photo.png',
            height: 200,
            width: 200,
          ),
        ),
        Positioned(
          top: 270,
          left: 55,
          child: Text('Abdelrahman Muharram', style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.primary,
            fontSize: 20,
            fontFamily: 'Oswald',
            fontWeight: FontWeightHelper.medium,
          )),
        )
      ],
    );
  }
}
