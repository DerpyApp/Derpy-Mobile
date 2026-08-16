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

  void setFirstName(String firstName) {
    emit(state.copyWith(firstName: firstName));
  }

  void setLastName(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }

  void setUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void setDateOfBirth(String dateOfBirth) {
    emit(state.copyWith(dateOfBirth: dateOfBirth));
  }

  void setPhoneNumber(String phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  void setPhoneIsoCode(String phoneIsoCode) {
    emit(state.copyWith(phoneIsoCode: phoneIsoCode));
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void setConfirmPassword(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void setPosition(String position) {
    emit(state.copyWith(position: position));
  }

  void setSkillLevel(int skillLevel) {
    emit(state.copyWith(skillLevel: skillLevel));
  }

  void setCity(String city) {
    emit(state.copyWith(city: city));
  }

  void toggleFavoriteSport(String sport) {
    final updatedSports = Set<String>.from(state.favoriteSports);
    if (updatedSports.contains(sport)) {
      updatedSports.remove(sport);
    } else {
      updatedSports.add(sport);
    }
    emit(state.copyWith(favoriteSports: updatedSports));
  }
}
