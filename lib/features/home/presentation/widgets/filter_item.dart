import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/features/home/presentation/widgets/price_list.dart';
import 'package:derpy/features/home/presentation/widgets/start_time_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';
import 'filter_list.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
      child: Container(
        padding: EdgeInsets.only(top: 50, left: 16, right: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
          color: AppColors.primary,
          border: Border(
            top: BorderSide(color: AppColors.primaryGreen, width: 2),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Refine search',
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'DAY',
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 60.h, child: const FilterList()),
              SizedBox(height: 10.h),
              Text(
                'START TIME',
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 227.h, child: StartTimeList()),
              SizedBox(height: 10.h),
              Text(
                'MAXIMUM PRICE',
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 35.h, child: PriceList()),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
