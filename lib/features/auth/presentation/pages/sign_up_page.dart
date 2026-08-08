import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../onboarding/presentation/widgets/personal_info.dart';
import '../../../onboarding/presentation/widgets/registration_step_indicator.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/derpy.png'),
              SizedBox(height: 21.w),
              RegistrationStepIndicator(currentStep: 1,),
              SizedBox(height: 35.w),
              PersonalInfo(),
            ],
          ),
        ),
      ),
    );
  }
}