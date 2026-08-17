import 'package:derpy/features/auth/presentation/widgets/sign_in_widgets/signIn_header.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../widgets/sign_in_widgets/reset_password_info.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SignInHeader(
                headline: 'Reset Password',
                title: 'Create New Password',
                description:
                    'Create a strong password to keep your Derpy account secure.',
                icon: 'lock',
              ),
              const SizedBox(height: 20),
              ResetPasswordInfo(formKey: formKey),
              Spacer(),
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
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
