import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_result.freezed.dart';
part 'move_result.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum GameResultType { win, loss, draw, aborted }

@freezed
abstract class GameResult with _$GameResult {
  const factory GameResult({
    required GameResultType type,
    required String message,
  }) = _GameResult;

  factory GameResult.fromJson(Map<String, dynamic> json) =>
      _$GameResultFromJson(json);
}

@freezed
abstract class MoveResult with _$MoveResult {
  const factory MoveResult({
    required bool isLegal,
    String? playedMove,
    String? message,
    @Default(false) bool isCheck,
    @Default(false) bool isCheckmate,
    @Default(false) bool isStalemate,
    @Default(false) bool isDraw,
    String? winner,
  }) = _MoveResult;

  factory MoveResult.fromJson(Map<String, dynamic> json) =>
      _$MoveResultFromJson(json);

  factory MoveResult.illegal([String? message]) =>
      MoveResult(isLegal: false, message: message ?? 'Illegal move');
}
