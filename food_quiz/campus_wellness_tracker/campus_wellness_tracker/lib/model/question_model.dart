class Option {
  final String text;
  final int score;

  const Option({required this.text, required this.score});
}

class Question {
  final String questionText;
  final List<Option> options;

  const Question({required this.questionText, required this.options});
}