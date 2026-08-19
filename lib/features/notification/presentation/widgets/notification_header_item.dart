import 'package:derpy/core/services/navigation_service.dart';
import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_text_styles.dart';

class NotificationHeaderItem extends StatelessWidget {
  const NotificationHeaderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80.h,
      child: Stack(
        children: [
          Positioned(
            left: 24,
            child: GestureDetector(
              onTap: () {
                NavigationService.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.secondary),
                ),
                child: SvgPicture.asset(
                  'assets/icons/arrow-left.svg',
                  width: 24,
                  height: 24,
                  fit: .scaleDown,
                ),
              ),
            ),
          ),
          Positioned(
            left: 137,
            top: 8,
            child: Text(
              'Notification',
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.white,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
