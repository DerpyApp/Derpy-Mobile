import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/services/navigation_service.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeState());

  void signUp() {
    NavigationService.pushNamed(Routes.signUp);
  }

  void signIn() {
    NavigationService.pushNamed(Routes.signIn);
  }
}
