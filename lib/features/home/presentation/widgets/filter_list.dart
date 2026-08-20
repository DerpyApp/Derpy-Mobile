import 'package:derpy/features/home/presentation/widgets/day_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/day_model.dart';
import '../cubit/club_cubit.dart';
import '../cubit/club_state.dart';

class FilterList extends StatelessWidget {
  const FilterList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DayModel> days = DayModel.days;
    return BlocBuilder<ClubCubit, ClubState>(
      builder: (context, state) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                context.read<ClubCubit>().changeDay(index);
              },
              child: DayItem(
                day: days[index],
                isSelected: state.currentDayIndex == index,
              ),
            );
          },
          separatorBuilder: (_, _) => const SizedBox(width: 10),
        );
      },
    );
  }
}
