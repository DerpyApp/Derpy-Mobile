import 'package:derpy/core/theme/app_colors.dart';
import 'package:derpy/core/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../features/home/data/city_model.dart';
import '../../features/home/presentation/cubit/location_cubit.dart';
import '../../features/home/presentation/cubit/location_state.dart';
import '../theme/app_text_styles.dart';
import 'location_list.dart';

class LocationBottomSheet extends StatefulWidget {
  const LocationBottomSheet({super.key});

  @override
  State<LocationBottomSheet> createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<LocationBottomSheet> {
  CityModel? selectedCity;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
      child: Container(
        padding: EdgeInsets.only(top: 50, left: 16, right: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
          color: AppColors.primary,
          border: Border(
            top: BorderSide(color: AppColors.primaryGreen, width: 2),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your area',
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 50.h,
                child: DefaultTextFormField(
                  hintText: 'Search for a court',
                  prefixIconImageName: 'search',
                  onChange: (value) {
                    context.read<LocationCubit>().searchCities(value);
                  },
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'YOUR AREAS',
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    width: 24,
                    height: 24,
                    fit: .scaleDown,
                  ),
                  SizedBox(width: 8.w),
                  BlocBuilder<LocationCubit, LocationState>(
                    builder: (_, state) {
                      return Text(
                        state.selectedCity?.name ?? 'New Cairo',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(color: AppColors.secondary),
              SizedBox(height: 10.h),
              Text(
                'ALL AREAS',
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 210.h,
                child: BlocBuilder<LocationCubit, LocationState>(
                  builder: (_, state) {
                    return LocationList(
                      cities: state.cities,
                      onCitySelected: (city) {
                        context.read<LocationCubit>().selectCity(city);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
