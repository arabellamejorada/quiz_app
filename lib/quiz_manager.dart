import 'package:flutter/material.dart';
import 'gradient_container.dart';
import 'screens/start_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'data/questions.dart';

class QuizManager extends StatefulWidget {
  const QuizManager({super.key});

  @override
  State<QuizManager> createState() => _QuizManagerState();
}

class _QuizManagerState extends State<QuizManager> {
  late Widget activeScreen;
  var score = 0;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onQuizComplete: showResults,
        onAnswerSelected: checkAnswerAndUpdateScore,
      );
    });
  }

  void checkAnswerAndUpdateScore(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    
    // Get the current question to check if answer is correct
    final currentQuestionIndex = selectedAnswers.length - 1;
    final correctAnswer = questions[currentQuestionIndex].answers[0]; // First answer is correct
    
    if (selectedAnswer == correctAnswer) {
      score++;
    }
  }

  void showResults() {
    setState(() {
      activeScreen = ResultScreen(
        score: score,
        selectedAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      score = 0;
      selectedAnswers = [];
      activeScreen = StartScreen(switchScreen);
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