import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/home/presentation/cubit/location_cubit.dart';
import '../../features/home/presentation/cubit/location_state.dart';
import 'location_bottom_sheet.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<LocationCubit>(),
              child: const LocationBottomSheet(),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.greenHover.withValues(alpha: .28),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/location.svg',
              width: 24,
              height: 24,
              fit: .scaleDown,
            ),
            const SizedBox(width: 4),
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                return Text(
                  state.selectedCity?.name ?? 'Cairo',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                );
              },
            ),
            const SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
