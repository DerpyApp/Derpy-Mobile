import 'package:derpy/features/home/presentation/widgets/price_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/price_model.dart';
import '../cubit/club_cubit.dart';
import '../cubit/club_state.dart';

class PriceList extends StatefulWidget {
  const PriceList({super.key});

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<PriceModel> prices = PriceModel.prices;
    return BlocBuilder<ClubCubit, ClubState>(
      builder: (context, state) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              context.read<ClubCubit>().changePrice(index);
            },
            child: PriceItem(
              price: prices[index],
              isSelected: state.currentPriceIndex == index,
            ),
          ),
          separatorBuilder: (_, _) => const SizedBox(width: 10),
          itemCount: prices.length,
        );
      },
    );
  }
}
