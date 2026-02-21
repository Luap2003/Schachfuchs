import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/shared/widgets/uci_move_mapper.dart';

void main() {
  group('UciMoveMapper', () {
    test('maps normal move from and to squares', () {
      final uci = UciMoveMapper.fromVerboseHistoryEntry(<String, dynamic>{
        'from': 'e2',
        'to': 'e4',
        'san': 'e4',
      });

      expect(uci, 'e2e4');
    });

    test('maps capture move', () {
      final uci = UciMoveMapper.fromVerboseHistoryEntry(<String, dynamic>{
        'from': 'c4',
        'to': 'f7',
        'san': 'Bxf7+',
      });

      expect(uci, 'c4f7');
    });

    test('maps castling move using king from and to', () {
      final uci = UciMoveMapper.fromVerboseHistoryEntry(<String, dynamic>{
        'from': 'e1',
        'to': 'g1',
        'san': 'O-O',
      });

      expect(uci, 'e1g1');
    });

    test('maps promotion from SAN suffix', () {
      final uci = UciMoveMapper.fromVerboseHistoryEntry(<String, dynamic>{
        'from': 'e7',
        'to': 'e8',
        'san': 'e8=Q+',
      });

      expect(uci, 'e7e8q');
    });

    test('returns null for invalid payload', () {
      final uci = UciMoveMapper.fromVerboseHistoryEntry(<String, dynamic>{
        'from': 'e7',
      });

      expect(uci, isNull);
    });
  });
}
