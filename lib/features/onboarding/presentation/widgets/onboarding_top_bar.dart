import 'package:derpy/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/datasource/onboarding_data.dart';
import '../cubit/onboarding_cubit.dart';

class OnboardingTopBar extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onBack;
  const OnboardingTopBar({
    super.key,
    required this.onSkip,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return SizedBox(
      height: 40.h,
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (state.currentPage > 0)
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: onBack,
                    child: Text(
                      'Back',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.greenHover,
                      ),
                    ),
                  ),
                ),
              Center(
                child: Image.asset('assets/images/derpy.png', height: 36.h),
              ),
              if (!cubit.isLastPage(OnboardingData.pages.length))
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onSkip,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.greenHover,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
