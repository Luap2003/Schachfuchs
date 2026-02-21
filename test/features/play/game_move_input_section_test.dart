import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/features/play/widgets/game_move_input_section.dart';

void main() {
  testWidgets('hides manual dropdown when debug fallback is disabled', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GameMoveInputSection(
            legalMoves: const <String>['e2e4'],
            isInputLocked: false,
            onMove: (_) {},
          ),
        ),
      ),
    );

    expect(find.byType(DropdownButtonFormField<String>), findsNothing);
  });
}
