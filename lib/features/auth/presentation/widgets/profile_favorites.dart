import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'favorites_selector.dart';

class ProfileFavorites extends StatefulWidget {
  const ProfileFavorites({super.key});

  @override
  State<ProfileFavorites> createState() => _ProfileFavoritesState();
}

class _ProfileFavoritesState extends State<ProfileFavorites> {
  Set<String> selectedSports = {'Football'};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/favorite.svg',
              width: 40.w,
              height: 40.w,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(width: 8.w),
            Text(
              'YOUR INTERESTS',
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.greenHover,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        FavoritesSelector(
          selectedSports: selectedSports,
          onChanged: (sport) {
            setState(() {
              if (selectedSports.contains(sport)) {
                selectedSports.remove(sport);
              } else {
                selectedSports.add(sport);
              }
            });
          },
        ),
      ],
    );
  }
}
