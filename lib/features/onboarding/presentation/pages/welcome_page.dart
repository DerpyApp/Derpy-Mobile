import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/welcome_cubit.dart';
import '../widgets/welcome_item.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(),
      child: Scaffold(body: WelcomeItem()),
    );
  }
}
