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
  test(
    'game bloc executes player and opponent move and autosaves session',
    () async {
      final gameHistory = InMemoryGameHistoryRepository();
      final savedGames = InMemorySavedAiGameRepository();
      final bloc = GameBloc(
        engine: ChessEngine(),
        opponent: FixedMoveOpponent(),
        authRepository: InMemoryAuthRepository(),
        gameHistoryRepository: gameHistory,
        savedAiGameRepository: savedGames,
        skillLevel: 3,
      );

      await bloc.startGame();
      await bloc.playMove('e2e4');

      final sessions = await savedGames.listByUser(ownerUserId: 'test-user');
      final savedGame = sessions.single;

      expect(bloc.state.boardState?.turn, 'white');
      expect(bloc.state.errorMessage, isNull);
      expect(savedGame.movesUci, const <String>['e2e4', 'e7e5']);
      expect(savedGame.skillLevel, 3);
      await bloc.close();
    },
  );

  test('detects and handles player checkmate win', () async {
    final gameHistory = InMemoryGameHistoryRepository();
    final savedGames = InMemorySavedAiGameRepository();
    final bloc = GameBloc(
      engine: ChessEngine(),
      opponent: ScriptedMoveOpponent(<String>['e7e5', 'b8c6', 'g8f6']),
      authRepository: InMemoryAuthRepository(),
      gameHistoryRepository: gameHistory,
      savedAiGameRepository: savedGames,
      skillLevel: 3,
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
    expect(await savedGames.listByUser(ownerUserId: 'test-user'), isEmpty);
    await bloc.close();
  });

  test('detects and handles player getting checkmated', () async {
    final gameHistory = InMemoryGameHistoryRepository();
    final savedGames = InMemorySavedAiGameRepository();
    final bloc = GameBloc(
      engine: ChessEngine(),
      opponent: ScriptedMoveOpponent(<String>['e7e5', 'd8h4']),
      authRepository: InMemoryAuthRepository(),
      gameHistoryRepository: gameHistory,
      savedAiGameRepository: savedGames,
      skillLevel: 3,
    );

    await bloc.startGame();
    await bloc.playMove('f2f3');
    await bloc.playMove('g2g4');

    expect(bloc.state.status, GameStatus.finished);
    expect(bloc.state.boardState?.isCheckmate, isTrue);
    expect(bloc.state.resultMessage, 'Schachmatt! Du wurdest mattgesetzt.');
    expect(gameHistory.records.last.outcome, GameOutcome.loss);
    expect(await savedGames.listByUser(ownerUserId: 'test-user'), isEmpty);
    await bloc.close();
  });

  test('resumes saved game and continues from restored board', () async {
    final sharedSavedGames = InMemorySavedAiGameRepository();
    final authRepository = InMemoryAuthRepository();

    final firstBloc = GameBloc(
      engine: ChessEngine(),
      opponent: ScriptedMoveOpponent(<String>['e7e5']),
      authRepository: authRepository,
      gameHistoryRepository: InMemoryGameHistoryRepository(),
      savedAiGameRepository: sharedSavedGames,
      skillLevel: 3,
    );

    await firstBloc.startGame();
    await firstBloc.playMove('e2e4');
    final expectedFen = firstBloc.state.boardState!.fen;

    final savedSession = (await sharedSavedGames.listByUser(
      ownerUserId: 'test-user',
    )).single;
    final savedId = savedSession.id!;
    await firstBloc.close();

    final secondBloc = GameBloc(
      engine: ChessEngine(),
      opponent: ScriptedMoveOpponent(<String>['c7c5']),
      authRepository: authRepository,
      gameHistoryRepository: InMemoryGameHistoryRepository(),
      savedAiGameRepository: sharedSavedGames,
      skillLevel: 3,
    );

    await secondBloc.startGame(resumeGameId: savedId);
    expect(secondBloc.state.boardState?.fen, expectedFen);

    await secondBloc.playMove('g1f3');
    final updated = await sharedSavedGames.getById(
      ownerUserId: 'test-user',
      id: savedId,
    );
    expect(updated?.movesUci, const <String>['e2e4', 'e7e5', 'g1f3', 'c7c5']);
    await secondBloc.close();
  });

  test('missing resume id falls back to new game with error message', () async {
    final savedGames = InMemorySavedAiGameRepository();
    final bloc = GameBloc(
      engine: ChessEngine(),
      opponent: FixedMoveOpponent(),
      authRepository: InMemoryAuthRepository(),
      gameHistoryRepository: InMemoryGameHistoryRepository(),
      savedAiGameRepository: savedGames,
      skillLevel: 6,
    );

    await bloc.startGame(resumeGameId: 999);

    expect(bloc.state.status, GameStatus.ready);
    expect(bloc.state.errorMessage, isNotNull);
    final sessions = await savedGames.listByUser(ownerUserId: 'test-user');
    expect(sessions, hasLength(1));
    expect(sessions.single.skillLevel, 6);
    await bloc.close();
  });
}
