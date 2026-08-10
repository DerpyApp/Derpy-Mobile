import 'package:derpy/core/cache/cache_helper.dart';
import 'package:derpy/core/routing/routes.dart';
import 'package:derpy/features/auth/presentation/pages/signup_steps/success_step.dart';
import 'package:flutter/material.dart';

import '../core/cache/cache_keys.dart';
import '../core/routing/route_generator.dart';
import '../core/services/navigation_service.dart';
import '../core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Derpy',
      home: const SuccessStep(),
      navigatorKey: NavigationService.navigatorKey,
      theme: AppTheme.lightTheme,
      initialRoute: CacheHelper.getBool(key: CacheKeys.onboardingSeen)
          ? Routes.welcome
          : Routes.onboarding,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
