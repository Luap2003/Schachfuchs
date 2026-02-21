// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_ai_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedAiGame _$SavedAiGameFromJson(Map<String, dynamic> json) => _SavedAiGame(
  id: (json['id'] as num?)?.toInt(),
  ownerUserId: json['ownerUserId'] as String,
  skillLevel: (json['skillLevel'] as num).toInt(),
  movesUci:
      (json['movesUci'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  syncState:
      $enumDecodeNullable(_$SyncStateEnumMap, json['syncState']) ??
      SyncState.localOnly,
);

Map<String, dynamic> _$SavedAiGameToJson(_SavedAiGame instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerUserId': instance.ownerUserId,
      'skillLevel': instance.skillLevel,
      'movesUci': instance.movesUci,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncState': _$SyncStateEnumMap[instance.syncState]!,
    };

const _$SyncStateEnumMap = {
  SyncState.localOnly: 'localOnly',
  SyncState.pendingSync: 'pendingSync',
  SyncState.synced: 'synced',
  SyncState.conflict: 'conflict',
};
