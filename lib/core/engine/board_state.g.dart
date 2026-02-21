// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardState _$BoardStateFromJson(Map<String, dynamic> json) => _BoardState(
  fen: json['fen'] as String,
  turn: json['turn'] as String,
  isCheck: json['isCheck'] as bool? ?? false,
  isCheckmate: json['isCheckmate'] as bool? ?? false,
  isStalemate: json['isStalemate'] as bool? ?? false,
  isDraw: json['isDraw'] as bool? ?? false,
);

Map<String, dynamic> _$BoardStateToJson(_BoardState instance) =>
    <String, dynamic>{
      'fen': instance.fen,
      'turn': instance.turn,
      'isCheck': instance.isCheck,
      'isCheckmate': instance.isCheckmate,
      'isStalemate': instance.isStalemate,
      'isDraw': instance.isDraw,
    };
