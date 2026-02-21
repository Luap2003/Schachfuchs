import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/engine/board_state.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/engine/move_result.dart';
import 'package:schach_app/core/models/game_record.dart';
import 'package:schach_app/core/opponent/opponent_provider.dart';
import 'package:schach_app/features/play/bloc/game_bloc.dart';

import '../../support/fakes.dart';

class FixedMoveOpponent implements OpponentProvider {
  @override
  String get displayName => 'Test AI';

  @override
  bool get requiresNetwork => false;

  @override
  Future<void> dispose() async {}

  @override
  Future<String?> getNextMove(BoardState state) async => 'e7e5';

  @override
  Future<void> onGameEnd(GameResult result) async {}

  @override
  Future<void> onGameStart(BoardState initialState) async {}
}

class ScriptedMoveOpponent implements OpponentProvider {
  ScriptedMoveOpponent(this._moves);

  final List<String> _moves;
  int _nextIndex = 0;

  @override
  String get displayName => 'Scripted AI';

  @override
  bool get requiresNetwork => false;

  @override
  Future<void> dispose() async {}

  @override
  Future<String?> getNextMove(BoardState state) async {
    if (_nextIndex >= _moves.length) {
      return null;
    }
    final nextMove = _moves[_nextIndex];
    _nextIndex += 1;
    return nextMove;
  }

  @override
  Future<void> onGameEnd(GameResult result) async {}

  @override
  Future<void> onGameStart(BoardState initialState) async {}
}

void main() {
  test('game bloc executes player and opponent move', () async {
    final gameHistory = InMemoryGameHistoryRepository();
    final bloc = GameBloc(
      engine: ChessEngine(),
      opponent: FixedMoveOpponent(),
      authRepository: InMemoryAuthRepository(),
      gameHistoryRepository: gameHistory,
    );

    await bloc.startGame();
    await bloc.playMove('e2e4');

    expect(bloc.state.boardState?.turn, 'white');
    expect(bloc.state.errorMessage, isNull);
    await bloc.close();
  });

  test('detects and handles player checkmate win', () async {
    final gameHistory = InMemoryGameHistoryRepository();
    final bloc = GameBloc(
      engine: ChessEngine(),
      opponent: ScriptedMoveOpponent(<String>['e7e5', 'b8c6', 'g8f6']),
      authRepository: InMemoryAuthRepository(),
      gameHistoryRepository: gameHistory,
    );

    await bloc.startGame();
    await bloc.playMove('e2e4');
    await bloc.playMove('d1h5');
    await bloc.playMove('f1c4');
    await bloc.playMove('h5f7');

    expect(bloc.state.status, GameStatus.finished);
    expect(bloc.state.boardState?.isCheckmate, isTrue);
    expect(bloc.state.resultMessage, 'Schachmatt! Du hast gewonnen!');
    expect(gameHistory.records.last.outcome, GameOutcome.win);
    await bloc.close();
  });

  test('detects and handles player getting checkmated', () async {
    final gameHistory = InMemoryGameHistoryRepository();
    final bloc = GameBloc(
      engine: ChessEngine(),
      opponent: ScriptedMoveOpponent(<String>['e7e5', 'd8h4']),
      authRepository: InMemoryAuthRepository(),
      gameHistoryRepository: gameHistory,
    );

    await bloc.startGame();
    await bloc.playMove('f2f3');
    await bloc.playMove('g2g4');

    expect(bloc.state.status, GameStatus.finished);
    expect(bloc.state.boardState?.isCheckmate, isTrue);
    expect(bloc.state.resultMessage, 'Schachmatt! Du wurdest mattgesetzt.');
    expect(gameHistory.records.last.outcome, GameOutcome.loss);
    await bloc.close();
  });
}
