import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/content/content_manifest.dart';
import 'package:schach_app/core/models/progress.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';
import 'package:schach_app/features/puzzles/screens/puzzle_menu_screen.dart';

import '../../support/fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('menu shows segmented progress summary for pack', (
    WidgetTester tester,
  ) async {
    final progressRepo = InMemoryProgressRepository();
    await progressRepo.upsertPuzzleProgress(
      PuzzleProgress(
        ownerUserId: 'test-user',
        puzzleId: 'p_1',
        packId: 'pack_a',
        isSolved: true,
        attempts: 1,
        solvedAt: DateTime(2026, 2, 1),
        updatedAt: DateTime(2026, 2, 1),
      ),
    );
    await progressRepo.upsertPuzzleProgress(
      PuzzleProgress(
        ownerUserId: 'test-user',
        puzzleId: 'p_2',
        packId: 'pack_a',
        isSolved: false,
        attempts: 2,
        updatedAt: DateTime(2026, 2, 1),
      ),
    );

    getIt.registerSingleton<ContentLoader>(
      _FakeContentLoader(
        const ContentManifest(
          version: '2.0.0',
          lessons: <ContentIndexEntry>[],
          puzzlePacks: <ContentIndexEntry>[
            ContentIndexEntry(
              id: 'pack_a',
              file: 'puzzles/generated/pack_a.json',
              version: 2,
              count: 3,
              title: 'Pack A',
              category: 'theme_training',
              difficulty: 1,
            ),
          ],
        ),
      ),
    );
    getIt.registerSingleton<AuthRepository>(InMemoryAuthRepository());
    getIt.registerSingleton<ProgressRepository>(progressRepo);

    await tester.pumpWidget(const MaterialApp(home: PuzzleMenuScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Pack A'), findsOneWidget);
    expect(find.text('1/3 gelöst · 1 versucht · 1 offen'), findsOneWidget);
  });
}

class _FakeContentLoader extends ContentLoader {
  _FakeContentLoader(this._manifest);

  final ContentManifest _manifest;

  @override
  Future<ContentManifest> loadManifest() async => _manifest;
}
