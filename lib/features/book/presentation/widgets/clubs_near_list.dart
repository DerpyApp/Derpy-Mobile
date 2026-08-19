import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../home/data/model/club_model.dart';
import 'clubs_near_item.dart';

class ClubsNearList extends StatelessWidget {
  final Axis scrollDirection;
  final double? height;
  final double? padding;
  final bool title;
  final bool sizedBox;
  final List<ClubModel> clubs;

  const ClubsNearList({
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.height,
    this.padding,
    this.title = true,
    this.sizedBox = true,
    required this.clubs,
  });

  @override
  Widget build(BuildContext context) {
    final bool isVertical = scrollDirection == Axis.vertical;
    return Padding(
      padding: EdgeInsets.only(left: padding ?? 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title)
            Text(
              'Clubs Near You',
              style: AppTextStyles.titleSmall.copyWith(
                color: AppColors.white,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
          if (title) const SizedBox(height: 8),
          if (isVertical)
            Expanded(
              child: clubs.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: .center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 40,
                            color: AppColors.greenHover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'No clubs found',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Try searching with another name or sport.',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.lightGray,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        return ClubsNearItem(club: clubs[index]);
                      },
                      separatorBuilder: (_, _) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: clubs.length,
                    ),
            )
          else
            SizedBox(
              height: height ?? 185,
              child: clubs.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: .center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 40,
                            color: AppColors.greenHover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'No clubs found',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Try searching with another name or sport.',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.lightGray,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return ClubsNearItem(club: clubs[index]);
                      },
                      separatorBuilder: (_, _) {
                        return SizedBox(width: sizedBox ? 10 : 0);
                      },
                      itemCount: clubs.length,
                    ),
            ),
        ],
      ),
    );
  }
}
