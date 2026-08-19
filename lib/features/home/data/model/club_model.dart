class ClubModel {
  final String name;
  final String location;
  final String sport;
  final double rating;
  final int price;
  final String priceUnit;
  final String imagePath;
  final String time;

  const ClubModel({
    required this.name,
    required this.location,
    required this.sport,
    required this.rating,
    required this.price,
    required this.priceUnit,
    required this.imagePath,
    required this.time,
  });

  static const List<ClubModel> clubs = [
    ClubModel(
      name: 'Markez Shbap Abdeen',
      location: 'Abdeen',
      sport: 'Football',
      rating: 3.7,
      price: 400,
      priceUnit: 'EGP / ',
      time: 'hour',
      imagePath: 'assets/images/club.png',
    ),
    ClubModel(
      name: 'Shrouk Club',
      location: 'Shrouk',
      sport: 'Paddle',
      rating: 4.6,
      price: 600,
      priceUnit: 'EGP / ',
      time: 'hour',
      imagePath: 'assets/images/paddel.png',
    ),
    ClubModel(
      name: 'Zayed Club',
      location: 'Zayed',
      sport: 'Football',
      rating: 4,
      price: 800,
      priceUnit: 'EGP / ',
      time: 'hour',
      imagePath: 'assets/images/club.png',
    ),
    ClubModel(
      name: 'Badr Club',
      location: 'Badr',
      sport: 'Paddle',
      rating: 3,
      price: 300,
      priceUnit: 'EGP / ',
      time: 'hour',
      imagePath: 'assets/images/paddel.png',
    ),
  ];
}
