import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/theme/app_durations.dart';
import '../../data/datasource/onboarding_data.dart';
import '../cubit/onboarding_cubit.dart';
import '../widgets/onboarding_bottom_bar.dart';
import '../widgets/onboarding_item.dart';
import '../widgets/onboarding_top_bar.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    context.read<OnboardingCubit>().onPageChanged(index);
                  },
                  itemCount: OnboardingData.pages.length,
                  itemBuilder: (context, index) {
                    return OnboardingItem(model: OnboardingData.pages[index]);
                  },
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 24.h,
                    ),
                    child: Column(
                      children: [
                        OnboardingTopBar(
                          onSkip: () {
                            _pageController.previousPage(
                              duration: AppDurations.medium,
                              curve: Curves.easeInOut,
                            );
                            NavigationService.pushNamed(Routes.welcome);
                          },
                          onBack: () {
                            _pageController.previousPage(
                              duration: AppDurations.medium,
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                        const Spacer(),
                        OnboardingBottomBar(
                          pageController: _pageController,
                          onNext: () {
                            final cubit = context.read<OnboardingCubit>();
                            if (cubit.isLastPage(OnboardingData.pages.length)) {
                              NavigationService.pushNamed(Routes.welcome);
                            } else {
                              cubit.nextPage(
                                _pageController,
                                OnboardingData.pages.length,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
