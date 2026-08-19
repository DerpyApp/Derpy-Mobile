import 'package:derpy/core/routing/routes.dart';
import 'package:flutter/material.dart';
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
      navigatorKey: NavigationService.navigatorKey,
      theme: AppTheme.lightTheme,
      initialRoute: Routes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
      builder: (context, child) {
        return MediaQuery.withClampedTextScaling(
          minScaleFactor: 0.9,
          maxScaleFactor: 1.2,
          child: child!,
        );
      },
    );
  }
}
