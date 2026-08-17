import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'محرم لسه معملش الصفحه دي اصبر شويه',
          style: AppTextStyles.headlineLarge.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
