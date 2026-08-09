import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_durations.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  void onStepChanged(int index) {
    emit(state.copyWith(currentStep: index));
  }

  void onNextStep(PageController controller, int stepsCount) {
    if (state.currentStep < stepsCount - 1) {
      controller.nextPage(
        duration: AppDurations.medium,
        curve: Curves.easeInOut,
      );
    }
  }

  void previousStep(PageController controller) {
    if (state.currentStep > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool isLastStep(int stepsCount) {
    return state.currentStep == stepsCount - 1;
  }

  void setGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }
}
