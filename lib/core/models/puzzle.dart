import 'package:freezed_annotation/freezed_annotation.dart';

part 'puzzle.freezed.dart';
part 'puzzle.g.dart';

@freezed
abstract class Puzzle with _$Puzzle {
  const factory Puzzle({
    required String id,
    required String fen,
    required List<String> solutionMoves,
    required String firstMoveBy,
    String? hint,
    @Default('tactic') String theme,
    @Default(600) int rating,
  }) = _Puzzle;

  factory Puzzle.fromJson(Map<String, dynamic> json) => _$PuzzleFromJson(json);
}

@freezed
abstract class PuzzlePack with _$PuzzlePack {
  const factory PuzzlePack({
    required String packId,
    required String title,
    required String description,
    required String category,
    @Default(<String>[]) List<String> tags,
    @Default(1) int difficulty,
    @Default(<Puzzle>[]) List<Puzzle> puzzles,
  }) = _PuzzlePack;

  factory PuzzlePack.fromJson(Map<String, dynamic> json) =>
      _$PuzzlePackFromJson(json);
}
