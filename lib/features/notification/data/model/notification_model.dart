class NotificationModel {
  final String title;
  final String description;
  final String iconPath;
  final DateTime createdAt;

  NotificationModel({
    required this.title,
    required this.description,
    required this.iconPath,
    required this.createdAt,
  });

  static final List<NotificationModel> notifications = [
    NotificationModel(
      title: 'Your spot is available!',
      description: 'The pitch is now available for booking at 8:00 PM.',
      iconPath: 'assets/icons/home.svg',
      createdAt: DateTime.now().subtract(const Duration(minutes: 3)),
    ),

    NotificationModel(
      title: 'Your spot is available!',
      description: 'The pitch is now available for booking at 8:00 PM.',
      iconPath: 'assets/icons/home.svg',
      createdAt: DateTime.now().subtract(const Duration(minutes: 9)),
    ),

    NotificationModel(
      title: 'New Offer Available',
      description: 'The pitch is now available for booking at 8:00 PM.',
      iconPath: 'assets/icons/information.svg',
      createdAt: DateTime.now().subtract(const Duration(minutes: 20)),
    ),

    NotificationModel(
      title: 'Special Offer at Zamalek Club',
      description: 'Book your next match and save 20%.',
      iconPath: 'assets/icons/information.svg',
      createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    ),

    NotificationModel(
      title: 'New Tournament Available',
      description: 'A new football tournament is open for registration.',
      iconPath: 'assets/icons/tournaments.svg',
      createdAt: DateTime.now().subtract(const Duration(minutes: 160)),
    ),
  ];
}
