import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/font_weight_helper.dart';
import '../../data/model/tournament_model.dart';

class TournamentItem extends StatelessWidget {
  final TournamentModel tournament;
  const TournamentItem({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 354.w,
      height: 317.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: AppColors.secondary, width: 1),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
              child: SizedBox(
                height: 150.h,
                child: Image.asset(
                  tournament.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 25.h,
            left: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.sports_soccer,
                    color: AppColors.primaryGreen,
                    size: 24.sp,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    tournament.sport,
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
            top: 25.h,
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
                  SizedBox(width: 5.w),
                  Text(
                    tournament.rating.toString(),
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
            bottom: 125.h,
            left: 13.w,
            child: Text(
              tournament.name,
              style: AppTextStyles.titleLarge.copyWith(
                color: AppColors.white,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
          ),
          Positioned(
            bottom: 100.h,
            left: 13.w,
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.lightGray,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  '${tournament.startDate} - ${tournament.endDate}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 75.h,
            left: 13.w,
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.lightGray,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  tournament.location,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50.h,
            left: 13.w,
            child: Row(
              children: [
                Icon(
                  Icons.people_alt_outlined,
                  color: AppColors.lightGray,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  '${tournament.registeredTeams}/${tournament.totalTeams} Registered',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 13.w,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'PRIZE: ',
                    style: AppTextStyles.titleLarge.copyWith(
                      color: AppColors.lightGray,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  TextSpan(
                    text: tournament.prize.toString(),
                    style: AppTextStyles.titleLarge.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            right: 13.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                'View Details',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
