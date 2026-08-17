import 'package:derpy/core/helpers/app_validator.dart';
import 'package:derpy/core/services/navigation_service.dart';
import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:derpy/core/widgets/default_elevated_button.dart';
import 'package:derpy/core/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';

class SignInInfo extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const SignInInfo({super.key , required this.formKey});

  @override
  State<SignInInfo> createState() => _SignInInfoState();
}

class _SignInInfoState extends State<SignInInfo> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              'UserName or Email',
              style: AppTextStyles.labelMedium.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 8),
            DefaultTextFormField(
              controller: emailController,
              hintText: 'email or username',
              validator: AppValidator.required,
            ),
            const SizedBox(height: 16),
            Text(
              'Password',
              style: AppTextStyles.labelMedium.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 8),
            DefaultTextFormField(
              controller: passwordController,
              hintText: 'password',
              isPassword: true,
              validator: AppValidator.password,
            ),
            Align(
              alignment: .centerRight,
              child: TextButton(
                onPressed: () {
                  NavigationService.pushNamed(Routes.forgotPassword);
                },
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.greenHover,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.greenHover,
                    decorationThickness: 1.5,
                  ),
                ),
              ),
            ),
            DefaultElevatedButton(onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                NavigationService.pushNamed(Routes.home);
              }
            }, label: 'Sign in'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: Divider(color: AppColors.secondary)),
                const SizedBox(width: 8),
                Text(
                  'or',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(child: Divider(color: AppColors.secondary)),
              ],
            ),
            const SizedBox(height: 16),
            DefaultElevatedButton(
              onPressed: () {
                NavigationService.pushNamed(Routes.signUp);
              },
              label: 'Create Account',
              backgroundColor: AppColors.primaryGreen.withAlpha(50),
              foregroundColor: AppColors.white,
              borderColor: AppColors.primaryGreen,
            ),
          ],
        ),
      ),
    );
  }
}
