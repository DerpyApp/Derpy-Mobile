part of 'signup_cubit.dart';

enum Gender { male, female }

class SignupState {
  final int currentStep;
  final String firstName;
  final String lastName;
  final String username;
  final String dateOfBirth;
  final Gender? gender;
  final String phoneNumber;
  final String phoneIsoCode;
  final String email;
  final String password;
  final String confirmPassword;
  final String? position;
  final int? skillLevel;
  final String? city;
  final Set<String> favoriteSports;
  final bool phoneError;


  const SignupState({
    this.currentStep = 0,
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    this.dateOfBirth = '',
    this.phoneNumber = '',
    this.gender = Gender.male,
    this.phoneIsoCode = 'EG',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.position,
    this.skillLevel,
    this.city,
    this.favoriteSports = const {'Football'},
    this.phoneError = false,
  });

  SignupState copyWith({
    int? currentStep,
    String? firstName,
    String? lastName,
    String? username,
    String? dateOfBirth,
    Gender? gender,
    String? phoneNumber,
    String? phoneIsoCode,
    String? email,
    String? password,
    String? confirmPassword,
    String? position,
    final int? skillLevel,
    final String? city,
    final Set<String>? favoriteSports,
    final bool? phoneError,
  }) {
    return SignupState(
      currentStep: currentStep ?? this.currentStep,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneIsoCode: phoneIsoCode ?? this.phoneIsoCode,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      position: position ?? this.position,
      skillLevel: skillLevel ?? this.skillLevel,
      city: city ?? this.city,
      favoriteSports: favoriteSports ?? this.favoriteSports,
      phoneError: phoneError ?? this.phoneError,
    );
  }
}
