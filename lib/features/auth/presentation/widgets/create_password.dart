import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_validator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/font_weight_helper.dart';
import '../../../../core/widgets/default_text_form_field.dart';
import '../cubit/signup_cubit.dart';

class CreatePassword extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const CreatePassword({super.key, required this.formKey});

  @override
  State<CreatePassword> createState() => CreatePasswordState();
}

class CreatePasswordState extends State<CreatePassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<SignupCubit>().state;
    passwordController.text = state.password;
    confirmPasswordController.text = state.confirmPassword;
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/profile.svg',
                  width: 24,
                  height: 24,
                  fit: .scaleDown,
                ),
                SizedBox(width: 8.w),
                Text(
                  'CREATE PASSWORD',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.greenHover,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(24.h),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.xl),
                border: Border.all(color: AppColors.secondary),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  DefaultTextFormField(
                    validator: AppValidator.password,
                    hintText: 'Enter your password',
                    controller: passwordController,
                    isPassword: true,
                    keyboardType: TextInputType.text,
                    onChange: (value) {
                      context.read<SignupCubit>().setPassword(value);
                    }
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Confirm Password',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  DefaultTextFormField(
                    validator: AppValidator.password,
                    hintText: 'Confirm your password',
                    controller: confirmPasswordController,
                    isPassword: true,
                    keyboardType: TextInputType.text,
                    onChange: (value) {
                      context.read<SignupCubit>().setConfirmPassword(value);
                    }
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
