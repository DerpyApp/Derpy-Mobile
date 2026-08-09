import 'package:derpy/features/auth/presentation/widgets/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class PersonalInfoStep extends StatefulWidget {
  final PageController pageController;
  const PersonalInfoStep({super.key, required this.pageController});

  @override
  State<PersonalInfoStep> createState() => PersonalInfoStepState();
}

class PersonalInfoStepState extends State<PersonalInfoStep> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Information',
                style: AppTextStyles.headlineMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Tell us about yourself',
                style: AppTextStyles.titleSmall.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 24.h),
              Expanded(child: PersonalInfo(
                formKey: _formKey,
              )),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
