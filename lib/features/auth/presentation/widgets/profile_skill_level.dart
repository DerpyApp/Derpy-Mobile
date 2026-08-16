import 'package:derpy/features/auth/presentation/widgets/skill_level_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/signup_cubit.dart';

class ProfileSkillLevel extends StatelessWidget {
  const ProfileSkillLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/skill_level.svg',
              width: 24,
              height: 24,
              fit: .scaleDown,
            ),
            SizedBox(width: 8.w),
            Text(
              'SKILL LEVEL',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.greenHover,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return SkillLevelSelector(
              selectedLevel: state.skillLevel ?? 2,
              onChanged: (level) {
                context.read<SignupCubit>().setSkillLevel(level);
              },
            );
          },
        ),
      ],
    );
  }
}
