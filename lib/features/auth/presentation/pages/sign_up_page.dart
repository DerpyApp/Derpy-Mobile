import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/theme/app_durations.dart';
import 'package:derpy/features/auth/presentation/pages/signup_steps/contact_details_step.dart';
import 'package:derpy/features/auth/presentation/pages/signup_steps/create_password_step.dart';
import 'package:derpy/features/auth/presentation/pages/signup_steps/personal_info_step.dart';
import 'package:derpy/features/auth/presentation/pages/signup_steps/success_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/default_elevated_button.dart';
import '../cubit/signup_cubit.dart';
import '../widgets/registration_step_indicator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final PageController _pageController = PageController();
  final GlobalKey<PersonalInfoStepState> personalInfoKey =
      GlobalKey<PersonalInfoStepState>();
  final GlobalKey<ContactDetailsStepState> contactDetailsKey =
      GlobalKey<ContactDetailsStepState>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          if (state.currentStep > 0)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                  _pageController.previousPage(
                                    duration: AppDurations.medium,
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Text(
                                  'Back',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.greenHover,
                                  ),
                                ),
                              ),
                            ),
                          Image.asset('assets/images/derpy.png', width: 60.w),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      return RegistrationStepIndicator(
                        currentStep: state.currentStep + 1,
                        totalSteps: 4,
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        context.read<SignupCubit>().onStepChanged(index);
                      },
                      children: [
                        PersonalInfoStep(
                          key: personalInfoKey,
                          pageController: _pageController,
                        ),
                        ContactDetailsStep(
                          key: contactDetailsKey,
                          pageController: _pageController,
                        ),
                        CreatePasswordStep(pageController: _pageController),
                        SuccessStep(pageController: _pageController),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DefaultElevatedButton(
                      onPressed: () {
                        final cubit = context.read<SignupCubit>();
                        bool isValid = false;
                        switch (cubit.state.currentStep) {
                          case 0:
                            isValid =
                                personalInfoKey.currentState?.validate() ??
                                false;
                            break;
                          case 1:
                            isValid =
                                contactDetailsKey.currentState?.validate() ??
                                false;
                            break;

                          case 2:
                            return;
                        }
                        if (isValid) {
                          cubit.onNextStep(_pageController, 4);
                        }
                      },
                      label: 'Continue',
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
