import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/cubit/club_cubit.dart';
import '../../../home/presentation/cubit/club_state.dart';
import '../../data/model/sport_tab_model.dart';
import '../cubit/book_cubit.dart';
import '../cubit/book_state.dart';
import '../widgets/clubs_near_list.dart';
import '../widgets/sport_tab_item.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          return Column(
            children: [
              DefaultTabController(
                length: SportTabModel.sports.length + 1,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: .start,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.only(right: 8),
                  tabs: [
                    SportTabItem(
                      label: 'All',
                      iconPath: 'assets/icons/all.svg',
                      isSelected: state.currentIndex == 0,
                    ),
                    ...SportTabModel.sports.map(
                      (sport) => SportTabItem(
                        isSelected:
                            state.currentIndex ==
                            SportTabModel.sports.indexOf(sport) + 1,
                        label: sport.title,
                      ),
                    ),
                  ],
                  onTap: (index) {
                    context.read<BookCubit>().changeTab(index);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<ClubCubit, ClubState>(
                  builder: (context, state) {
                    return ClubsNearList(
                      clubs: state.clubs,
                      scrollDirection: Axis.vertical,
                      padding: 0,
                      title: false,
                      sizedBox: false,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
