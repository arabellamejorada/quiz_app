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
          children: getSummaryData().map((summaryItem) {
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: summaryItem['is_correct'] as bool
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
                          color: summaryItem['is_correct'] as bool ? Colors.green : Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            '${(summaryItem['question_index'] as int) + 1}',
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
                          summaryItem['question'] as String,
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
                      color: summaryItem['is_correct'] as bool
                        ? Colors.green.withOpacity(0.2)
                        : Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your answer: ${summaryItem['user_answer']}',
                          style: TextStyle(
                            color: summaryItem['is_correct'] as bool 
                              ? Colors.green[300] 
                              : Colors.red[300],
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (!(summaryItem['is_correct'] as bool)) ...[
                          const SizedBox(height: 5),
                          Text(
                            'Correct answer: ${summaryItem['correct_answer']}',
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

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    
    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
        'is_correct': selectedAnswers[i] == questions[i].answers[0],
      });
    }
    
    return summary;
  }
}
