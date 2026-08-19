class BookState {
  final int currentIndex;
  const BookState({this.currentIndex = 0});

  BookState copyWith({int? currentIndex}) {
    return BookState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
