import 'package:derpy/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  void changeTab(int index) {
    if (state.currentIndex == index) return;
    emit(
      state.copyWith(previousIndex: state.currentIndex, currentIndex: index),
    );
  }
}
