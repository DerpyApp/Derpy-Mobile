import 'package:derpy/core/theme/font_weight_helper.dart';
import 'package:derpy/features/tournaments/presentation/widgets/tournament_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/model/tournament_model.dart';
import '../cubit/tournament_cubit.dart';
import '../cubit/tournament_state.dart';

class TournamentList extends StatelessWidget {
  final Axis scrollDirection;
  final double? height;
  final double? padding;
  final bool title;
  final bool sizedBox;
  final double? right;
  final List<TournamentModel> tournaments;

  const TournamentList({
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.height,
    this.padding,
    this.title = true,
    this.sizedBox = true,
    this.right,
    required this.tournaments,
  });

  @override
  Widget build(BuildContext context) {
    final bool isVertical = scrollDirection == Axis.vertical;

    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: right ?? 0),
      child: BlocBuilder<TournamentCubit, TournamentState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title)
                Text(
                  'Football Tournaments',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              if (title) const SizedBox(height: 8),
              if (isVertical)
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) =>
                        TournamentItem(tournament: tournaments[index]),
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemCount: tournaments.length,
                  ),
                )
              else
                SizedBox(
                  height: height ?? 317,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) =>
                        TournamentItem(tournament: tournaments[index]),
                    separatorBuilder: (_, _) =>
                        SizedBox(width: sizedBox ? 10 : 0),
                    itemCount: tournaments.length,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
