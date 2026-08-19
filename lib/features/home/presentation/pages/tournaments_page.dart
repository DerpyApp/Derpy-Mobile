import 'package:flutter/material.dart';

import '../widgets/book_now_item.dart';
import '../widgets/tournament_list.dart';

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Expanded(
          child: TournamentList(
            scrollDirection: Axis.vertical,
            padding: 0,
            title: false,
            sizedBox: false,
            right: 16,
          ),
        ),
      ],
    );
  }
}
