import 'package:derpy/core/theme/app_radius.dart';
import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:derpy/core/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../../../core/helpers/app_validator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../cubit/signup_cubit.dart';
import 'gender_selector.dart';

class PersonalInfo extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PersonalInfo({super.key, required this.formKey});

  @override
  State<PersonalInfo> createState() => PersonalInfoState();
}

class PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<SignupCubit>().state;
    firstNameController.text = state.firstName;
    lastNameController.text = state.lastName;
    usernameController.text = state.username;
    dateController.text = state.dateOfBirth;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    dateController.dispose();
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
              'PERSONAL INFO',
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        DefaultTextFormField(
                          controller: firstNameController,
                          validator: AppValidator.required,
                          hintText: 'First Name',
                          textInputAction: TextInputAction.next,
                          onChange: (value) {
                           context.read<SignupCubit>().setFirstName(value);
                          }
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        DefaultTextFormField(
                          controller: lastNameController,
                          validator: AppValidator.required,
                          hintText: 'Last Name',
                          textInputAction: TextInputAction.next,
                          onChange: (value) {
                           context.read<SignupCubit>().setLastName(value);
                          }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'UserName',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              SizedBox(height: 8.h),
              DefaultTextFormField(
                controller: usernameController,
                validator: AppValidator.required,
                hintText: 'UserName',
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  context.read<SignupCubit>().setUsername(value);
                },
              ),
              SizedBox(height: 16.h),
              Text(
                'Date of Birth',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              SizedBox(height: 8.h),
              DefaultTextFormField(
                validator: AppValidator.required,
                hintText: 'Date of Birth',
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    context: context,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                    initialDate: DateTime(2003),
                  );
                  if (date != null) {
                    final formattedDate = DateFormat('dd MMMM yyyy').format(date);
                    dateController.text = formattedDate;
                    context.read<SignupCubit>().setDateOfBirth(formattedDate);
                  }
                },
              ),
              SizedBox(height: 16.h),
              Text(
                'Gender',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              SizedBox(height: 8.h),
                BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {
                    return GenderSelector(
                      gender: state.gender,
                      onChanged: (gender) {
                        context.read<SignupCubit>().setGender(gender);
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
