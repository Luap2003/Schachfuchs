import 'package:dartchess/dartchess.dart';
import 'package:schach_app/core/engine/board_state.dart';
import 'package:schach_app/core/engine/move_result.dart';

class ChessEngine {
  Position _position = Chess.initial;
  final List<String> _sanMoves = <String>[];

  BoardState get boardState => BoardState(
    fen: _position.fen,
    turn: _position.turn.name,
    isCheck: _position.isCheck,
    isCheckmate: _position.isCheckmate,
    isStalemate: _position.isStalemate,
    isDraw: _position.outcome?.winner == null && _position.isGameOver,
  );

  MoveResult makeMove(String uciMove) {
    final move = Move.parse(uciMove);
    if (move == null) {
      return MoveResult.illegal('Invalid UCI move');
    }

    if (!_position.isLegal(move)) {
      return MoveResult.illegal('Move is not legal in this position');
    }

    try {
      final (nextPosition, san) = _position.makeSan(move);
      _sanMoves.add(san);
      _position = nextPosition;

      final winner = _position.outcome?.winner;
      return MoveResult(
        isLegal: true,
        playedMove: uciMove,
        isCheck: _position.isCheck,
        isCheckmate: _position.isCheckmate,
        isStalemate: _position.isStalemate,
        isDraw: winner == null && _position.isGameOver,
        winner: winner?.name,
      );
    } on PlayException catch (error) {
      return MoveResult.illegal(error.message);
    }
  }

  List<String> legalMovesFrom(String square) {
    final fromSquare = Square.parse(square);
    if (fromSquare == null) {
      return const <String>[];
    }

    final legalTargets = _position.legalMoves[fromSquare];
    if (legalTargets == null || legalTargets.isEmpty) {
      return const <String>[];
    }

    final role = _position.board.roleAt(fromSquare);
    final moves = <String>[];

    for (final toSquare in legalTargets.squares) {
      final moveBase = NormalMove(from: fromSquare, to: toSquare).uci;
      if (role == Role.pawn &&
          (toSquare.rank == Rank.first || toSquare.rank == Rank.eighth)) {
        for (final promotion in <String>['q', 'r', 'b', 'n']) {
          final promotionMove = '$moveBase$promotion';
          final parsed = Move.parse(promotionMove);
          if (parsed != null && _position.isLegal(parsed)) {
            moves.add(promotionMove);
          }
        }
      } else {
        moves.add(moveBase);
      }
    }

    moves.sort();
    return moves;
  }

  List<String> allLegalMoves() {
    final moves = <String>[];
    for (final entry in _position.legalMoves.entries) {
      moves.addAll(legalMovesFrom(entry.key.name));
    }
    moves.sort();
    return moves;
  }

  void loadFen(String fen) {
    final setup = Setup.parseFen(fen);
    _position = Chess.fromSetup(setup);
    _sanMoves.clear();
  }

  String exportPgn() {
    if (_sanMoves.isEmpty) {
      return '*';
    }

    final buffer = StringBuffer();
    for (var i = 0; i < _sanMoves.length; i++) {
      if (i.isEven) {
        buffer.write('${(i ~/ 2) + 1}. ');
      }
      buffer.write('${_sanMoves[i]} ');
    }
    buffer.write(Outcome.toPgnString(_position.outcome));
    return buffer.toString().trim();
  }

  void reset() {
    _position = Chess.initial;
    _sanMoves.clear();
  }
}
