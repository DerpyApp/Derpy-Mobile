import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/city_model.dart';
import '../../features/home/presentation/cubit/location_cubit.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class LocationList extends StatelessWidget {
  final ValueChanged<CityModel> onCitySelected;
  final List<CityModel> cities;
  const LocationList({
    super.key,
    required this.onCitySelected,
    required this.cities,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        final city = cities[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          visualDensity: VisualDensity(vertical: -2),
          title: Text(
            city.name,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
          ),
          onTap: () {
            context.read<LocationCubit>().selectCity(city);
          },
        );
      },
      separatorBuilder: (_, _) => const SizedBox(height: 1),
      itemCount: cities.length,
    );
  }
}
