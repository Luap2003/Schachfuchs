// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Puzzle _$PuzzleFromJson(Map<String, dynamic> json) => _Puzzle(
  id: json['id'] as String,
  fen: json['fen'] as String,
  playerMoves: (json['playerMoves'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  opponentMoves: (json['opponentMoves'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  solutionSan: (json['solutionSan'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  themes: (json['themes'] as List<dynamic>).map((e) => e as String).toList(),
  rating: (json['rating'] as num).toInt(),
  hint: json['hint'] as String?,
  source: json['source'] as String?,
  alternateWinningMoves:
      (json['alternateWinningMoves'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$PuzzleToJson(_Puzzle instance) => <String, dynamic>{
  'id': instance.id,
  'fen': instance.fen,
  'playerMoves': instance.playerMoves,
  'opponentMoves': instance.opponentMoves,
  'solutionSan': instance.solutionSan,
  'themes': instance.themes,
  'rating': instance.rating,
  'hint': instance.hint,
  'source': instance.source,
  'alternateWinningMoves': instance.alternateWinningMoves,
};

_PuzzlePack _$PuzzlePackFromJson(Map<String, dynamic> json) => _PuzzlePack(
  packId: json['packId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  difficulty: (json['difficulty'] as num?)?.toInt() ?? 1,
  puzzles:
      (json['puzzles'] as List<dynamic>?)
          ?.map((e) => Puzzle.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Puzzle>[],
);

Map<String, dynamic> _$PuzzlePackToJson(_PuzzlePack instance) =>
    <String, dynamic>{
      'packId': instance.packId,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'tags': instance.tags,
      'difficulty': instance.difficulty,
      'puzzles': instance.puzzles,
    };
