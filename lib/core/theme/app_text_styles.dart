import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_weight_helper.dart';

class AppTextStyles {
  AppTextStyles._();

  // Display
  static TextStyle displayLarge = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle displayMedium = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle displaySmall = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );

  // Headings
  static TextStyle headlineLarge = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle headlineMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle headlineSmall = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  // Title
  static TextStyle titleLarge = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle titleMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle titleSmall = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
  );

  // Body
  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );

  // Label
  static TextStyle labelLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle labelMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle labelSmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );
}
