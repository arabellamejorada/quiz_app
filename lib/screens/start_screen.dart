import 'package:flutter/material.dart';
import '../startquiz_button.dart';
import '../styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 40),
          const StyledText(),
          const SizedBox(height: 40),
          const StartQuizButton(),
        ],
      ),
    );
  }
}
