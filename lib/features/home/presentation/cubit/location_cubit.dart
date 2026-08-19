import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/city_model.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState(cities: CityModel.cities));

  void selectCity(CityModel city) {
    emit(state.copyWith(selectedCity: city));
  }

  void searchCities(String query) {
    final cities = CityModel.cities.where((city) {
      return city.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    emit(state.copyWith(cities: cities));
  }
}
