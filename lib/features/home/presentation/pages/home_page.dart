import 'package:flutter/material.dart';

import '../../../tournaments/presentation/widgets/tournament_list.dart';
import '../widgets/book_now_item.dart';
import '../../../book/presentation/widgets/clubs_near_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BookNowItem(),
          const SizedBox(height: 16),
          ClubsNearList(),
          const SizedBox(height: 16),
          const TournamentList(),
        ],
      ),
    );
  }
}