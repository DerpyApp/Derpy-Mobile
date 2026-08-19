import '../../data/model/club_model.dart';

class ClubState {
  final List<ClubModel> clubs;
  const ClubState({this.clubs = const []});

  ClubState copyWith({List<ClubModel>? clubs}) {
    return ClubState(clubs: clubs ?? this.clubs);
  }
}
