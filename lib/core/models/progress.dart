import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:schach_app/core/models/sync_state.dart';

part 'progress.freezed.dart';
part 'progress.g.dart';

@freezed
abstract class LessonProgress with _$LessonProgress {
  const factory LessonProgress({
    required String ownerUserId,
    required String lessonId,
    @Default(0) int currentStepIndex,
    @Default(false) bool isCompleted,
    @Default(0) int starsEarned,
    DateTime? completedAt,
    @Default(0) int attempts,
    required DateTime updatedAt,
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _LessonProgress;

  factory LessonProgress.fromJson(Map<String, dynamic> json) =>
      _$LessonProgressFromJson(json);
}

@freezed
abstract class PuzzleProgress with _$PuzzleProgress {
  const factory PuzzleProgress({
    required String ownerUserId,
    required String puzzleId,
    required String packId,
    @Default(false) bool isSolved,
    int? bestTimeMs,
    @Default(0) int hintsUsed,
    @Default(0) int attempts,
    DateTime? solvedAt,
    required DateTime updatedAt,
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _PuzzleProgress;

  factory PuzzleProgress.fromJson(Map<String, dynamic> json) =>
      _$PuzzleProgressFromJson(json);
}
