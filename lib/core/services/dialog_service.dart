import 'package:flutter/material.dart';

import 'navigation_service.dart';

class DialogService {
  DialogService._();

  static Future<T?> show<T>({
    required Widget child,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: NavigationService.navigatorKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) => child,
    );
  }

  static void close<T extends Object?>([T? result]) {
    Navigator.of(NavigationService.navigatorKey.currentContext!).pop(result);
  }
}
