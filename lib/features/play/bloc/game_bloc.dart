import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schach_app/core/engine/board_state.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/engine/move_result.dart';
import 'package:schach_app/core/models/game_record.dart';
import 'package:schach_app/core/opponent/opponent_provider.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/game_history_repository.dart';
import 'package:schach_app/core/storage/repositories/saved_ai_game_repository.dart';

part 'game_state.dart';

class GameBloc extends Cubit<GameState> {
  GameBloc({
    required ChessEngine engine,
    required OpponentProvider opponent,
    required AuthRepository authRepository,
    required GameHistoryRepository gameHistoryRepository,
    required SavedAiGameRepository savedAiGameRepository,
    required int skillLevel,
  }) : _engine = engine,
       _opponent = opponent,
       _authRepository = authRepository,
       _gameHistoryRepository = gameHistoryRepository,
       _savedAiGameRepository = savedAiGameRepository,
       _skillLevel = skillLevel,
       super(const GameState());

  final ChessEngine _engine;
  final OpponentProvider _opponent;
  final AuthRepository _authRepository;
  final GameHistoryRepository _gameHistoryRepository;
  final SavedAiGameRepository _savedAiGameRepository;
  final int _skillLevel;

  DateTime? _gameStartedAt;
  String? _ownerUserId;
  int? _savedGameId;
  List<String> _movesUci = <String>[];

  Future<void> startGame({int? resumeGameId}) async {
    _engine.reset();
    _gameStartedAt = DateTime.now();
    _movesUci = <String>[];
    _savedGameId = null;

    final userId = await _authRepository.getCurrentLocalUserId();
    _ownerUserId = userId;

    String? startError;
    final resumed = resumeGameId == null
        ? false
        : await _tryResumeGame(userId, resumeGameId);

    if (!resumed) {
      if (resumeGameId != null) {
        startError =
            'Gespeichertes Spiel konnte nicht geladen werden. Neues Spiel gestartet.';
      }
      _engine.reset();
      await _createNewSavedGame(userId);
    }

    await _persistSavedGameState();
    final board = _engine.boardState;
    await _opponent.onGameStart(board);

    emit(
      state.copyWith(
        status: GameStatus.ready,
        boardState: board,
        legalMoves: _engine.allLegalMoves(),
        opponentName: _opponent.displayName,
        clearMessages: startError == null,
        errorMessage: startError,
      ),
    );
  }

  Future<void> playMove(String move) async {
    if (state.isOpponentThinking || state.status == GameStatus.finished) {
      return;
    }

    final playerResult = _engine.makeMove(move);
    if (!playerResult.isLegal) {
      emit(
        state.copyWith(errorMessage: playerResult.message ?? 'Illegal move'),
      );
      return;
    }
    await _appendMoveAndPersist(move);

    emit(
      state.copyWith(
        boardState: _engine.boardState,
        legalMoves: _engine.allLegalMoves(),
        clearMessages: true,
      ),
    );

    if (_isGameOver(playerResult)) {
      await _finishGame(
        playerResult,
        playerWon: playerResult.winner == 'white',
      );
      return;
    }

    emit(state.copyWith(isOpponentThinking: true));
    final opponentMove = await _opponent.getNextMove(_engine.boardState);

    if (opponentMove == null) {
      emit(state.copyWith(isOpponentThinking: false));
      return;
    }

    final opponentResult = _engine.makeMove(opponentMove);
    if (!opponentResult.isLegal) {
      emit(
        state.copyWith(
          isOpponentThinking: false,
          errorMessage: opponentResult.message ?? 'Ungueltiger KI-Zug',
        ),
      );
      return;
    }
    await _appendMoveAndPersist(opponentMove);
    emit(
      state.copyWith(
        boardState: _engine.boardState,
        legalMoves: _engine.allLegalMoves(),
        isOpponentThinking: false,
      ),
    );

    if (_isGameOver(opponentResult)) {
      await _finishGame(
        opponentResult,
        playerWon: opponentResult.winner == 'white',
      );
    }
  }

  bool _isGameOver(MoveResult result) {
    return result.isCheckmate || result.isStalemate || result.isDraw;
  }

  Future<void> _finishGame(MoveResult result, {required bool playerWon}) async {
    final gameResult = _resultFromMoveResult(result, playerWon: playerWon);

    await _opponent.onGameEnd(gameResult);
    final userId = await _authRepository.getCurrentLocalUserId();
    final duration = _gameStartedAt == null
        ? null
        : DateTime.now().difference(_gameStartedAt!).inSeconds;

    final outcome = switch (gameResult.type) {
      GameResultType.win => GameOutcome.win,
      GameResultType.loss => GameOutcome.loss,
      GameResultType.draw => GameOutcome.draw,
      GameResultType.aborted => GameOutcome.draw,
    };

    await _gameHistoryRepository.addRecord(
      GameRecord(
        ownerUserId: userId,
        pgn: _engine.exportPgn(),
        opponentType: 'ai',
        opponentName: _opponent.displayName,
        outcome: outcome,
        playedAt: DateTime.now(),
        durationSeconds: duration,
        moveCount: _engine.allLegalMoves().length,
        updatedAt: DateTime.now(),
      ),
    );
    await _deleteSavedGame();

    emit(
      state.copyWith(
        status: GameStatus.finished,
        resultMessage: gameResult.message,
        isOpponentThinking: false,
      ),
    );
  }

  GameResult _resultFromMoveResult(
    MoveResult result, {
    required bool playerWon,
  }) {
    if (result.isCheckmate) {
      return playerWon
          ? const GameResult(
              type: GameResultType.win,
              message: 'Schachmatt! Du hast gewonnen!',
            )
          : const GameResult(
              type: GameResultType.loss,
              message: 'Schachmatt! Du wurdest mattgesetzt.',
            );
    }

    if (result.isStalemate) {
      return const GameResult(
        type: GameResultType.draw,
        message: 'Patt! Unentschieden!',
      );
    }

    if (result.isDraw) {
      return const GameResult(
        type: GameResultType.draw,
        message: 'Unentschieden!',
      );
    }

    return playerWon
        ? const GameResult(
            type: GameResultType.win,
            message: 'Du hast gewonnen!',
          )
        : const GameResult(
            type: GameResultType.loss,
            message: 'Versuch es nochmal!',
          );
  }

  Future<void> _appendMoveAndPersist(String moveUci) async {
    _movesUci.add(moveUci);
    await _persistSavedGameState();
  }

  Future<void> _createNewSavedGame(String ownerUserId) async {
    _savedGameId = await _savedAiGameRepository.createNewGame(
      ownerUserId: ownerUserId,
      skillLevel: _skillLevel,
    );
    _movesUci = <String>[];
  }

  Future<bool> _tryResumeGame(String ownerUserId, int resumeGameId) async {
    final saved = await _savedAiGameRepository.getById(
      ownerUserId: ownerUserId,
      id: resumeGameId,
    );
    if (saved == null || saved.id == null) {
      return false;
    }

    _engine.reset();
    final restoredMoves = <String>[];
    for (final move in saved.movesUci) {
      final moveResult = _engine.makeMove(move);
      if (!moveResult.isLegal) {
        _engine.reset();
        _movesUci = <String>[];
        _savedGameId = null;
        return false;
      }
      restoredMoves.add(move);
    }

    _savedGameId = saved.id;
    _movesUci = restoredMoves;
    return true;
  }

  Future<void> _persistSavedGameState() async {
    final ownerUserId = _ownerUserId;
    final savedGameId = _savedGameId;
    if (ownerUserId == null || savedGameId == null) {
      return;
    }
    await _savedAiGameRepository.updateMoves(
      ownerUserId: ownerUserId,
      id: savedGameId,
      movesUci: _movesUci,
      updatedAt: DateTime.now(),
    );
  }

  Future<void> _deleteSavedGame() async {
    final ownerUserId = _ownerUserId;
    final savedGameId = _savedGameId;
    _savedGameId = null;
    _movesUci = <String>[];
    if (ownerUserId == null || savedGameId == null) {
      return;
    }
    await _savedAiGameRepository.deleteById(
      ownerUserId: ownerUserId,
      id: savedGameId,
    );
  }

  @override
  Future<void> close() async {
    await _opponent.dispose();
    return super.close();
  }
}
