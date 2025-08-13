import '../models/quiz_question.dart';

const questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets',
      'Blocks',
      'Functions', 
      'Components',
    ],
  ),
  QuizQuestion(
    'How are flutter UIs built?',
    [
      'Combining widgets in code',
      'Combining widgets in visual editor',
      'Combining widgets in config files',
      'Using XCode for iOS and Android Studio for Android',
    ],
  ),
  QuizQuestion(
    'What\'s the purpose of a Stateful Widget?',
    [
      'Update UI based on state changes',
      'Update UI based on UI input',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of Stateful Widget??',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];
