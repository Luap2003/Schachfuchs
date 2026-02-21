import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_state.freezed.dart';
part 'board_state.g.dart';

@freezed
abstract class BoardState with _$BoardState {
  const factory BoardState({
    required String fen,
    required String turn,
    @Default(false) bool isCheck,
    @Default(false) bool isCheckmate,
    @Default(false) bool isStalemate,
    @Default(false) bool isDraw,
  }) = _BoardState;

  factory BoardState.fromJson(Map<String, dynamic> json) =>
      _$BoardStateFromJson(json);
}
