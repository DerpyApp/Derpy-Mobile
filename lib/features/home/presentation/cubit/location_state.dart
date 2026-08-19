import '../../data/model/city_model.dart';

class LocationState {
  final CityModel? selectedCity;
  final List<CityModel> cities;

  const LocationState({this.selectedCity, this.cities = const []});

  LocationState copyWith({CityModel? selectedCity, List<CityModel>? cities}) {
    return LocationState(
      selectedCity: selectedCity ?? this.selectedCity,
      cities: cities ?? this.cities,
    );
  }
}
