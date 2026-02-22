import 'package:schach_app/core/models/game_record.dart';
import 'package:schach_app/core/models/progress.dart';
import 'package:schach_app/core/models/saved_ai_game.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/game_history_repository.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';
import 'package:schach_app/core/storage/repositories/saved_ai_game_repository.dart';

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
  Future<List<PuzzleProgress>> listPuzzleProgressByPack({
    required String ownerUserId,
    required String packId,
  }) async {
    return _puzzle.values
        .where((row) => row.ownerUserId == ownerUserId && row.packId == packId)
        .toList(growable: false);
  }

  @override
  Future<List<PuzzleProgress>> listPuzzleProgressByPacks({
    required String ownerUserId,
    required List<String> packIds,
  }) async {
    if (packIds.isEmpty) {
      return const <PuzzleProgress>[];
    }
    final ids = packIds.toSet();
    return _puzzle.values
        .where(
          (row) => row.ownerUserId == ownerUserId && ids.contains(row.packId),
        )
        .toList(growable: false);
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

class InMemorySavedAiGameRepository implements SavedAiGameRepository {
  final Map<int, SavedAiGame> _savedGames = <int, SavedAiGame>{};
  int _nextId = 1;

  @override
  Future<int> createNewGame({
    required String ownerUserId,
    required int skillLevel,
  }) async {
    final id = _nextId++;
    final now = DateTime.now();
    _savedGames[id] = SavedAiGame(
      id: id,
      ownerUserId: ownerUserId,
      skillLevel: skillLevel,
      createdAt: now,
      updatedAt: now,
    );
    return id;
  }

  @override
  Future<SavedAiGame?> getById({
    required String ownerUserId,
    required int id,
  }) async {
    final game = _savedGames[id];
    if (game == null || game.ownerUserId != ownerUserId) {
      return null;
    }
    return game;
  }

  @override
  Future<List<SavedAiGame>> listByUser({
    required String ownerUserId,
    int limit = 50,
  }) async {
    final games =
        _savedGames.values
            .where((game) => game.ownerUserId == ownerUserId)
            .toList(growable: false)
          ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    if (games.length <= limit) {
      return games;
    }
    return games.take(limit).toList(growable: false);
  }

  @override
  Future<void> updateMoves({
    required String ownerUserId,
    required int id,
    required List<String> movesUci,
    required DateTime updatedAt,
  }) async {
    final existing = _savedGames[id];
    if (existing == null || existing.ownerUserId != ownerUserId) {
      return;
    }
    _savedGames[id] = existing.copyWith(
      movesUci: movesUci,
      updatedAt: updatedAt,
    );
  }

  @override
  Future<void> deleteById({
    required String ownerUserId,
    required int id,
  }) async {
    final existing = _savedGames[id];
    if (existing == null || existing.ownerUserId != ownerUserId) {
      return;
    }
    _savedGames.remove(id);
  }
}
