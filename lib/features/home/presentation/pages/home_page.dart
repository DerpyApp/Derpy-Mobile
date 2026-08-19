import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../tournaments/presentation/widgets/tournament_list.dart';
import '../cubit/club_cubit.dart';
import '../cubit/club_state.dart';
import '../widgets/book_now_item.dart';
import '../../../book/presentation/widgets/clubs_near_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ClubCubit, ClubState>(
        builder: (context, state) {
          return Column(
            children: [
              const BookNowItem(),
              const SizedBox(height: 16),
              ClubsNearList(clubs: state.clubs),
              const SizedBox(height: 16),
              const TournamentList(),
            ],
          );
        },
      ),
    );
  }
}
