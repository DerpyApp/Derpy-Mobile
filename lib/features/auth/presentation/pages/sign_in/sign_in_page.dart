import 'package:derpy/core/services/navigation_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../widgets/sign_in_widgets/sign_In_Info.dart';
import '../../widgets/sign_in_widgets/signIn_header.dart';
import '../../widgets/sign_up_widgets/personal_info.dart';
import '../../widgets/sign_up_widgets/registration_step_indicator.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SignInHeader(
                headline: 'WELCOME BACK TO DERPY',
                title: 'Sign in to continue',
                description: 'Play smarter Book faster',
                icon: 'derpy',
                isBack: false,
              ),
              SizedBox(height: 16),
              SignInInfo(formKey: formKey),
              SizedBox(height: 48),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                  ),
                  children: [
                    const TextSpan(text: 'By continuing, you agree to our\n'),
                    const TextSpan(text: 'Terms of Service and '),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                        color: AppColors.greenHover,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.greenHover,
                        decorationThickness: 1.5,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          NavigationService.pushNamed(Routes.privacyPolicy);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
