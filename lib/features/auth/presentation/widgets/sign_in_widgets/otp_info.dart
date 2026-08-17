import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/default_elevated_button.dart';
import '../../cubit/verify_otp_cubit.dart';
import 'otp_code_input.dart';

class OtpInfo extends StatelessWidget {
  const OtpInfo({
    super.key,
    required this.onOtpChanged,
    required this.onVerify,
  });

  final ValueChanged<String> onOtpChanged;
  final VoidCallback onVerify;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 34),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondary),
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Verification Code',
            style: AppTextStyles.labelMedium.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 16),
          OtpCodeInput(onCompleted: onOtpChanged),
          const SizedBox(height: 16),
          DefaultElevatedButton(onPressed: onVerify, label: 'Verify OTP'),
          const SizedBox(height: 16),
          BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.center,
                child: state.canResend
                    ? GestureDetector(
                        onTap: () {
                          context.read<VerifyOtpCubit>().resendOtp();
                        },
                        child: Text(
                          'Resend Code',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.greenHover,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.greenHover,
                            decorationThickness: 1.5,
                          ),
                        ),
                      )
                    : Text(
                        'Resend Code in 00:${state.remainingSeconds.toString().padLeft(2, '0')}',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.white,
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
