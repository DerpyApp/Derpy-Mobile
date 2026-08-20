import '../../data/model/club_model.dart';

class ClubState {
  final List<ClubModel> clubs;
  final int currentPriceIndex;
  final int currentStartTimeIndex;
  final int currentDayIndex;
  const ClubState({
    this.clubs = const [],
    this.currentPriceIndex = 0,
    this.currentStartTimeIndex = 0,
    this.currentDayIndex = 0,
  });

  ClubState copyWith({
    List<ClubModel>? clubs,
    int? currentPriceIndex,
    int? currentStartTimeIndex,
    int? currentDayIndex,
  }) {
    return ClubState(
      clubs: clubs ?? this.clubs,
      currentPriceIndex: currentPriceIndex ?? this.currentPriceIndex,
      currentStartTimeIndex:
          currentStartTimeIndex ?? this.currentStartTimeIndex,
      currentDayIndex: currentDayIndex ?? this.currentDayIndex,
    );
  }
}
