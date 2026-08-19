import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../home/data/model/club_model.dart';

class ClubsNearItem extends StatelessWidget {
  final ClubModel club;
  const ClubsNearItem({super.key, required this.club});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 185.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: AppColors.secondary, width: 1.w),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: Image.asset(
                club.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            left: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.sports_soccer,
                    color: AppColors.primaryGreen,
                    size: 25.sp,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    club.sport,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/star.svg',
                    width: 24.w,
                    height: 24.h,
                    fit: .scaleDown,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    club.rating.toString(),
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10.w,
            bottom: 60.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  club.name,
                  style: AppTextStyles.titleSmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
                Text(
                  club.location,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.greenHover,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 57.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25.r),
                ),
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: club.price.toString(),
                          style: AppTextStyles.titleLarge.copyWith(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: club.priceUnit,
                          style: AppTextStyles.titleLarge.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        ),
                        TextSpan(
                          text: club.time,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(6.r),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
