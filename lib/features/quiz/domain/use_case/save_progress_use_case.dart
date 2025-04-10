import 'package:courseapp/features/quiz/domain/repo/quiz_repository.dart';

class SaveProgressUseCase {
  final QuizRepository repository;

  SaveProgressUseCase(this.repository);

  Future<void> execute(int levelIndex, int questionIndex) {
    return repository.saveProgress(levelIndex, questionIndex);
  }
}
