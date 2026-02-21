import 'package:schach_app/core/engine/board_state.dart';
import 'package:schach_app/core/engine/move_result.dart';
import 'package:schach_app/core/opponent/opponent_provider.dart';

class OnlineOpponent implements OpponentProvider {
  @override
  bool get requiresNetwork => true;

  @override
  String get displayName => 'Online Opponent';

  @override
  Future<void> onGameStart(BoardState initialState) async {
    throw UnsupportedError('Online play is not enabled in offline MVP');
  }

  @override
  Future<String?> getNextMove(BoardState state) async {
    throw UnsupportedError('Online play is not enabled in offline MVP');
  }

  @override
  Future<void> onGameEnd(GameResult result) async {}

  @override
  Future<void> dispose() async {}
}
