import 'package:derpy/features/home/presentation/widgets/tournament_item.dart';
import 'package:flutter/material.dart';

class TournamentList extends StatelessWidget {
  final Axis scrollDirection;
  final double? height;
  final double? padding;
  final bool title;
  final bool sizedBox;
  const TournamentList({
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.height,
    this.padding,
    this.title = true,
    this.sizedBox = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: height ?? 185,
            child: ListView.separated(
              scrollDirection: scrollDirection,
              itemBuilder: (_, index) => const TournamentItem(),
              separatorBuilder: (_, _) =>
                  SizedBox(width: sizedBox ? 10 : 0, height: sizedBox ? 0 : 10),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
