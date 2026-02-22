import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/content/content_loader.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ContentLoader', () {
    test('loads manifest and known lesson/puzzle pack', () async {
      final loader = ContentLoader();

      final manifest = await loader.loadManifest();
      final lesson = await loader.loadLessonById('lesson_pawn');
      final pack = await loader.loadPuzzlePackById('gen_fork_600_999');
      final secondPack = await loader.loadPuzzlePackById(
        'gen_starter_mix_600_999',
      );

      expect(manifest.version, isNotEmpty);
      expect(lesson.steps, isNotEmpty);
      expect(pack.puzzles.length, equals(200));
      expect(secondPack.puzzles.length, equals(200));
    });

    test('verifies integrity without throwing', () async {
      final loader = ContentLoader();
      await loader.verifyContentIntegrity();
    });
  });
}
