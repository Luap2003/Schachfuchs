import 'package:collection/collection.dart';
import 'package:dartchess/dartchess.dart';
import 'package:schach_app/core/models/puzzle.dart';

const List<String> kSupportedPuzzleThemes = <String>[
  'fork',
  'pin',
  'skewer',
  'discoveredAttack',
  'deflection',
  'attraction',
  'sacrifice',
  'mateIn2',
];

const List<String> kThemePriority = kSupportedPuzzleThemes;

class LichessPuzzleRow {
  LichessPuzzleRow({
    required this.puzzleId,
    required this.fen,
    required this.moves,
    required this.rating,
    required this.ratingDeviation,
    required this.popularity,
    required this.nbPlays,
    required this.themes,
    required this.gameUrl,
    required this.openingTags,
  });

  final String puzzleId;
  final String fen;
  final List<String> moves;
  final int rating;
  final int ratingDeviation;
  final int popularity;
  final int nbPlays;
  final List<String> themes;
  final String gameUrl;
  final List<String> openingTags;

  static LichessPuzzleRow? fromCsvLine(String line) {
    final columns = line.split(',');
    if (columns.length != 10) {
      return null;
    }

    final rating = int.tryParse(columns[3]);
    final ratingDeviation = int.tryParse(columns[4]);
    final popularity = int.tryParse(columns[5]);
    final nbPlays = int.tryParse(columns[6]);
    if (rating == null ||
        ratingDeviation == null ||
        popularity == null ||
        nbPlays == null) {
      return null;
    }

    final moves = _splitSpaceSeparated(columns[2]);
    if (moves.length < 2 || moves.length > 12) {
      return null;
    }

    final themes = _splitSpaceSeparated(columns[7]);

    return LichessPuzzleRow(
      puzzleId: columns[0],
      fen: columns[1],
      moves: moves,
      rating: rating,
      ratingDeviation: ratingDeviation,
      popularity: popularity,
      nbPlays: nbPlays,
      themes: themes,
      gameUrl: columns[8],
      openingTags: _splitSpaceSeparated(columns[9]),
    );
  }
}

class GeneratedPuzzleCandidate {
  GeneratedPuzzleCandidate({
    required this.id,
    required this.theme,
    required this.band,
    required this.score,
    required this.puzzle,
  });

  final String id;
  final String theme;
  final String band;
  final int score;
  final Puzzle puzzle;
}

class GeneratedPuzzlePackDescriptor {
  GeneratedPuzzlePackDescriptor({
    required this.id,
    required this.file,
    required this.title,
    required this.description,
    required this.category,
    required this.difficulty,
    required this.tags,
    required this.puzzles,
  });

  final String id;
  final String file;
  final String title;
  final String description;
  final String category;
  final int difficulty;
  final List<String> tags;
  final List<Puzzle> puzzles;
}

class TopCandidateKeeper {
  TopCandidateKeeper(this.maxItems);

  final int maxItems;

  final HeapPriorityQueue<GeneratedPuzzleCandidate> _heap =
      HeapPriorityQueue<GeneratedPuzzleCandidate>(_compareQualityAscending);

  void add(GeneratedPuzzleCandidate candidate) {
    if (_heap.length < maxItems) {
      _heap.add(candidate);
      return;
    }

    final worst = _heap.first;
    if (_compareQuality(candidate, worst) > 0) {
      _heap.removeFirst();
      _heap.add(candidate);
    }
  }

  List<GeneratedPuzzleCandidate> bestDescending() {
    final items = _heap.toList();
    return items..sort(_compareQualityDescending);
  }
}

int computeCandidateScore(LichessPuzzleRow row) {
  return row.popularity * 100000 +
      row.nbPlays.clamp(0, 10000) * 10 -
      row.ratingDeviation * 50;
}

String? bandForRating(int rating) {
  if (rating >= 600 && rating <= 999) {
    return '600_999';
  }
  if (rating >= 1000 && rating <= 1399) {
    return '1000_1399';
  }
  if (rating >= 1400 && rating <= 1799) {
    return '1400_1799';
  }
  return null;
}

String? findPrimaryTheme(
  List<String> themes, {
  List<String> priority = kThemePriority,
}) {
  for (final theme in priority) {
    if (themes.contains(theme)) {
      return theme;
    }
  }
  return null;
}

GeneratedPuzzleCandidate? buildCandidate(
  LichessPuzzleRow row, {
  required Map<String, String> themeDescriptions,
}) {
  final primaryTheme = findPrimaryTheme(row.themes);
  if (primaryTheme == null) {
    return null;
  }

  final band = bandForRating(row.rating);
  if (band == null) {
    return null;
  }

  try {
    final initialSetup = Setup.parseFen(row.fen);
    final position = Chess.fromSetup(initialSetup);

    final firstMove = Move.parse(row.moves.first);
    if (firstMove == null || !position.isLegal(firstMove)) {
      return null;
    }
    final (startPosition, _) = position.makeSan(firstMove);

    final remaining = row.moves.sublist(1);
    final playerMoves = <String>[];
    final opponentMoves = <String>[];
    for (var index = 0; index < remaining.length; index++) {
      if (index.isEven) {
        playerMoves.add(remaining[index]);
      } else {
        opponentMoves.add(remaining[index]);
      }
    }

    if (playerMoves.isEmpty) {
      return null;
    }

    final solutionSan = <String>[];
    var replayPosition = startPosition;
    for (var index = 0; index < playerMoves.length; index++) {
      final playerMove = Move.parse(playerMoves[index]);
      if (playerMove == null || !replayPosition.isLegal(playerMove)) {
        return null;
      }
      final (afterPlayer, san) = replayPosition.makeSan(playerMove);
      solutionSan.add(san);
      replayPosition = afterPlayer;

      if (index < opponentMoves.length) {
        final opponentMove = Move.parse(opponentMoves[index]);
        if (opponentMove == null || !replayPosition.isLegal(opponentMove)) {
          return null;
        }
        final (afterOpponent, _) = replayPosition.makeSan(opponentMove);
        replayPosition = afterOpponent;
      }
    }

    final alternateWinningMoves = row.themes.contains('mateIn1')
        ? _findMateInOneMoves(startPosition)
        : const <String>[];

    final themeDescription = themeDescriptions[primaryTheme];
    final puzzle = Puzzle(
      id: 'lichess_${row.puzzleId}',
      fen: startPosition.fen,
      playerMoves: playerMoves,
      opponentMoves: opponentMoves,
      solutionSan: solutionSan,
      themes: row.themes,
      rating: row.rating,
      hint: themeDescription,
      source: row.gameUrl.isEmpty ? null : row.gameUrl,
      alternateWinningMoves: alternateWinningMoves,
    );

    return GeneratedPuzzleCandidate(
      id: puzzle.id,
      theme: primaryTheme,
      band: band,
      score: computeCandidateScore(row),
      puzzle: puzzle,
    );
  } catch (_) {
    return null;
  }
}

Map<String, String> parseThemeDescriptions(String xml) {
  final descriptions = <String, String>{};
  final regex = RegExp(r'<string name="([^"]+)">([^<]*)</string>');
  for (final match in regex.allMatches(xml)) {
    final name = match.group(1);
    final value = match.group(2);
    if (name == null || value == null) {
      continue;
    }
    if (name.endsWith('Description')) {
      descriptions[name.replaceFirst(RegExp(r'Description$'), '')] = value;
    }
  }
  return descriptions;
}

Map<String, String> parseThemeLabels(String xml) {
  final labels = <String, String>{};
  final regex = RegExp(r'<string name="([^"]+)">([^<]*)</string>');
  for (final match in regex.allMatches(xml)) {
    final name = match.group(1);
    final value = match.group(2);
    if (name == null || value == null) {
      continue;
    }
    if (name.endsWith('Description')) {
      continue;
    }
    labels[name] = value;
  }
  return labels;
}

List<String> _findMateInOneMoves(Position position) {
  final moves = <String>[];
  for (final moveUci in _allLegalMoves(position)) {
    final move = Move.parse(moveUci);
    if (move == null || !position.isLegal(move)) {
      continue;
    }
    final (afterMove, _) = position.makeSan(move);
    if (afterMove.isCheckmate) {
      moves.add(moveUci);
    }
  }
  moves.sort();
  return moves;
}

List<String> _allLegalMoves(Position position) {
  final moves = <String>[];
  for (final entry in position.legalMoves.entries) {
    final from = entry.key;
    final role = position.board.roleAt(from);
    final toSquares = entry.value.squares;
    for (final to in toSquares) {
      final moveBase = NormalMove(from: from, to: to).uci;
      if (role == Role.pawn &&
          (to.rank == Rank.first || to.rank == Rank.eighth)) {
        for (final promotion in <String>['q', 'r', 'b', 'n']) {
          final promotionMove = '$moveBase$promotion';
          final parsed = Move.parse(promotionMove);
          if (parsed != null && position.isLegal(parsed)) {
            moves.add(promotionMove);
          }
        }
      } else {
        moves.add(moveBase);
      }
    }
  }
  return moves;
}

List<String> _splitSpaceSeparated(String value) {
  return value
      .split(' ')
      .map((item) => item.trim())
      .where((item) => item.isNotEmpty)
      .toList(growable: false);
}

int _compareQuality(GeneratedPuzzleCandidate a, GeneratedPuzzleCandidate b) {
  if (a.score != b.score) {
    return a.score.compareTo(b.score);
  }
  return b.id.compareTo(a.id);
}

int _compareQualityAscending(
  GeneratedPuzzleCandidate a,
  GeneratedPuzzleCandidate b,
) {
  return _compareQuality(a, b);
}

int _compareQualityDescending(
  GeneratedPuzzleCandidate a,
  GeneratedPuzzleCandidate b,
) {
  return _compareQuality(b, a);
}
