import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/engine/chess_engine.dart';

void main() {
  group('ChessEngine', () {
    test('accepts legal move from initial position', () {
      final engine = ChessEngine();

      final result = engine.makeMove('e2e4');

      expect(result.isLegal, isTrue);
      expect(engine.boardState.turn, 'black');
    });

    test('rejects illegal move', () {
      final engine = ChessEngine();

      final result = engine.makeMove('e2e5');

      expect(result.isLegal, isFalse);
    });

    test('detects checkmate from loaded position', () {
      final engine = ChessEngine();
      engine.loadFen(
        'r1bqkb1r/pppp1ppp/2n2n2/4p2Q/2B1P3/8/PPPP1PPP/RNB1K1NR w KQkq - 0 1',
      );

      final result = engine.makeMove('h5f7');

      expect(result.isLegal, isTrue);
      expect(result.isCheckmate, isTrue);
      expect(result.winner, 'white');
    });
  });
}
