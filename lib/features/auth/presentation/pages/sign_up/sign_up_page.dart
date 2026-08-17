import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/theme/app_durations.dart';
import 'package:derpy/features/auth/presentation/pages/sign_up/signup_steps/contact_details_step.dart';
import 'package:derpy/features/auth/presentation/pages/sign_up/signup_steps/create_password_step.dart';
import 'package:derpy/features/auth/presentation/pages/sign_up/signup_steps/personal_info_step.dart';
import 'package:derpy/features/auth/presentation/pages/sign_up/signup_steps/success_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/widgets/default_elevated_button.dart';
import '../../cubit/signup_cubit.dart';
import '../../widgets/sign_up_widgets/registration_step_indicator.dart';

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
  final GlobalKey<CreatePasswordStepState> createPasswordKey =
      GlobalKey<CreatePasswordStepState>();

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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                if (state.currentStep == 0) {
                                  Navigator.pop(context);
                                } else {
                                  _pageController.previousPage(
                                    duration: AppDurations.medium,
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.secondary),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/arrow-left.svg',
                                  width: 24,
                                  height: 24,
                                  fit: .scaleDown,
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
                        CreatePasswordStep(
                          key: createPasswordKey,
                          pageController: _pageController,
                        ),
                        SuccessStep(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DefaultElevatedButton(
                      onPressed: () {
                        final cubit = context.read<SignupCubit>();
                        final currentStep = cubit.state.currentStep;
                        bool isValid = true;
                        if (currentStep == 0) {
                          isValid =
                              personalInfoKey.currentState?.validate() ?? false;
                        } else if (currentStep == 1) {
                          isValid =
                              contactDetailsKey.currentState?.validate() ??
                              false;
                        } else if (currentStep == 2) {
                          isValid =
                              createPasswordKey.currentState?.validate() ??
                              false;
                        }
                        if (!isValid) return;
                        if (currentStep == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: context.read<SignupCubit>(),
                                child: const SuccessStep(),
                              ),
                            ),
                          );
                          return;
                        }
                        cubit.onNextStep(_pageController, 4);
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
