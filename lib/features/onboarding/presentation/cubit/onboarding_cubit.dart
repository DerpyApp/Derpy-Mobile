import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_durations.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  void onPageChanged(int index) {
    emit(state.copyWith(currentPage: index));
  }

  void nextPage(PageController controller, int pagesCount) {
    if (!isLastPage(pagesCount)) {
      controller.nextPage(
        duration: AppDurations.medium,
        curve: Curves.easeInOut,
      );
    }
  }

  bool isLastPage(int pagesCount) {
    return state.currentPage == pagesCount - 1;
  }
}
