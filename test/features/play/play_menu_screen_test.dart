import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/saved_ai_game_repository.dart';
import 'package:schach_app/features/play/screens/play_menu_screen.dart';

import '../../support/fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('delete button removes saved AI game from list', (
    WidgetTester tester,
  ) async {
    final savedRepo = InMemorySavedAiGameRepository();
    final userId = 'test-user';
    final firstId = await savedRepo.createNewGame(
      ownerUserId: userId,
      skillLevel: 3,
    );
    await savedRepo.updateMoves(
      ownerUserId: userId,
      id: firstId,
      movesUci: const <String>['e2e4'],
      updatedAt: DateTime(2026, 2, 22, 12, 0),
    );

    getIt.registerSingleton<AuthRepository>(
      InMemoryAuthRepository(userId: userId),
    );
    getIt.registerSingleton<SavedAiGameRepository>(savedRepo);

    await tester.pumpWidget(const MaterialApp(home: PlayMenuScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Spiel fortsetzen'), findsOneWidget);
    expect(find.text('Leicht (3)'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline).first);
    await tester.pumpAndSettle();

    expect(find.text('Leicht (3)'), findsNothing);
    expect(await savedRepo.listByUser(ownerUserId: userId), isEmpty);
    expect(find.text('Gespeichertes Spiel gelöscht.'), findsOneWidget);
  });
}
