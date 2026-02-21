import 'dart:convert';

import 'package:dartchess/dartchess.dart';
import 'package:flutter/services.dart';
import 'package:schach_app/config/constants.dart';
import 'package:schach_app/core/content/content_manifest.dart';
import 'package:schach_app/core/models/lesson.dart';
import 'package:schach_app/core/models/puzzle.dart';

class ContentLoader {
  ContentLoader({this.manifestPath = AppConstants.contentManifestPath});

  final String manifestPath;

  ContentManifest? _manifestCache;

  Future<ContentManifest> loadManifest() async {
    if (_manifestCache != null) {
      return _manifestCache!;
    }

    final raw = await rootBundle.loadString(manifestPath);
    final parsed = jsonDecode(raw) as Map<String, dynamic>;
    _manifestCache = ContentManifest.fromJson(parsed);
    return _manifestCache!;
  }

  Future<Lesson> loadLessonById(String id) async {
    final manifest = await loadManifest();
    final entry = manifest.lessons.where((item) => item.id == id).firstOrNull;
    if (entry == null) {
      throw StateError('Lesson $id is missing in manifest');
    }

    final raw = await rootBundle.loadString('assets/content/${entry.file}');
    final parsed = jsonDecode(raw) as Map<String, dynamic>;
    final lesson = Lesson.fromJson(parsed);
    _verifyLesson(lesson);
    return lesson;
  }

  Future<PuzzlePack> loadPuzzlePackById(String id) async {
    final manifest = await loadManifest();
    final entry = manifest.puzzlePacks
        .where((item) => item.id == id)
        .firstOrNull;
    if (entry == null) {
      throw StateError('Puzzle pack $id is missing in manifest');
    }

    final raw = await rootBundle.loadString('assets/content/${entry.file}');
    final parsed = jsonDecode(raw) as Map<String, dynamic>;
    final pack = PuzzlePack.fromJson(parsed);
    _verifyPuzzlePack(pack);
    return pack;
  }

  Future<void> verifyContentIntegrity() async {
    final manifest = await loadManifest();

    for (final lesson in manifest.lessons) {
      await loadLessonById(lesson.id);
    }

    for (final pack in manifest.puzzlePacks) {
      await loadPuzzlePackById(pack.id);
    }
  }

  void _verifyLesson(Lesson lesson) {
    if (lesson.steps.isEmpty) {
      throw StateError('Lesson ${lesson.id} has no steps');
    }

    for (final step in lesson.steps) {
      Setup.parseFen(step.fen);
      if (step.expectedMove != null && Move.parse(step.expectedMove!) == null) {
        throw StateError(
          'Lesson ${lesson.id} step ${step.id} has invalid expectedMove',
        );
      }
      for (final move in step.acceptedMoves) {
        if (Move.parse(move) == null) {
          throw StateError(
            'Lesson ${lesson.id} step ${step.id} has invalid accepted move $move',
          );
        }
      }
    }
  }

  void _verifyPuzzlePack(PuzzlePack pack) {
    if (pack.puzzles.isEmpty) {
      throw StateError('Puzzle pack ${pack.packId} has no puzzles');
    }

    for (final puzzle in pack.puzzles) {
      Setup.parseFen(puzzle.fen);
      for (final move in puzzle.solutionMoves) {
        if (Move.parse(move) == null) {
          throw StateError(
            'Puzzle ${puzzle.id} has invalid solution move $move',
          );
        }
      }
    }
  }
}
