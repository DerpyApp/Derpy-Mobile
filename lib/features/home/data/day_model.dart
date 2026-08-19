class DayModel {
  final String day;
  final String date;

  const DayModel({required this.day, required this.date});

  static const List<DayModel> days = [
    DayModel(day: 'Sat', date: '18'),
    DayModel(day: 'Sun', date: '19'),
    DayModel(day: 'Mon', date: '20'),
    DayModel(day: 'Wed', date: '21'),
    DayModel(day: 'Thu', date: '22'),
    DayModel(day: 'Fri', date: '23'),
  ];
}
