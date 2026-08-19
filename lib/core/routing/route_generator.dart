import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/sign_in/forgot_password.dart';
import '../../features/auth/presentation/pages/sign_in/otp_verification.dart';
import '../../features/auth/presentation/pages/sign_in/privacy_policy.dart';
import '../../features/auth/presentation/pages/sign_in/reset_password.dart';
import '../../features/auth/presentation/pages/sign_in/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up/sign_up_page.dart';
import '../../features/home/presentation/pages/home_tap.dart';
import '../../features/notification/presentation/pages/notification_tab.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/onboarding/presentation/pages/welcome_page.dart';
import '../routing/routes.dart';
import '../theme/app_colors.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> _route(Widget page, {bool slideFromRight = false}) {
    return PageRouteBuilder(
      opaque: true,
      pageBuilder: (context, animation, secondaryAnimation) {
        return ColoredBox(color: AppColors.primary, child: page);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (slideFromRight) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                ),
            child: child,
          );
        }
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return _route(const OnboardingPage());
      case Routes.welcome:
        return _route(const WelcomePage());
      case Routes.signUp:
        return _route(const SignupPage());
      case Routes.signIn:
        return _route(const SignInPage());
      case Routes.forgotPassword:
        return _route(const ForgotPassword());
      case Routes.otpVerification:
        return _route(const OTPVerification());
      case Routes.resetPassword:
        return _route(const ResetPassword());
      case Routes.privacyPolicy:
        return _route(const PrivacyPolicy(), slideFromRight: true);
      case Routes.home:
        return _route(const HomeTap());
      case Routes.notification:
        return _route(const NotificationTab(), slideFromRight: true);
      default:
        return _route(
          const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
