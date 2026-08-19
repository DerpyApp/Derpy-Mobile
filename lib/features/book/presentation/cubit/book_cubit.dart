import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(const BookState());

  void changeTab(int index) {
    if (state.currentIndex == index) return;
    emit(state.copyWith(currentIndex: index));
  }

}
