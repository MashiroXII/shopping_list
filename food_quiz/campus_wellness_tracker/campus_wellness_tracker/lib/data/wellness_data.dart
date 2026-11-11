import 'package:campus_wellness_tracker/model/question_model.dart';

const List<Question> wellnessQuestions = [
  Question(
    questionText: 'How many hours of sleep do you typically get?',
    options: [
      Option(text: 'Less than 4 hours', score: 1),
      Option(text: '4–6 hours', score: 2),
      Option(text: '7–8 hours', score: 4),
      Option(text: 'More than 8 hours', score: 3),
    ],
  ),
  Question(
    questionText: 'How many glasses of water do you drink daily?',
    options: [
      Option(text: '1–2 glasses', score: 1),
      Option(text: '3–5 glasses', score: 2),
      Option(text: '6–8 glasses', score: 4),
      Option(text: 'More than 8 glasses', score: 4),
    ],
  ),
  Question(
    questionText: 'How would you rate your current study stress level?',
    options: [
      Option(text: 'Very High', score: 1),
      Option(text: 'High', score: 2),
      Option(text: 'Moderate', score: 3),
      Option(text: 'Low', score: 4),
    ],
  ),
  Question(
    questionText: 'How often do you engage in physical activity or exercise?',
    options: [
      Option(text: 'Rarely / Never', score: 1),
      Option(text: '1–2 times a week', score: 2),
      Option(text: '3–4 times a week', score: 3),
      Option(text: '5+ times a week', score: 4),
    ],
  ),
  Question(
    questionText: 'How often do you take intentional breaks during study sessions?',
    options: [
      Option(text: 'Never, I study straight through', score: 1),
      Option(text: 'Only when exhausted', score: 2),
      Option(text: 'Regularly every hour', score: 4),
      Option(text: 'Whenever I feel unfocused', score: 3),
    ],
  ),
];