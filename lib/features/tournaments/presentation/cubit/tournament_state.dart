import 'package:derpy/features/tournaments/data/model/tournament_model.dart';

class TournamentState {
  final List<TournamentModel> tournaments;
  const TournamentState({this.tournaments = const []});

  TournamentState copyWith({List<TournamentModel>? tournaments}) {
    return TournamentState(tournaments: tournaments ?? this.tournaments);
  }
}
