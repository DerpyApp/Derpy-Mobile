import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class BookNowItem extends StatelessWidget {
  const BookNowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/book_now.png'),
        Positioned(
          top: 10,
          left: 10,
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.displayLarge.copyWith(
                color: AppColors.white,
              ),
              children: [
                TextSpan(text: 'Play,'),
                TextSpan(
                  text: 'Compete\n& Grow',
                  style: AppTextStyles.displayLarge.copyWith(
                    color: AppColors.greenHover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 10,
          child: Text(
            'Find your next game, discover nearby \ncourts,and connect with players.',
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.greenHover,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'BOOK NOW',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
