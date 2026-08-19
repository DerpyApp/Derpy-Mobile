import 'package:derpy/features/home/presentation/widgets/day_item.dart';
import 'package:flutter/material.dart';

import '../../data/day_model.dart';

class FilterList extends StatefulWidget {
  const FilterList({super.key});

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<DayModel> days = DayModel.days;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: days.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: DayItem(day: days[index], isSelected: currentIndex == index),
        );
      },
      separatorBuilder: (_, _) => const SizedBox(width: 10),
    );
  }
}
