import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:derpy/features/auth/presentation/widgets/sign_in_widgets/signIn_header.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/font_weight_helper.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                SignInHeader(
                  headline: 'DERPY PRIVACY & POLICY',
                  title: 'Play smarter Book faster',
                  description: 'Last Updated: October 24, 2026',
                  icon: 'derpy',
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      '01',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.greenHover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Information Collection',
                      style: AppTextStyles.displaySmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'When you use Derby Sports, we collect information that helps us provide a premium booking experience.\nThe types of personal information we collect include: Contact Information: Your full name, email address, and phone number.',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Account Data: Credentials used to access the ecosystem.\nTransaction Data: Your booking history, preferred venues, and payment status processed securely by third-party providers.',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '02',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.greenHover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Use of Information',
                      style: AppTextStyles.displaySmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'The data we collect is utilized strictly to elevate your athletic experience and ensure platform efficiency.\nWe use your information to: Process and manage your venue reservations seamlessly.\nCommunicate booking confirmations, cancellations, and real-time updates.\nAnalyze usage patterns to improve platform design and service offerings.',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '03',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.greenHover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Data Protection',
                      style: AppTextStyles.displaySmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'We employ industry-standard security protocols to protect your personal information against unauthorized access, alteration, disclosure, or destruction. All sensitive data exchanged between your device and our ecosystem is encrypted using Secure Socket Layer (SSL) technology and stored within secure,\naccess-controlled environments.',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '04',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.greenHover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Third-Party Sharing',
                      style: AppTextStyles.displaySmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Derby Sports operates on a strict need-to-know basis. We do not sell your personal data. We only share necessary information with our trusted facility partners strictly for the purpose of booking fulfillment, venue access verification, and ensuring a smooth arrival experience at the pitch.',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '05',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.greenHover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'User Rights',
                      style: AppTextStyles.displaySmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'You retain full control over your digital footprint within our ecosystem. You have the right to request access to the personal data we hold about you, request corrections to any inaccuracies, and request the permanent deletion of your account and associated data history, subject to legal retention requirements.',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
