class CityModel {
  final String name;

  const CityModel({required this.name});

  static List<CityModel> cities = [
    CityModel(name: 'Cairo'),
    CityModel(name: 'New Cairo'),
    CityModel(name: 'Sheikh Zayed'),
    CityModel(name: 'Maadi'),
    CityModel(name: 'North Coast'),
  ];
}