import 'package:flutter/material.dart';

import '../../data/model/sport_tab_model.dart';
import '../widgets/clubs_near_list.dart';
import '../widgets/sport_tab_item.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          DefaultTabController(
            length: SportTabModel.sports.length + 1,
            child: TabBar(
              isScrollable: true,
              tabAlignment: .start,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              labelPadding: EdgeInsets.only(right: 8),
              tabs: [
                SportTabItem(
                  label: 'All',
                  iconPath: 'assets/icons/all.svg',
                  isSelected: currentIndex == 0,
                ),
                ...SportTabModel.sports.map(
                  (sport) => SportTabItem(
                    isSelected:
                        currentIndex == SportTabModel.sports.indexOf(sport) + 1,
                    label: sport.title,
                  ),
                ),
              ],
              onTap: (index) {
                if (currentIndex == index) return;
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ClubsNearList(
              scrollDirection: Axis.vertical,
              padding: 0,
              title: false,
              sizedBox: false,
            ),
          ),
        ],
      ),
    );
  }
}
