import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class LoadQuiz extends QuizEvent {}

class AnswerQuestion extends QuizEvent {
  final int optionIndex;

  const AnswerQuestion({required this.optionIndex});

  @override
  List<Object> get props => [optionIndex];
}

class NextQuestion extends QuizEvent {}

class PreviousQuestion extends QuizEvent {}

class ResetQuestionProgress extends QuizEvent {}
