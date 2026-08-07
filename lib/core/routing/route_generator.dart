import 'package:derpy/core/routing/routes.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/onboarding/presentation/pages/welcomepage.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Route Found'),
            ),
          ),
        );
    }
  }
}