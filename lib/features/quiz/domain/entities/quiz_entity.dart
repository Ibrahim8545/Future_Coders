class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuizLevel {
  final String levelTitle;
  final List<QuizQuestion> questions;

  const QuizLevel({required this.levelTitle, required this.questions});
}