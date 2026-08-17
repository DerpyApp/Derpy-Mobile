import 'package:derpy/core/routing/routes.dart';
import 'package:derpy/core/services/navigation_service.dart';
import 'package:derpy/features/auth/presentation/widgets/sign_in_widgets/signIn_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/app_validator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../cubit/verify_otp_cubit.dart';
import '../../widgets/sign_in_widgets/otp_info.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyOtpCubit()..startTimer(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SignInHeader(
                      headline: 'OTP Verification',
                      title: 'Verify Your Account',
                      description:
                          'Enter the 5-digit code we sent to your email or phone number.',
                      icon: 'otp',
                    ),
                    const SizedBox(height: 16),
                    Form(
                      key: formKey,
                      child: OtpInfo(
                        onOtpChanged: (value) {
                          otp = value;
                        },
                        onVerify: () {
                          final error = AppValidator.otp(otp);
                          if (error != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                          context.read<VerifyOtpCubit>().setOtp(otp);
                          NavigationService.pushNamed(Routes.resetPassword);
                        },
                      ),
                    ),
                    Spacer(),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.white,
                        ),
                        children: [
                          const TextSpan(
                            text: 'By continuing, you agree to our\n',
                          ),
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
        },
      ),
    );
  }
}
