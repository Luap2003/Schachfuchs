import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/content/content_loader.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ContentLoader', () {
    test('loads manifest and known lesson/puzzle pack', () async {
      final loader = ContentLoader();

      final manifest = await loader.loadManifest();
      final lesson = await loader.loadLessonById('lesson_pawn');
      final pack = await loader.loadPuzzlePackById('forks_beginner');
      final secondPack = await loader.loadPuzzlePackById('tactics_beginner_2');

      expect(manifest.version, isNotEmpty);
      expect(lesson.steps, isNotEmpty);
      expect(pack.puzzles.length, greaterThanOrEqualTo(3));
      expect(secondPack.puzzles.length, greaterThanOrEqualTo(3));
    });

    test('verifies integrity without throwing', () async {
      final loader = ContentLoader();
      await loader.verifyContentIntegrity();
    });
  });
}
