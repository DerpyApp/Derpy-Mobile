import 'package:derpy/features/home/presentation/widgets/start_time_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/model/start_time_model.dart';

class StartTimeList extends StatefulWidget {
  const StartTimeList({super.key});

  @override
  State<StartTimeList> createState() => _StartTimeListState();
}

class _StartTimeListState extends State<StartTimeList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<StartTimeModel> times = StartTimeModel.times;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.secondary),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: times.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: StartTimeItem(
              time: times[index],
              isSelected: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
