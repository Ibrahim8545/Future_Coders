import 'package:courseapp/features/quiz/domain/entities/quiz_entity.dart';
import 'package:courseapp/features/quiz/domain/repo/quiz_repository.dart';

class GetQuizLevelsUseCase {
  final QuizRepository repository;

  GetQuizLevelsUseCase(this.repository);

  List<QuizLevel> execute() {
    return repository.getLevels();
  }
}
