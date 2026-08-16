import 'package:derpy/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:derpy/features/auth/presentation/widgets/favorites_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProfileFavorites extends StatelessWidget {
  const ProfileFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/profile.svg',
              width: 24,
              height: 24,
              fit: .scaleDown,
            ),
            SizedBox(width: 8.w),
            Text(
              'FAVORITES',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.greenHover,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return FavoritesSelector(
              selectedSports: state.favoriteSports,
              onChanged: (sport) {
                context.read<SignupCubit>().toggleFavoriteSport(sport);
              },
            );
          },
        ),
      ],
    );
  }
}