class HomeState {
  final int currentIndex;
  final int previousIndex;
  const HomeState({this.currentIndex = 0, this.previousIndex = 0});

  HomeState copyWith({int? currentIndex, int? previousIndex}) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      previousIndex: previousIndex ?? this.previousIndex,
    );
  }

}
