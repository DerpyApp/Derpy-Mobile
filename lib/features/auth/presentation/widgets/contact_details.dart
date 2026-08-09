import 'package:derpy/core/theme/app_radius.dart';
import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:derpy/core/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../core/helpers/app_validator.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubit/signup_cubit.dart';
import 'gender_selector.dart';

class ContactDetails extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const ContactDetails({super.key, required this.formKey});

  @override
  State<ContactDetails> createState() => ContactDetailsState();
}

class ContactDetailsState extends State<ContactDetails> {
  late PhoneController phoneNumberController;
  final TextEditingController emailController = TextEditingController();
  bool phoneError = false;

  bool? validate() {
    final isPhoneValid = phoneNumberController.value?.nsn.isNotEmpty;
    setState(() {
      phoneError = !isPhoneValid!;
    });
    return isPhoneValid;
  }

  @override
  void initState() {
    super.initState();
    phoneNumberController = PhoneController(
      PhoneNumber(isoCode: 'EG', nsn: ''),
    );
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              'CONTACT DETAILS',
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
            border: Border.all(color: AppColors.white),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phone Number',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
                SizedBox(height: 8.h),
                Theme(
                  data: Theme.of(context).copyWith(
                    textTheme: Theme.of(context).textTheme.copyWith(
                      bodyLarge: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  child: PhoneFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: phoneNumberController,
                    autofocus: false,
                    selectorNavigator: const BottomSheetNavigator(),
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.white.withOpacity(0.7),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        borderSide: BorderSide(
                          color: phoneError ? AppColors.error : AppColors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        borderSide: BorderSide(
                          color: phoneError
                              ? AppColors.error
                              : AppColors.greenHover,
                        ),
                      ),
                    ),
                    onChanged: (phone) {
                      if (phoneError && phone!.nsn.isNotEmpty) {
                        setState(() {
                          phoneError = false;
                        });
                      }
                    },
                  ),
                ),
                if (phoneError)
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, left: 16.w),
                    child: Text(
                      'Phone Number is required',
                      style: TextStyle(color: AppColors.error, fontSize: 12.sp),
                    ),
                  ),
                SizedBox(height: 16.h),
                Text(
                  'Email Address',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
                SizedBox(height: 8.h),
                DefaultTextFormField(
                  validator: AppValidator.email,
                  hintText: 'Enter your email address',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
