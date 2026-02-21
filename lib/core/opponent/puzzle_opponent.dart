import 'package:schach_app/core/engine/board_state.dart';
import 'package:schach_app/core/engine/move_result.dart';
import 'package:schach_app/core/opponent/opponent_provider.dart';

class PuzzleOpponent implements OpponentProvider {
  PuzzleOpponent({required List<String> scriptedMoves})
    : _scriptedMoves = scriptedMoves;

  final List<String> _scriptedMoves;
  int _moveIndex = 0;

  @override
  String get displayName => 'Puzzle';

  @override
  bool get requiresNetwork => false;

  @override
  Future<void> onGameStart(BoardState initialState) async {
    _moveIndex = 0;
  }

  @override
  Future<String?> getNextMove(BoardState state) async {
    if (_moveIndex >= _scriptedMoves.length) {
      return null;
    }
    final move = _scriptedMoves[_moveIndex];
    _moveIndex += 1;
    return move;
  }

  @override
  Future<void> onGameEnd(GameResult result) async {}

  @override
  Future<void> dispose() async {}
}
