import 'package:flutter/material.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton(this.startQuiz, {super.key});
  
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: startQuiz,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 15,
        ),
        foregroundColor: Colors.white,
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: const Text(
        'Start Quiz',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
