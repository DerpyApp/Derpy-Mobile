import 'package:derpy/features/auth/presentation/widgets/sign_in_widgets/signIn_header.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../widgets/sign_in_widgets/forgot_password_info.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              SignInHeader(
                headline: 'Forgot Password — Email',
                title: 'Forgot Password?',
                description:
                    'Enter your email address and well send you a verification code to reset your password.',
                icon: 'key',
              ),
              const SizedBox(height: 16),
              ForgotPasswordInfo(
                formKey: formKey,
              ),
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
