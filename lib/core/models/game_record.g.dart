// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameRecord _$GameRecordFromJson(Map<String, dynamic> json) => _GameRecord(
  id: (json['id'] as num?)?.toInt(),
  ownerUserId: json['ownerUserId'] as String,
  pgn: json['pgn'] as String,
  opponentType: json['opponentType'] as String,
  opponentName: json['opponentName'] as String?,
  outcome: $enumDecode(_$GameOutcomeEnumMap, json['outcome']),
  playedAt: DateTime.parse(json['playedAt'] as String),
  durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
  moveCount: (json['moveCount'] as num?)?.toInt(),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  syncState:
      $enumDecodeNullable(_$SyncStateEnumMap, json['syncState']) ??
      SyncState.localOnly,
);

Map<String, dynamic> _$GameRecordToJson(_GameRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerUserId': instance.ownerUserId,
      'pgn': instance.pgn,
      'opponentType': instance.opponentType,
      'opponentName': instance.opponentName,
      'outcome': _$GameOutcomeEnumMap[instance.outcome]!,
      'playedAt': instance.playedAt.toIso8601String(),
      'durationSeconds': instance.durationSeconds,
      'moveCount': instance.moveCount,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncState': _$SyncStateEnumMap[instance.syncState]!,
    };

const _$GameOutcomeEnumMap = {
  GameOutcome.win: 'win',
  GameOutcome.loss: 'loss',
  GameOutcome.draw: 'draw',
};

const _$SyncStateEnumMap = {
  SyncState.localOnly: 'localOnly',
  SyncState.pendingSync: 'pendingSync',
  SyncState.synced: 'synced',
  SyncState.conflict: 'conflict',
};
