import 'package:courseapp/features/quiz/domain/entities/quiz_entity.dart';

abstract class QuizRepository {
  List<QuizLevel> getLevels();
  Future<void> saveProgress(int levelIndex, int questionIndex);
  Future<Map<String, int>> getProgress();
}
