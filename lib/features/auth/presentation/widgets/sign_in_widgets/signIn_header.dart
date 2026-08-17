import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInHeader extends StatelessWidget {
  String headline;
  String title;
  String description;
  String icon;
  bool isBack;
  SignInHeader({
    super.key,
    required this.headline,
    required this.title,
    required this.description,
    required this.icon,
    this.isBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (isBack)
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondary),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  'assets/icons/arrow-left.svg',
                  width: 24,
                  height: 24,
                  fit: .scaleDown,
                ),
              ),
            ),
            Image.asset('assets/images/derpy.png', width: 60.w, height: 47.h),
          ],
        ),
        SizedBox(height: 32.h),
        Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.greenHover.withAlpha(40),
            border: Border.all(color: AppColors.greenHover),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.greenHover.withAlpha(60),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/$icon.svg',
                      width: 24,
                      height: 24,
                      fit: .scaleDown,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    headline,
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
