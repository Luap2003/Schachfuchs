import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/models/progress.dart';
import 'package:schach_app/core/models/puzzle.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';
import 'package:schach_app/features/puzzles/screens/puzzle_player_screen.dart';

import '../../support/fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('index drawer filters and jumps to selected puzzle', (
    WidgetTester tester,
  ) async {
    final progressRepo = InMemoryProgressRepository();
    await progressRepo.upsertPuzzleProgress(
      PuzzleProgress(
        ownerUserId: 'test-user',
        puzzleId: 'puzzle_1',
        packId: 'pack_ui',
        isSolved: false,
        attempts: 2,
        updatedAt: DateTime(2026, 2, 1),
      ),
    );
    await progressRepo.upsertPuzzleProgress(
      PuzzleProgress(
        ownerUserId: 'test-user',
        puzzleId: 'puzzle_2',
        packId: 'pack_ui',
        isSolved: true,
        attempts: 1,
        solvedAt: DateTime(2026, 2, 1),
        updatedAt: DateTime(2026, 2, 1),
      ),
    );

    getIt.registerSingleton<ContentLoader>(
      _FakePackLoader(
        const PuzzlePack(
          packId: 'pack_ui',
          title: 'Pack UI',
          description: 'pack',
          category: 'test',
          puzzles: <Puzzle>[
            Puzzle(
              id: 'puzzle_1',
              fen: '3r4/ppk2pp1/2p1p3/4b3/P3n1P1/8/KPP2PN1/3rBR1R w - - 3 32',
              playerMoves: <String>['e1a5', 'f1d1'],
              opponentMoves: <String>['b7b6'],
              solutionSan: <String>['Ba5+', 'Rd1'],
              themes: <String>['discoveredAttack'],
              rating: 998,
            ),
            Puzzle(
              id: 'puzzle_2',
              fen: '7k/5Q2/6K1/8/8/8/8/8 w - - 0 1',
              playerMoves: <String>['f7f8'],
              opponentMoves: <String>[],
              solutionSan: <String>['Qf8#'],
              themes: <String>['mate'],
              rating: 900,
            ),
            Puzzle(
              id: 'puzzle_3',
              fen: '8/4B1kp/4p1p1/1p4P1/7P/5PK1/1r6/8 w - - 0 40',
              playerMoves: <String>['e7f6', 'f6b2'],
              opponentMoves: <String>['g7f7'],
              solutionSan: <String>['Bf6+', 'Bxb2'],
              themes: <String>['fork'],
              rating: 858,
            ),
          ],
        ),
      ),
    );
    getIt.registerFactory<ChessEngine>(ChessEngine.new);
    getIt.registerSingleton<ProgressRepository>(progressRepo);
    getIt.registerSingleton<AuthRepository>(InMemoryAuthRepository());

    await tester.pumpWidget(
      const MaterialApp(home: PuzzlePlayerScreen(packId: 'pack_ui')),
    );
    await tester.pumpAndSettle();

    expect(find.text('Aufgabe 1/3'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.list_alt));
    await tester.pumpAndSettle();
    expect(find.text('Puzzle Index'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilterChip, 'Gelöst'));
    await tester.pumpAndSettle();
    expect(find.text('#2'), findsOneWidget);
    expect(find.text('#1'), findsNothing);

    await tester.tap(find.widgetWithText(FilterChip, 'Alle'));
    await tester.pumpAndSettle();
    expect(find.text('#1'), findsOneWidget);
    expect(find.text('#2'), findsOneWidget);
    expect(find.text('#3'), findsOneWidget);

    await tester.tap(find.text('#3'));
    await tester.pumpAndSettle();
    expect(find.text('Aufgabe 3/3'), findsOneWidget);
  });
}

class _FakePackLoader extends ContentLoader {
  _FakePackLoader(this._pack);

  final PuzzlePack _pack;

  @override
  Future<PuzzlePack> loadPuzzlePackById(String id) async => _pack;
}
