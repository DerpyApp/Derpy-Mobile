import 'package:derpy/core/routing/routes.dart';
import 'package:derpy/core/services/navigation_service.dart';
import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:derpy/core/widgets/default_elevated_button.dart';
import 'package:derpy/features/auth/presentation/widgets/profile_favorites.dart';
import 'package:derpy/features/auth/presentation/widgets/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../widgets/profile_position.dart';
import '../../widgets/profile_skill_level.dart';
import '../../widgets/your_city.dart';

class SuccessStep extends StatelessWidget {
  const SuccessStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Back',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.greenHover,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.greenHover,
                          ),
                        ),
                      ),
                    ),
                    Image.asset('assets/images/derpy.png', width: 60.w),
                  ],
                ),
                SizedBox(height: 24.h),
                ProfileSetup(),
                SizedBox(height: 16.h),
                ProfilePosition(),
                SizedBox(height: 16.h),
                ProfileSkillLevel(),
                SizedBox(height: 16.h),
                YourCity(),
                SizedBox(height: 16.h),
                ProfileFavorites(),
                SizedBox(height: 24.h),
                DefaultElevatedButton(
                  onPressed: () {
                    NavigationService.pushNamed(Routes.home);
                  },
                  label: 'Finish',
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
