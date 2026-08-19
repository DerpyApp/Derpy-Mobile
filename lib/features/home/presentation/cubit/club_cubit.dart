import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/club_model.dart';
import 'club_state.dart';

class ClubCubit extends Cubit<ClubState> {
  ClubCubit() : super(const ClubState(clubs: ClubModel.clubs));

  void searchClubs(String query) {
    final filteredClubs = ClubModel.clubs.where((club) {
      final searchQuery = query.toLowerCase();
      return club.name.toLowerCase().contains(searchQuery) ||
          club.sport.toLowerCase().contains(searchQuery) ||
          club.location.toLowerCase().contains(searchQuery);
    }).toList();
    emit(state.copyWith(clubs: filteredClubs));
  }

  void filterBySport(String sport) {
    if (sport == 'All') {
      emit(state.copyWith(clubs: ClubModel.clubs));
      return;
    }
    final filteredClubs = ClubModel.clubs
        .where((club) => club.sport.toLowerCase() == sport.toLowerCase())
        .toList();
    emit(state.copyWith(clubs: filteredClubs));
  }
}
