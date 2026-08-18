import 'package:derpy/features/home/presentation/widgets/custom_bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.secondary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBottomNavItem(
                icon: 'home',
                label: 'Home',
                isSelected: state.currentIndex == 0,
                onTap: () {
                  context.read<HomeCubit>().changeTab(0);
                },
              ),
              CustomBottomNavItem(
                icon: 'book',
                label: 'Book',
                isSelected: state.currentIndex == 1,
                onTap: () {
                  context.read<HomeCubit>().changeTab(1);
                },
              ),
              CustomBottomNavItem(
                icon: 'tournaments',
                label: 'Tournaments',
                isSelected: state.currentIndex == 2,
                onTap: () {
                  context.read<HomeCubit>().changeTab(2);
                },
              ),
              CustomBottomNavItem(
                icon: 'profile',
                label: 'Profile',
                isSelected: state.currentIndex == 3,
                onTap: () {
                  context.read<HomeCubit>().changeTab(3);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
