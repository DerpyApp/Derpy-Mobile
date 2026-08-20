import 'package:derpy/features/tournaments/presentation/cubit/tournament_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/tournament_model.dart';

class TournamentCubit extends Cubit<TournamentState> {
  TournamentCubit()
    : super(TournamentState(tournaments: TournamentModel.tournaments));
}
