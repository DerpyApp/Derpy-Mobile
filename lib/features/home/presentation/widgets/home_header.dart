import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_text_styles.dart';
import 'location_item.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo.png', width: 76),
              Spacer(),
              LocationItem(),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withValues(alpha: .28),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  width: 24,
                  height: 24,
                  fit: .scaleDown,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: .start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'Good ',
                          style: TextStyle(fontWeight: FontWeightHelper.bold),
                        ),
                        TextSpan(
                          text: 'Morning ,',
                          style: TextStyle(
                            fontWeight: FontWeightHelper.bold,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Abdelrahman Muharram',
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withValues(alpha: .28),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  'assets/icons/notification.svg',
                  width: 24,
                  height: 24,
                  fit: .scaleDown,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
