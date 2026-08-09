import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../widgets/contact_details.dart';

class ContactDetailsStep extends StatefulWidget {
  final PageController pageController;
  const ContactDetailsStep({super.key, required this.pageController});

  @override
  State<ContactDetailsStep> createState() => ContactDetailsStepState();
}

class ContactDetailsStepState extends State<ContactDetailsStep> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ContactDetailsState> contactDetailsKey =
      GlobalKey<ContactDetailsState>();

  bool validate() {
    final isFormValid = formKey.currentState?.validate() ?? false;
    final isPhoneValid = contactDetailsKey.currentState?.validate() ?? false;
    return isFormValid && isPhoneValid;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Details',
                style: AppTextStyles.headlineMedium.copyWith(
                  color: AppColors.white,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                'How can we reach you?',
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),

              SizedBox(height: 24.h),

              ContactDetails(key: contactDetailsKey, formKey: formKey),
            ],
          ),
        ),
      ),
    );
  }
}
