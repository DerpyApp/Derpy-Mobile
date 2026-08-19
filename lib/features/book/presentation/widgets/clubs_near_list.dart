import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'clubs_near_item.dart';

class ClubsNearList extends StatelessWidget {
  final Axis scrollDirection;
  final double? height;
  final double? padding;
  final bool title;
  final bool sizedBox;

  const ClubsNearList({
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.height,
    this.padding,
    this.title = true,
    this.sizedBox = true,
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
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return const ClubsNearItem();
                },
                separatorBuilder: (_, _) {
                  return const SizedBox(height: 10);
                },
                itemCount: 10,
              ),
            )
          else
            SizedBox(
              height: height ?? 185,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return const ClubsNearItem();
                },
                separatorBuilder: (_, _) {
                  return SizedBox(width: sizedBox ? 10 : 0);
                },
                itemCount: 10,
              ),
            ),
        ],
      ),
    );
  }
}
