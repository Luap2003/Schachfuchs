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
      final setup = Setup.parseFen(puzzle.fen);
      Position position = Chess.fromSetup(setup);
      final startPosition = position;

      if (puzzle.playerMoves.isEmpty) {
        throw StateError('Puzzle ${puzzle.id} has no player moves');
      }

      if (puzzle.solutionSan.length != puzzle.playerMoves.length) {
        throw StateError(
          'Puzzle ${puzzle.id} has SAN length mismatch: expected ${puzzle.playerMoves.length}, found ${puzzle.solutionSan.length}',
        );
      }

      for (var index = 0; index < puzzle.playerMoves.length; index++) {
        final playerMove = Move.parse(puzzle.playerMoves[index]);
        if (playerMove == null || !position.isLegal(playerMove)) {
          throw StateError(
            'Puzzle ${puzzle.id} has illegal player move ${puzzle.playerMoves[index]} at ply $index',
          );
        }

        final (afterPlayer, _) = position.makeSan(playerMove);
        position = afterPlayer;

        if (index < puzzle.opponentMoves.length) {
          final opponentMove = Move.parse(puzzle.opponentMoves[index]);
          if (opponentMove == null || !position.isLegal(opponentMove)) {
            throw StateError(
              'Puzzle ${puzzle.id} has illegal opponent move ${puzzle.opponentMoves[index]} at ply $index',
            );
          }
          final (afterOpponent, _) = position.makeSan(opponentMove);
          position = afterOpponent;
        }
      }

      if (puzzle.opponentMoves.length > puzzle.playerMoves.length - 1) {
        throw StateError(
          'Puzzle ${puzzle.id} has too many opponent replies (${puzzle.opponentMoves.length})',
        );
      }

      for (final move in puzzle.alternateWinningMoves) {
        final parsed = Move.parse(move);
        if (parsed == null || !startPosition.isLegal(parsed)) {
          throw StateError(
            'Puzzle ${puzzle.id} has illegal alternate winning move $move',
          );
        }
        final (afterAlternate, _) = startPosition.makeSan(parsed);
        if (!afterAlternate.isCheckmate) {
          throw StateError(
            'Puzzle ${puzzle.id} alternate move $move is not checkmate',
          );
        }
      }
    }
  }
}
