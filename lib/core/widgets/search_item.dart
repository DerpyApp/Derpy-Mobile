import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/home/presentation/widgets/filter_item.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: DefaultTextFormField(
              hintText: 'Search clubs, courts or locations',
              prefixIconImageName: 'search',
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => FilterItem(),
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.greenHover,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  'assets/icons/sort.svg',
                  width: 24,
                  height: 24,
                  fit: .scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
