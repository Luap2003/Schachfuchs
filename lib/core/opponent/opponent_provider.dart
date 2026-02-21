import 'package:schach_app/core/engine/board_state.dart';
import 'package:schach_app/core/engine/move_result.dart';

abstract class OpponentProvider {
  Future<String?> getNextMove(BoardState state);

  Future<void> onGameStart(BoardState initialState);

  Future<void> onGameEnd(GameResult result);

  Future<void> dispose();

  bool get requiresNetwork => false;

  String get displayName;
}
