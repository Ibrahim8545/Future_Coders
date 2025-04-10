import 'package:courseapp/features/quiz/data/data_sources/quiz_local_data_source.dart';
import 'package:courseapp/features/quiz/domain/entities/quiz_entity.dart';
import 'package:courseapp/features/quiz/domain/repo/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizLocalDataSource localDataSource;

  QuizRepositoryImpl({required this.localDataSource});

  @override
  List<QuizLevel> getLevels() {
    return localDataSource.getLevels();
  }

  @override
  Future<void> saveProgress(int levelIndex, int questionIndex) {
    return localDataSource.saveProgress(levelIndex, questionIndex);
  }

  @override
  Future<Map<String, int>> getProgress() {
    return localDataSource.getProgress();
  }
}
