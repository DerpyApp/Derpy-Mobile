import 'package:derpy/features/profile/presentation/pages/profile_page.dart';
import 'package:derpy/features/tournaments/presentation/pages/tournaments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../book/presentation/cubit/book_cubit.dart';
import '../cubit/club_cubit.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../cubit/location_cubit.dart';
import '../widgets/home_header.dart';
import '../../../../core/widgets/search_item.dart';
import '../../../book/presentation/pages/book_page.dart';
import 'home_page.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => ClubCubit()),
        BlocProvider(create: (_) => BookCubit()),
        BlocProvider(create: (_) => LocationCubit()),
      ],
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
                  if (state.currentIndex != 3) HomeHeader(),
                  if (state.currentIndex != 3 && state.currentIndex != 2)
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
