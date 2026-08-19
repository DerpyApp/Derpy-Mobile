class SportTabModel {
  final String title;

  SportTabModel({required this.title});

  static final List<SportTabModel> sports = [
    SportTabModel(title: 'Football'),
    SportTabModel(title: 'Padel'),
  ];
}
