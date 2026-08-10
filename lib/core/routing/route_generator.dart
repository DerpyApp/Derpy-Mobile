import 'package:derpy/core/routing/routes.dart';
import 'package:derpy/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/home/presentation/pages/home_tap.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/onboarding/presentation/pages/welcome_page.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeTap());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
