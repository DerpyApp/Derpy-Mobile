import 'package:derpy/core/widgets/default_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/welcome_cubit.dart';

class WelcomeItem extends StatelessWidget {
  const WelcomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/welcome_page.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.35)),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/derpy.png'),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome \nto ',
                            style: AppTextStyles.displayLarge.copyWith(
                              fontSize: 64.sp,
                            ),
                          ),
                          TextSpan(
                            text: 'Derpy',
                            style: AppTextStyles.displayLarge.copyWith(
                              fontSize: 64.sp,
                              color: AppColors.greenHover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Book courts, find teammates, and join tournaments—',
                            style: AppTextStyles.headlineSmall.copyWith(
                              color: AppColors.greenHover,
                            ),
                          ),
                          TextSpan(
                            text: 'Derpy',
                            style: AppTextStyles.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34.h),
                    DefaultElevatedButton(
                      onPressed: () {
                        context.read<WelcomeCubit>().signUp();
                      },
                      label: 'Sign up',
                    ),
                    SizedBox(height: 12.h),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          context.read<WelcomeCubit>().signIn();
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.greenHover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
