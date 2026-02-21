import 'dart:async';

import 'package:schach_app/core/engine/board_state.dart';
import 'package:schach_app/core/engine/move_result.dart';
import 'package:schach_app/core/opponent/opponent_provider.dart';
import 'package:stockfish/stockfish.dart';

class AiOpponent implements OpponentProvider {
  AiOpponent({this.skillLevel = 3, this.moveTimeMs = 900});

  final int skillLevel;
  final int moveTimeMs;

  Stockfish? _stockfish;
  StreamSubscription<String>? _stdoutSubscription;
  Completer<String?>? _pendingMove;
  Timer? _moveTimeout;

  @override
  String get displayName => _nameForLevel(skillLevel);

  @override
  bool get requiresNetwork => false;

  @override
  Future<void> onGameStart(BoardState initialState) async {
    await _ensureEngine();
    _send('ucinewgame');
    _send('isready');
  }

  @override
  Future<String?> getNextMove(BoardState state) async {
    await _ensureEngine();

    if (_pendingMove != null && !_pendingMove!.isCompleted) {
      return _pendingMove!.future;
    }

    final completer = Completer<String?>();
    _pendingMove = completer;
    _moveTimeout?.cancel();
    _moveTimeout = Timer(Duration(milliseconds: moveTimeMs * 3), () {
      if (!completer.isCompleted) {
        completer.complete(null);
      }
    });

    _send('position fen ${state.fen}');
    _send('go movetime $moveTimeMs');

    return completer.future;
  }

  @override
  Future<void> onGameEnd(GameResult result) async {
    _send('stop');
  }

  @override
  Future<void> dispose() async {
    _moveTimeout?.cancel();
    _moveTimeout = null;

    await _stdoutSubscription?.cancel();
    _stdoutSubscription = null;

    final stockfish = _stockfish;
    _stockfish = null;
    if (stockfish != null) {
      try {
        stockfish.dispose();
      } catch (_) {
        // No-op: we only need best effort cleanup here.
      }
    }
  }

  Future<void> _ensureEngine() async {
    if (_stockfish != null) {
      return;
    }

    final engine = await stockfishAsync();
    _stockfish = engine;

    _stdoutSubscription = engine.stdout.listen((line) {
      final pending = _pendingMove;
      if (pending == null || pending.isCompleted) {
        return;
      }

      if (!line.startsWith('bestmove')) {
        return;
      }

      final parts = line.trim().split(' ');
      final bestMove = parts.length > 1 ? parts[1] : '(none)';
      pending.complete(bestMove == '(none)' ? null : bestMove);
      _moveTimeout?.cancel();
      _pendingMove = null;
    });

    _send('uci');
    _send('setoption name Skill Level value $skillLevel');
  }

  void _send(String command) {
    final stockfish = _stockfish;
    if (stockfish == null) {
      return;
    }
    stockfish.stdin = command;
  }

  String _nameForLevel(int level) {
    if (level <= 3) {
      return 'Friendly Pawn';
    }
    if (level <= 6) {
      return 'Clever Knight';
    }
    if (level <= 12) {
      return 'Mighty Rook';
    }
    return 'Grand Queen';
  }
}
