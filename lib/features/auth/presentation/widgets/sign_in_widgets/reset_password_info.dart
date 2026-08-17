import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_validator.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/services/navigation_service.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/font_weight_helper.dart';
import '../../../../../core/widgets/default_elevated_button.dart';
import '../../../../../core/widgets/default_text_form_field.dart';

class ResetPasswordInfo extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const ResetPasswordInfo({super.key, required this.formKey});

  @override
  State<ResetPasswordInfo> createState() => _ResetPasswordInfoState();
}

class _ResetPasswordInfoState extends State<ResetPasswordInfo> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
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
              'Password',
              style: AppTextStyles.labelMedium.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 8),
            DefaultTextFormField(
              controller: passwordController,
              hintText: 'x234df51sa561d',
              isPassword: true,
              validator: AppValidator.password,
              textInputAction: TextInputAction.next,

            ),
            const SizedBox(height: 16),
            Text(
              'Confirm Password',
              style: AppTextStyles.labelMedium.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 8),
            DefaultTextFormField(
              controller: confirmPasswordController,
              hintText: 'x234df51sa561d',
              isPassword: true,
              validator: AppValidator.password,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 16),
            DefaultElevatedButton(
              onPressed: () {
                if (widget.formKey.currentState!.validate()) {
                  NavigationService.pushNamed(Routes.signIn);
                }
              },
              label: 'Reset Password',
            ),
          ],
        ),
      ),
    );
  }
}
