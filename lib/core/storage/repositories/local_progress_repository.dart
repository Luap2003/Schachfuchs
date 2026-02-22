import 'package:drift/drift.dart';
import 'package:schach_app/core/models/progress.dart' as model;
import 'package:schach_app/core/models/sync_state.dart';
import 'package:schach_app/core/storage/database.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';

class LocalProgressRepository implements ProgressRepository {
  LocalProgressRepository(this._db);

  final AppDatabase _db;

  @override
  Future<model.LessonProgress?> getLessonProgress({
    required String ownerUserId,
    required String lessonId,
  }) async {
    final row =
        await (_db.select(_db.lessonProgresses)..where(
              (tbl) =>
                  tbl.ownerUserId.equals(ownerUserId) &
                  tbl.lessonId.equals(lessonId),
            ))
            .getSingleOrNull();

    if (row == null) {
      return null;
    }

    return model.LessonProgress(
      ownerUserId: row.ownerUserId,
      lessonId: row.lessonId,
      currentStepIndex: row.currentStepIndex,
      isCompleted: row.isCompleted,
      starsEarned: row.starsEarned,
      completedAt: row.completedAt,
      attempts: row.attempts,
      updatedAt: row.updatedAt,
      syncState: SyncStateX.fromDbValue(row.syncState),
    );
  }

  @override
  Future<void> upsertLessonProgress(model.LessonProgress progress) async {
    await _db
        .into(_db.lessonProgresses)
        .insertOnConflictUpdate(
          LessonProgressesCompanion.insert(
            ownerUserId: progress.ownerUserId,
            lessonId: progress.lessonId,
            updatedAt: progress.updatedAt,
            currentStepIndex: Value(progress.currentStepIndex),
            isCompleted: Value(progress.isCompleted),
            starsEarned: Value(progress.starsEarned),
            completedAt: Value(progress.completedAt),
            attempts: Value(progress.attempts),
            syncState: Value(progress.syncState.dbValue),
          ),
        );
  }

  @override
  Future<model.PuzzleProgress?> getPuzzleProgress({
    required String ownerUserId,
    required String puzzleId,
  }) async {
    final row =
        await (_db.select(_db.puzzleProgresses)..where(
              (tbl) =>
                  tbl.ownerUserId.equals(ownerUserId) &
                  tbl.puzzleId.equals(puzzleId),
            ))
            .getSingleOrNull();

    if (row == null) {
      return null;
    }

    return model.PuzzleProgress(
      ownerUserId: row.ownerUserId,
      puzzleId: row.puzzleId,
      packId: row.packId,
      isSolved: row.isSolved,
      bestTimeMs: row.bestTimeMs,
      hintsUsed: row.hintsUsed,
      attempts: row.attempts,
      solvedAt: row.solvedAt,
      updatedAt: row.updatedAt,
      syncState: SyncStateX.fromDbValue(row.syncState),
    );
  }

  @override
  Future<List<model.PuzzleProgress>> listPuzzleProgressByPack({
    required String ownerUserId,
    required String packId,
  }) async {
    final rows =
        await (_db.select(_db.puzzleProgresses)..where(
              (tbl) =>
                  tbl.ownerUserId.equals(ownerUserId) &
                  tbl.packId.equals(packId),
            ))
            .get();

    return rows.map(_mapPuzzleProgressRow).toList(growable: false);
  }

  @override
  Future<List<model.PuzzleProgress>> listPuzzleProgressByPacks({
    required String ownerUserId,
    required List<String> packIds,
  }) async {
    if (packIds.isEmpty) {
      return const <model.PuzzleProgress>[];
    }

    final rows =
        await (_db.select(_db.puzzleProgresses)..where(
              (tbl) =>
                  tbl.ownerUserId.equals(ownerUserId) &
                  tbl.packId.isIn(packIds),
            ))
            .get();

    return rows.map(_mapPuzzleProgressRow).toList(growable: false);
  }

  @override
  Future<void> upsertPuzzleProgress(model.PuzzleProgress progress) async {
    await _db
        .into(_db.puzzleProgresses)
        .insertOnConflictUpdate(
          PuzzleProgressesCompanion.insert(
            ownerUserId: progress.ownerUserId,
            puzzleId: progress.puzzleId,
            packId: progress.packId,
            updatedAt: progress.updatedAt,
            isSolved: Value(progress.isSolved),
            bestTimeMs: Value(progress.bestTimeMs),
            hintsUsed: Value(progress.hintsUsed),
            attempts: Value(progress.attempts),
            solvedAt: Value(progress.solvedAt),
            syncState: Value(progress.syncState.dbValue),
          ),
        );
  }

  model.PuzzleProgress _mapPuzzleProgressRow(PuzzleProgressesData row) {
    return model.PuzzleProgress(
      ownerUserId: row.ownerUserId,
      puzzleId: row.puzzleId,
      packId: row.packId,
      isSolved: row.isSolved,
      bestTimeMs: row.bestTimeMs,
      hintsUsed: row.hintsUsed,
      attempts: row.attempts,
      solvedAt: row.solvedAt,
      updatedAt: row.updatedAt,
      syncState: SyncStateX.fromDbValue(row.syncState),
    );
  }
}
