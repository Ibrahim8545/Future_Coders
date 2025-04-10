import 'package:courseapp/features/quiz/data/data_sources/quiz_local_data_source.dart';
import 'package:courseapp/features/quiz/data/repos/quiz_repository_impl.dart';
import 'package:courseapp/features/quiz/domain/repo/quiz_repository.dart';
import 'package:courseapp/features/quiz/domain/use_case/get_progress_usecase.dart';
import 'package:courseapp/features/quiz/domain/use_case/get_quiz_levels_usecase.dart';
import 'package:courseapp/features/quiz/domain/use_case/save_progress_use_case.dart';
import 'package:courseapp/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => QuizBloc(
      getQuizLevels: sl(),
      saveProgress: sl(),
      getProgress: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetQuizLevelsUseCase(sl()));
  sl.registerLazySingleton(() => SaveProgressUseCase(sl()));
  sl.registerLazySingleton(() => GetProgressUseCase(sl()));

  // Repository
  sl.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<QuizLocalDataSource>(
    () => QuizLocalDataSourceImpl(),
  );
}
