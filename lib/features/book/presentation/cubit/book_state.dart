import '../../../home/data/model/club_model.dart';

class BookState {
  final int currentIndex;

  const BookState({
    this.currentIndex = 0,
  });

  BookState copyWith({
    int? currentIndex,
  }) {
    return BookState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
