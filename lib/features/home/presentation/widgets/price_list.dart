import 'package:derpy/features/home/presentation/widgets/price_item.dart';
import 'package:flutter/material.dart';

import '../../data/price_model.dart';

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
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = index;
          });
        },
        child: PriceItem(
          price: prices[index],
          isSelected: currentIndex == index,
        ),
      ),
      separatorBuilder: (_, _) => const SizedBox(width: 10),
      itemCount: prices.length,
    );
  }
}
