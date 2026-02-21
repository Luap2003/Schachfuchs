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

  Future<void> upsertPuzzleProgress(PuzzleProgress progress);
}
