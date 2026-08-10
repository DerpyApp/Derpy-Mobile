part of 'signup_cubit.dart';

enum Gender { male, female }

class SignupState {
  final int currentStep;
  final Gender? gender;
  const SignupState({this.currentStep = 0, this.gender = Gender.male});

  SignupState copyWith({int? currentStep, Gender? gender}) {
    return SignupState(
      currentStep: currentStep ?? this.currentStep,
      gender: gender ?? this.gender,
    );
  }
}
