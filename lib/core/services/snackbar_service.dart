import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'navigation_service.dart';

class SnackBarService {
  SnackBarService._();

  static void showSuccess(String message) {
    _show(message, AppColors.success);
  }

  static void showError(String message) {
    _show(message, AppColors.error);
  }

  static void showInfo(String message) {
    _show(message, AppColors.primary);
  }

  static void _show(String message, Color color) {
    ScaffoldMessenger.of(
      NavigationService.navigatorKey.currentContext!,
    ).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
