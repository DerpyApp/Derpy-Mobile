class TournamentModel {
  final String name;
  final String sport;
  final double rating;
  final String startDate;
  final String endDate;
  final String location;
  final int registeredTeams;
  final int totalTeams;
  final int prize;
  final String imagePath;

  const TournamentModel({
    required this.name,
    required this.sport,
    required this.rating,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.registeredTeams,
    required this.totalTeams,
    required this.prize,
    required this.imagePath,
  });

  static const List<TournamentModel> tournaments = [
    TournamentModel(
      name: 'Zamalek Club',
      sport: 'Football',
      rating: 4.5,
      startDate: 'Oct 15',
      endDate: 'Oct 20, 2026',
      location: 'Zamalek, Cairo',
      registeredTeams: 24,
      totalTeams: 32,
      prize: 100000,
      imagePath: 'assets/images/football.png',
    ),
    TournamentModel(
      name: 'Badr Club',
      sport: 'Paddle',
      rating: 3.5,
      startDate: 'Oct 20',
      endDate: 'Oct 30, 2026',
      location: 'Badr, Cairo',
      registeredTeams: 9,
      totalTeams: 18,
      prize: 85000,
      imagePath: 'assets/images/paddel.png',
    ),
    TournamentModel(
      name: 'Cairo Club',
      sport: 'Football',
      rating: 4.5,
      startDate: 'Oct 15',
      endDate: 'Oct 20, 2026',
      location: 'Zamalek, Cairo',
      registeredTeams: 4,
      totalTeams: 10,
      prize: 60000,
      imagePath: 'assets/images/football.png',
    ),
    TournamentModel(
      name: 'Obor Club',
      sport: 'Paddle',
      rating: 3.5,
      startDate: 'Oct 20',
      endDate: 'Oct 30, 2026',
      location: 'Badr, Cairo',
      registeredTeams: 30,
      totalTeams: 50,
      prize: 300000,
      imagePath: 'assets/images/paddel.png',
    ),
  ];
}
