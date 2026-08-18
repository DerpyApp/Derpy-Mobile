import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

import '../../../../core/theme/app_text_styles.dart';
import 'clubs_near_item.dart';

class ClubsNearList extends StatelessWidget {
  Axis scrollDirection;
  ClubsNearList({super.key, this.scrollDirection = Axis.horizontal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Clubs Near You',
            style: AppTextStyles.titleSmall.copyWith(
              color: AppColors.white,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 185,
            child: ListView.separated(
              scrollDirection: scrollDirection,
              itemBuilder: (_, index) => const ClubsNearItem(),
              separatorBuilder: (_, _) => SizedBox(width: 10),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
