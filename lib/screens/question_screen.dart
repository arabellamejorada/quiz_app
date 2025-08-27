import 'package:flutter/material.dart';
import '../widgets/answer_button.dart';
import '../data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onQuizComplete,
    required this.onAnswerSelected,
  });

  final VoidCallback onQuizComplete;
  final void Function(String selectedAnswer) onAnswerSelected;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onAnswerSelected(selectedAnswer); // Update score
    
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Quiz is complete, show results
        widget.onQuizComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: AnswerButton(
                  answerText: answer,
                  onTap: () => answerQuestion(answer),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
