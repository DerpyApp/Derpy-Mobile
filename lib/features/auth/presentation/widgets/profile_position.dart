import 'package:derpy/features/auth/presentation/widgets/position_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProfilePosition extends StatefulWidget {
  const ProfilePosition({super.key});

  @override
  State<ProfilePosition> createState() => _ProfilePositionState();
}

class _ProfilePositionState extends State<ProfilePosition> {
  String selectedPosition = 'Goalkeeper';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/position.svg',
              width: 24,
              height: 24,
              fit: .scaleDown,
            ),
            SizedBox(width: 8.w),
            Text(
              'POSITION',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.greenHover,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        PositionSelector(
          selectedPosition: selectedPosition,
          onChanged: (position) {
            setState(() {
              selectedPosition = position;
            });
          },
        ),
      ],
    );
  }
}
