import 'package:schach_app/core/models/progress.dart';

abstract class ProgressRepository {
  Future<LessonProgress?> getLessonProgress({
    required String ownerUserId,
    required String lessonId,
  });

  Future<void> upsertLessonProgress(LessonProgress progress);

  Future<PuzzleProgress?> getPuzzleProgress({
    required String ownerUserId,
    required String puzzleId,
  });

  Future<List<PuzzleProgress>> listPuzzleProgressByPack({
    required String ownerUserId,
    required String packId,
  });

  Future<List<PuzzleProgress>> listPuzzleProgressByPacks({
    required String ownerUserId,
    required List<String> packIds,
  });

  Future<void> upsertPuzzleProgress(PuzzleProgress progress);
}
