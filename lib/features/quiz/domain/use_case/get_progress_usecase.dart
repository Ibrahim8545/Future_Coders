import 'package:courseapp/features/quiz/domain/repo/quiz_repository.dart';

class GetProgressUseCase {
  final QuizRepository repository;

  GetProgressUseCase(this.repository);

  Future<Map<String, int>> execute() {
    return repository.getProgress();
  }
}
