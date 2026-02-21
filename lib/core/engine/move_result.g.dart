// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameResult _$GameResultFromJson(Map<String, dynamic> json) => _GameResult(
  type: $enumDecode(_$GameResultTypeEnumMap, json['type']),
  message: json['message'] as String,
);

Map<String, dynamic> _$GameResultToJson(_GameResult instance) =>
    <String, dynamic>{
      'type': _$GameResultTypeEnumMap[instance.type]!,
      'message': instance.message,
    };

const _$GameResultTypeEnumMap = {
  GameResultType.win: 'win',
  GameResultType.loss: 'loss',
  GameResultType.draw: 'draw',
  GameResultType.aborted: 'aborted',
};

_MoveResult _$MoveResultFromJson(Map<String, dynamic> json) => _MoveResult(
  isLegal: json['isLegal'] as bool,
  playedMove: json['playedMove'] as String?,
  message: json['message'] as String?,
  isCheck: json['isCheck'] as bool? ?? false,
  isCheckmate: json['isCheckmate'] as bool? ?? false,
  isStalemate: json['isStalemate'] as bool? ?? false,
  isDraw: json['isDraw'] as bool? ?? false,
  winner: json['winner'] as String?,
);

Map<String, dynamic> _$MoveResultToJson(_MoveResult instance) =>
    <String, dynamic>{
      'isLegal': instance.isLegal,
      'playedMove': instance.playedMove,
      'message': instance.message,
      'isCheck': instance.isCheck,
      'isCheckmate': instance.isCheckmate,
      'isStalemate': instance.isStalemate,
      'isDraw': instance.isDraw,
      'winner': instance.winner,
    };
