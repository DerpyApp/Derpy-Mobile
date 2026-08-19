import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

import '../../../../core/theme/app_text_styles.dart';
import 'clubs_near_item.dart';

class ClubsNearList extends StatelessWidget {
  Axis scrollDirection;
  double? height;
  double? padding;
  bool title;
  bool sizedBox;
  ClubsNearList({
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.height,
    this.padding,
    this.title = true,
    this.sizedBox = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding ?? 16),
      child: Column(
        crossAxisAlignment: .start,
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
          SizedBox(
            height: height ?? 185,
            child: ListView.separated(
              scrollDirection: scrollDirection,
              itemBuilder: (_, index) => const ClubsNearItem(),
              separatorBuilder: (_, _) => SizedBox(width: sizedBox ? 10 : 0, height: sizedBox ? 0 : 10),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
