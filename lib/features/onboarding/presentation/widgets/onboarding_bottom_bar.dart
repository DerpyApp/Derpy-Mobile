import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/datasource/onboarding_data.dart';

class OnboardingBottomBar extends StatelessWidget {
  final VoidCallback onNext;
  final PageController pageController;
  const OnboardingBottomBar({
    super.key,
    required this.onNext,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmoothPageIndicator(
          controller: pageController,
          count: OnboardingData.pages.length,
          effect: ScaleEffect(
            scale: 1,
            dotWidth: 40.w,
            dotHeight: 8.h,
            spacing: 10.w,
            radius: 6.r,
            activeDotColor: AppColors.greenHover,
            dotColor: AppColors.white,
          ),
        ),
        const Spacer(),
        FloatingActionButton(
          onPressed: onNext,
          child: SvgPicture.asset(
            'assets/icons/arrow-right.svg',
            height: 24.w,
            width: 24.w,
            fit: .scaleDown,
          ),
        ),
      ],
    );
  }
}
