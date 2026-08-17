import 'package:derpy/core/helpers/app_validator.dart';
import 'package:derpy/core/services/navigation_service.dart';
import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:derpy/core/widgets/default_elevated_button.dart';
import 'package:derpy/core/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';

class ForgotPasswordInfo extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const ForgotPasswordInfo({super.key, required this.formKey});

  @override
  State<ForgotPasswordInfo> createState() => _ForgotPasswordInfoState();
}

class _ForgotPasswordInfoState extends State<ForgotPasswordInfo> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 34),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondary),
        borderRadius: BorderRadius.circular(21),
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Email',
              style: AppTextStyles.labelMedium.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 8),
            DefaultTextFormField(
              controller: emailController,
              hintText: 'Enter your email address',
              validator: AppValidator.email,
            ),
            const SizedBox(height: 16),
            DefaultElevatedButton(
              onPressed: () {
                if (widget.formKey.currentState!.validate()) {
                  NavigationService.pushNamed(Routes.otpVerification);
                }
              },
              label: 'Send Code',
            ),
            const SizedBox(height: 16),
            Text(
              'Tip: check Spam/junk if you don’t see the email',
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.lightGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
