import 'package:flutter/material.dart';
import '../../widgets/create_password.dart';

class CreatePasswordStep extends StatefulWidget {
  final PageController pageController;

  const CreatePasswordStep({
    super.key,
    required this.pageController,
  });

  @override
  State<CreatePasswordStep> createState() => CreatePasswordStepState();
}

class CreatePasswordStepState extends State<CreatePasswordStep> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        keyboardDismissBehavior:
        ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: formKey,
          child: CreatePassword(
            formKey: formKey,
          ),
        ),
      ),
    );
  }
}
