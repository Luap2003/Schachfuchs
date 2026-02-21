// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LessonProgress _$LessonProgressFromJson(Map<String, dynamic> json) =>
    _LessonProgress(
      ownerUserId: json['ownerUserId'] as String,
      lessonId: json['lessonId'] as String,
      currentStepIndex: (json['currentStepIndex'] as num?)?.toInt() ?? 0,
      isCompleted: json['isCompleted'] as bool? ?? false,
      starsEarned: (json['starsEarned'] as num?)?.toInt() ?? 0,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      attempts: (json['attempts'] as num?)?.toInt() ?? 0,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      syncState:
          $enumDecodeNullable(_$SyncStateEnumMap, json['syncState']) ??
          SyncState.localOnly,
    );

Map<String, dynamic> _$LessonProgressToJson(_LessonProgress instance) =>
    <String, dynamic>{
      'ownerUserId': instance.ownerUserId,
      'lessonId': instance.lessonId,
      'currentStepIndex': instance.currentStepIndex,
      'isCompleted': instance.isCompleted,
      'starsEarned': instance.starsEarned,
      'completedAt': instance.completedAt?.toIso8601String(),
      'attempts': instance.attempts,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncState': _$SyncStateEnumMap[instance.syncState]!,
    };

const _$SyncStateEnumMap = {
  SyncState.localOnly: 'localOnly',
  SyncState.pendingSync: 'pendingSync',
  SyncState.synced: 'synced',
  SyncState.conflict: 'conflict',
};

_PuzzleProgress _$PuzzleProgressFromJson(Map<String, dynamic> json) =>
    _PuzzleProgress(
      ownerUserId: json['ownerUserId'] as String,
      puzzleId: json['puzzleId'] as String,
      packId: json['packId'] as String,
      isSolved: json['isSolved'] as bool? ?? false,
      bestTimeMs: (json['bestTimeMs'] as num?)?.toInt(),
      hintsUsed: (json['hintsUsed'] as num?)?.toInt() ?? 0,
      attempts: (json['attempts'] as num?)?.toInt() ?? 0,
      solvedAt: json['solvedAt'] == null
          ? null
          : DateTime.parse(json['solvedAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      syncState:
          $enumDecodeNullable(_$SyncStateEnumMap, json['syncState']) ??
          SyncState.localOnly,
    );

Map<String, dynamic> _$PuzzleProgressToJson(_PuzzleProgress instance) =>
    <String, dynamic>{
      'ownerUserId': instance.ownerUserId,
      'puzzleId': instance.puzzleId,
      'packId': instance.packId,
      'isSolved': instance.isSolved,
      'bestTimeMs': instance.bestTimeMs,
      'hintsUsed': instance.hintsUsed,
      'attempts': instance.attempts,
      'solvedAt': instance.solvedAt?.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncState': _$SyncStateEnumMap[instance.syncState]!,
    };
