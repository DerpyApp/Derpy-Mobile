import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/tournament_model.dart';
import '../cubit/tournament_cubit.dart';
import '../cubit/tournament_state.dart';
import '../widgets/tournament_list.dart';

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<TournamentCubit, TournamentState>(
            builder: (context, state) {
              return TournamentList(
                tournaments: TournamentModel.tournaments,
                scrollDirection: Axis.vertical,
                padding: 0,
                title: false,
                sizedBox: false,
                right: 16,
              );
            },
          ),
        ),
      ],
    );
  }
}
