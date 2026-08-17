import 'package:derpy/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:derpy/features/auth/presentation/widgets/sign_up_widgets/your_city_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class YourCity extends StatelessWidget {
  const YourCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/position.svg',
              width: 24,
              height: 24,
              fit: .scaleDown,
            ),
            SizedBox(width: 8.w),
            Text(
              'YOUR CITY',
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
            return YourCitySelector(
              selectedCity: state.city ?? 'Cairo',
              onChanged: (city) {
                context.read<SignupCubit>().setCity(city);
              },
            );
          },
        ),
      ],
    );
  }
}