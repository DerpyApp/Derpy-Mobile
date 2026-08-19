import 'package:flutter/material.dart';
import '../widgets/tournament_list.dart';

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TournamentList(
        scrollDirection: Axis.vertical,
        height: MediaQuery.sizeOf(context).height * 0.63,
        padding: 0,
        title: false,
        sizedBox: false,
      ),
    ]);
  }
}
