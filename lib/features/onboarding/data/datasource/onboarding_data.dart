import '../models/onboarding_model.dart';

class OnboardingData {
  OnboardingData._();

  static const List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/images/onboarding_1.jpg',
      firstTitle: 'Book\nYour\n',
      highlightedTitle: 'Court',
      lastTitle: ' in\nSeconds',
      description:
          'clubs, check real-time availability, and reserve your court anytime with a few simple taps.',
      descriptionHover: 'Find nearby padel ',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding_2.jpg',
      firstTitle: 'Find the\nPerfect\n',
      highlightedTitle: 'Teammates',
      lastTitle: '',
      description:
      'who match your skill level using smart matchmaking and enjoy better games every time.',
      descriptionHover: 'Connect with players ',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding_3.jpg',
      firstTitle: 'Play,\n',
      highlightedTitle: 'Compete\n& Grow',
      lastTitle: '',
      description: 'split payments with friends, receive match reminders, and track your playing journey in one place.',
      descriptionHover: 'Join tournaments, ',

    ),
  ];
}
