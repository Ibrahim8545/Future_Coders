import 'package:equatable/equatable.dart';
import '../../domain/entities/quiz_entity.dart';

abstract class QuizState extends Equatable {
  const QuizState();
  
  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<QuizLevel> levels;
  final int currentLevelIndex;
  final int currentQuestionIndex;
  final bool isAnswered;
  final int? selectedOptionIndex;
  final bool? isCorrect;
  final List<bool> completedQuestions;

  const QuizLoaded({
    required this.levels,
    required this.currentLevelIndex,
    required this.currentQuestionIndex,
    required this.isAnswered,
    this.selectedOptionIndex,
    this.isCorrect,
    required this.completedQuestions,
  });

  @override
  List<Object> get props => [
        levels,
        currentLevelIndex,
        currentQuestionIndex,
        isAnswered,
        completedQuestions,
        if (selectedOptionIndex != null) selectedOptionIndex!,
        if (isCorrect != null) isCorrect!,
      ];

  QuizLoaded copyWith({
    List<QuizLevel>? levels,
    int? currentLevelIndex,
    int? currentQuestionIndex,
    bool? isAnswered,
    int? selectedOptionIndex,
    bool? isCorrect,
    List<bool>? completedQuestions,
  }) {
    return QuizLoaded(
      levels: levels ?? this.levels,
      currentLevelIndex: currentLevelIndex ?? this.currentLevelIndex,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isAnswered: isAnswered ?? this.isAnswered,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
      isCorrect: isCorrect ?? this.isCorrect,
      completedQuestions: completedQuestions ?? this.completedQuestions,
    );
  }
}

class QuizError extends QuizState {
  final String message;

  const QuizError({required this.message});

  @override
  List<Object> get props => [message];
}