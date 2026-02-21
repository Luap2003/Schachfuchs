import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/engine/board_state.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/engine/move_result.dart';
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
}
