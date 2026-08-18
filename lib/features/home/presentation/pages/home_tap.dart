import 'package:derpy/core/theme/app_text_styles.dart';
import 'package:derpy/features/home/presentation/pages/profile_page.dart';
import 'package:derpy/features/home/presentation/pages/tournaments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/home_header.dart';
import '../widgets/search_item.dart';
import 'book_page.dart';
import 'home_page.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primary,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final pages = [
              const HomePage(),
              const BookPage(),
              const TournamentsPage(),
              const ProfilePage(),
            ];
            return SafeArea(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  const SizedBox(height: 16),
                  HomeHeader(),
                  SearchItem(),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      transitionBuilder: (child, animation) {
                        final isForward =
                            state.currentIndex > state.previousIndex;
                        final beginOffset = isForward
                            ? const Offset(-1, 0)
                            : const Offset(1, 0);
                        return SlideTransition(
                          position:
                              Tween<Offset>(
                                begin: beginOffset,
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeInOut,
                                ),
                              ),
                          child: child,
                        );
                      },
                      child: KeyedSubtree(
                        key: ValueKey(state.currentIndex),
                        child: pages[state.currentIndex],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
