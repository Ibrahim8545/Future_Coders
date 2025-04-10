import '../../domain/entities/quiz_entity.dart';

class QuizQuestionModel extends QuizQuestion {
  const QuizQuestionModel({
    required String question,
    required List<String> options,
    required int correctAnswerIndex,
  }) : super(
          question: question,
          options: options,
          correctAnswerIndex: correctAnswerIndex,
        );

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) {
    return QuizQuestionModel(
      question: json['question'],
      options: List<String>.from(json['options']),
      correctAnswerIndex: json['correctAnswerIndex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
    };
  }
}

class QuizLevelModel extends QuizLevel {
  const QuizLevelModel({
    required String levelTitle,
    required List<QuizQuestion> questions,
  }) : super(
          levelTitle: levelTitle,
          questions: questions,
        );

  factory QuizLevelModel.fromJson(Map<String, dynamic> json) {
    return QuizLevelModel(
      levelTitle: json['levelTitle'],
      questions: (json['questions'] as List)
          .map((q) => QuizQuestionModel.fromJson(q))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'levelTitle': levelTitle,
      'questions': (questions as List<QuizQuestionModel>)
          .map((q) => q.toJson())
          .toList(),
    };
  }
}