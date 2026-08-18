import 'package:derpy/features/home/presentation/widgets/tournament_item.dart';
import 'package:flutter/material.dart';

class TournamentList extends StatelessWidget {
  const TournamentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 317,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => const TournamentItem(),
              separatorBuilder: (_,_) => SizedBox(width: 10),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
