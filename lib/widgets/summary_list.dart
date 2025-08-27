import 'package:flutter/material.dart';
import '../data/questions.dart';

class SummaryList extends StatelessWidget {
  const SummaryList({
    super.key,
    required this.selectedAnswers,
  });

  final List<String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: selectedAnswers.asMap().entries.map((entry) {
            final questionIndex = entry.key;
            final userAnswer = entry.value;
            final question = questions[questionIndex];
            final correctAnswer = question.answers[0];
            final isCorrect = userAnswer == correctAnswer;

            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: isCorrect 
                    ? Colors.green.withOpacity(0.5)
                    : Colors.red.withOpacity(0.5),
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCorrect ? Colors.green : Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            '${questionIndex + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          question.question,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isCorrect 
                        ? Colors.green.withOpacity(0.2)
                        : Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your answer: $userAnswer',
                          style: TextStyle(
                            color: isCorrect ? Colors.green[300] : Colors.red[300],
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (!isCorrect) ...[
                          const SizedBox(height: 5),
                          Text(
                            'Correct answer: $correctAnswer',
                            style: TextStyle(
                              color: Colors.green[300],
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
