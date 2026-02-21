import 'package:schach_app/core/models/game_record.dart';
import 'package:schach_app/core/models/progress.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/game_history_repository.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';

class InMemoryAuthRepository implements AuthRepository {
  InMemoryAuthRepository({this.userId = 'test-user'});

  final String userId;

  @override
  Future<String> getCurrentLocalUserId() async => userId;

  @override
  Future<void> linkRemoteIdentity({
    required String remoteUserId,
    required String authProvider,
  }) async {}
}

class InMemoryProgressRepository implements ProgressRepository {
  final Map<String, LessonProgress> _lesson = <String, LessonProgress>{};
  final Map<String, PuzzleProgress> _puzzle = <String, PuzzleProgress>{};

  @override
  Future<LessonProgress?> getLessonProgress({
    required String ownerUserId,
    required String lessonId,
  }) async {
    return _lesson['$ownerUserId:$lessonId'];
  }

  @override
  Future<PuzzleProgress?> getPuzzleProgress({
    required String ownerUserId,
    required String puzzleId,
  }) async {
    return _puzzle['$ownerUserId:$puzzleId'];
  }

  @override
  Future<void> upsertLessonProgress(LessonProgress progress) async {
    _lesson['${progress.ownerUserId}:${progress.lessonId}'] = progress;
  }

  @override
  Future<void> upsertPuzzleProgress(PuzzleProgress progress) async {
    _puzzle['${progress.ownerUserId}:${progress.puzzleId}'] = progress;
  }
}

class InMemoryGameHistoryRepository implements GameHistoryRepository {
  final List<GameRecord> records = <GameRecord>[];

  @override
  Future<void> addRecord(GameRecord record) async {
    records.add(record);
  }

  @override
  Future<List<GameRecord>> getRecent({
    required String ownerUserId,
    int limit = 20,
  }) async {
    return records
        .where((row) => row.ownerUserId == ownerUserId)
        .take(limit)
        .toList();
  }
}
