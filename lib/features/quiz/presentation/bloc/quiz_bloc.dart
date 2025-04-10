import 'dart:async';
import 'package:courseapp/features/quiz/domain/use_case/get_progress_usecase.dart';
import 'package:courseapp/features/quiz/domain/use_case/get_quiz_levels_usecase.dart';
import 'package:courseapp/features/quiz/domain/use_case/save_progress_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'quiz_event.dart';
import 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetQuizLevelsUseCase getQuizLevels;
  final SaveProgressUseCase saveProgress;
  final GetProgressUseCase getProgress;

  QuizBloc({
    required this.getQuizLevels,
    required this.saveProgress,
    required this.getProgress,
  }) : super(QuizInitial()) {
    on<LoadQuiz>(_onLoadQuiz);
    on<AnswerQuestion>(_onAnswerQuestion);
    on<NextQuestion>(_onNextQuestion);
    on<PreviousQuestion>(_onPreviousQuestion);
    on<ResetQuestionProgress>(_onResetQuestionProgress);
  }

  Future<void> _onLoadQuiz(LoadQuiz event, Emitter<QuizState> emit) async {
    emit(QuizLoading());
    try {
      final levels = getQuizLevels.execute();
      final progress = await getProgress.execute();

      final currentLevelIndex = progress['levelIndex'] ?? 0;
      final currentQuestionIndex = progress['questionIndex'] ?? 0;

      final completedQuestions = List.generate(
        levels[currentLevelIndex].questions.length,
        (index) => false,
      );

      emit(QuizLoaded(
        levels: levels,
        currentLevelIndex: currentLevelIndex,
        currentQuestionIndex: currentQuestionIndex,
        isAnswered: false,
        completedQuestions: completedQuestions,
      ));
    } catch (e) {
      emit(QuizError(message: e.toString()));
    }
  }

  Future<void> _onAnswerQuestion(
      AnswerQuestion event, Emitter<QuizState> emit) async {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;

      if (currentState.isAnswered) return;

      final currentLevel = currentState.levels[currentState.currentLevelIndex];
      final currentQuestion =
          currentLevel.questions[currentState.currentQuestionIndex];
      final isCorrect = event.optionIndex == currentQuestion.correctAnswerIndex;

      List<bool> updatedCompletedQuestions =
          List.from(currentState.completedQuestions);
      updatedCompletedQuestions[currentState.currentQuestionIndex] = true;

      emit(currentState.copyWith(
        isAnswered: true,
        selectedOptionIndex: event.optionIndex,
        isCorrect: isCorrect,
        completedQuestions: updatedCompletedQuestions,
      ));

      // Auto advance after delay
      await Future.delayed(const Duration(seconds: 1));
      add(NextQuestion());
    }
  }

  Future<void> _onNextQuestion(
      NextQuestion event, Emitter<QuizState> emit) async {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final levels = currentState.levels;
      int levelIndex = currentState.currentLevelIndex;
      int questionIndex = currentState.currentQuestionIndex;

      if (questionIndex < 4) {
        questionIndex++;
      } else {
        if (levelIndex < levels.length - 1) {
          levelIndex++;
          questionIndex = 0;
          add(ResetQuestionProgress());
        } else {
          return;
        }
      }

      await saveProgress.execute(levelIndex, questionIndex);

      emit(currentState.copyWith(
        currentLevelIndex: levelIndex,
        currentQuestionIndex: questionIndex,
        isAnswered: false,
        selectedOptionIndex: null,
        isCorrect: null,
      ));
    }
  }

  Future<void> _onPreviousQuestion(
      PreviousQuestion event, Emitter<QuizState> emit) async {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final levels = currentState.levels;
      int levelIndex = currentState.currentLevelIndex;
      int questionIndex = currentState.currentQuestionIndex;

      if (questionIndex > 0) {
        questionIndex--;
      } else if (levelIndex > 0) {
        levelIndex--;
        questionIndex = levels[levelIndex].questions.length - 1;
        add(ResetQuestionProgress());
      } else {
        return; // Already at first question
      }

      // Save progress
      await saveProgress.execute(levelIndex, questionIndex);

      emit(currentState.copyWith(
        currentLevelIndex: levelIndex,
        currentQuestionIndex: questionIndex,
        isAnswered: false,
        selectedOptionIndex: null,
        isCorrect: null,
      ));
    }
  }

  void _onResetQuestionProgress(
      ResetQuestionProgress event, Emitter<QuizState> emit) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      // دائماً نستخدم 5 أسئلة لكل مستوى
      final completedQuestions = List.generate(5, (index) => false);

      emit(currentState.copyWith(completedQuestions: completedQuestions));
    }
  }
}
