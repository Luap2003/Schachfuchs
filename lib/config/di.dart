import 'package:get_it/get_it.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/storage/database.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/content_version_repository.dart';
import 'package:schach_app/core/storage/repositories/game_history_repository.dart';
import 'package:schach_app/core/storage/repositories/local_auth_repository.dart';
import 'package:schach_app/core/storage/repositories/local_content_version_repository.dart';
import 'package:schach_app/core/storage/repositories/local_game_history_repository.dart';
import 'package:schach_app/core/storage/repositories/local_profile_repository.dart';
import 'package:schach_app/core/storage/repositories/local_progress_repository.dart';
import 'package:schach_app/core/storage/repositories/profile_repository.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';
import 'package:uuid/uuid.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerLazySingleton<Uuid>(Uuid.new);
  getIt.registerLazySingleton<AppDatabase>(AppDatabase.new);

  getIt.registerLazySingleton<ContentLoader>(ContentLoader.new);

  getIt.registerFactory<ChessEngine>(ChessEngine.new);

  getIt.registerLazySingleton<ProfileRepository>(
    () => LocalProfileRepository(getIt<AppDatabase>(), getIt<Uuid>()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => LocalAuthRepository(getIt<AppDatabase>(), getIt<ProfileRepository>()),
  );
  getIt.registerLazySingleton<ProgressRepository>(
    () => LocalProgressRepository(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<GameHistoryRepository>(
    () => LocalGameHistoryRepository(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<ContentVersionRepository>(
    () => LocalContentVersionRepository(getIt<AppDatabase>()),
  );

  await getIt<ProfileRepository>().ensureLocalProfile();
  await getIt<ContentLoader>().verifyContentIntegrity();
}
