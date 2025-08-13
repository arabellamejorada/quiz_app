import 'package:flutter/material.dart';
import 'gradient_container.dart';
import 'screens/start_screen.dart';
import 'screens/question_screen.dart';
import 'screens/results_screen.dart';

class QuizManager extends StatefulWidget {
  const QuizManager({super.key});

  @override
  State<QuizManager> createState() => _QuizManagerState();
}

class _QuizManagerState extends State<QuizManager> {
  late Widget activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          child: activeScreen,
        ),
      ),
    );
  }
}