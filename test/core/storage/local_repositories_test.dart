import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/models/game_record.dart';
import 'package:schach_app/core/models/progress.dart';
import 'package:schach_app/core/storage/database.dart';
import 'package:schach_app/core/storage/repositories/local_game_history_repository.dart';
import 'package:schach_app/core/storage/repositories/local_profile_repository.dart';
import 'package:schach_app/core/storage/repositories/local_progress_repository.dart';
import 'package:schach_app/core/storage/repositories/local_saved_ai_game_repository.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('Local repositories', () {
    late AppDatabase db;

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
    });

    tearDown(() async {
      await db.close();
    });

    test('profile repository creates local user', () async {
      final repo = LocalProfileRepository(db, const Uuid());

      await repo.ensureLocalProfile();
      final profile = await repo.getActiveProfile();

      expect(profile.localUserId, isNotEmpty);
      expect(profile.remoteUserId, isNull);
    });

    test('progress repository upserts lesson and puzzle progress', () async {
      final profileRepo = LocalProfileRepository(db, const Uuid());
      await profileRepo.ensureLocalProfile();
      final profile = await profileRepo.getActiveProfile();

      final repo = LocalProgressRepository(db);
      await repo.upsertLessonProgress(
        LessonProgress(
          ownerUserId: profile.localUserId,
          lessonId: 'lesson_pawn',
          currentStepIndex: 2,
          isCompleted: false,
          starsEarned: 0,
          attempts: 1,
          updatedAt: DateTime.now(),
        ),
      );
      await repo.upsertPuzzleProgress(
        PuzzleProgress(
          ownerUserId: profile.localUserId,
          puzzleId: 'lichess_test_001',
          packId: 'gen_fork_600_999',
          isSolved: true,
          attempts: 1,
          hintsUsed: 0,
          solvedAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );

      final lesson = await repo.getLessonProgress(
        ownerUserId: profile.localUserId,
        lessonId: 'lesson_pawn',
      );
      final puzzle = await repo.getPuzzleProgress(
        ownerUserId: profile.localUserId,
        puzzleId: 'lichess_test_001',
      );

      expect(lesson?.currentStepIndex, 2);
      expect(puzzle?.isSolved, isTrue);
    });

    test('game history repository stores records', () async {
      final profileRepo = LocalProfileRepository(db, const Uuid());
      await profileRepo.ensureLocalProfile();
      final profile = await profileRepo.getActiveProfile();

      final repo = LocalGameHistoryRepository(db);
      await repo.addRecord(
        GameRecord(
          ownerUserId: profile.localUserId,
          pgn: '1. e4 e5 *',
          opponentType: 'ai',
          outcome: GameOutcome.draw,
          playedAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );

      final records = await repo.getRecent(ownerUserId: profile.localUserId);
      expect(records, hasLength(1));
    });

    test(
      'saved ai game repository stores and updates resumable games',
      () async {
        final profileRepo = LocalProfileRepository(db, const Uuid());
        await profileRepo.ensureLocalProfile();
        final profile = await profileRepo.getActiveProfile();

        final repo = LocalSavedAiGameRepository(db);
        final firstId = await repo.createNewGame(
          ownerUserId: profile.localUserId,
          skillLevel: 3,
        );
        final secondId = await repo.createNewGame(
          ownerUserId: profile.localUserId,
          skillLevel: 12,
        );

        await repo.updateMoves(
          ownerUserId: profile.localUserId,
          id: firstId,
          movesUci: const <String>['e2e4', 'e7e5'],
          updatedAt: DateTime(2026, 2, 20, 10, 0),
        );
        await repo.updateMoves(
          ownerUserId: profile.localUserId,
          id: secondId,
          movesUci: const <String>['d2d4'],
          updatedAt: DateTime(2026, 2, 20, 11, 0),
        );

        final firstGame = await repo.getById(
          ownerUserId: profile.localUserId,
          id: firstId,
        );
        expect(firstGame?.movesUci, const <String>['e2e4', 'e7e5']);

        final sorted = await repo.listByUser(ownerUserId: profile.localUserId);
        expect(sorted.map((game) => game.id), <int?>[secondId, firstId]);

        await repo.deleteById(ownerUserId: profile.localUserId, id: secondId);
        final afterDelete = await repo.listByUser(
          ownerUserId: profile.localUserId,
        );
        expect(afterDelete.map((game) => game.id), <int?>[firstId]);
      },
    );
  });
}
