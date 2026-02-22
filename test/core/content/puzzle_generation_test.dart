import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/content/puzzle_generation.dart';
import 'package:schach_app/core/models/puzzle.dart';

void main() {
  test('parses lichess csv row and computes candidate', () {
    const line =
        '00sO1,1k1r4/pp3pp1/2p1p3/4b3/P3n1P1/8/KPP2PN1/3rBR1R b - - 2 31,b8c7 e1a5 b7b6 f1d1,998,85,94,293,advantage discoveredAttack master middlegame short,https://lichess.org/vsfFkG0s/black#62,';
    final row = LichessPuzzleRow.fromCsvLine(line);

    expect(row, isNotNull);
    final candidate = buildCandidate(
      row!,
      themeDescriptions: const <String, String>{
        'discoveredAttack': 'Discovered attack hint',
      },
    );

    expect(candidate, isNotNull);
    expect(candidate!.theme, 'discoveredAttack');
    expect(candidate.band, '600_999');
    expect(
      candidate.puzzle.fen,
      '3r4/ppk2pp1/2p1p3/4b3/P3n1P1/8/KPP2PN1/3rBR1R w - - 3 32',
    );
    expect(candidate.puzzle.playerMoves, <String>['e1a5', 'f1d1']);
    expect(candidate.puzzle.opponentMoves, <String>['b7b6']);
    expect(candidate.puzzle.solutionSan.length, 2);
  });

  test('mate in one candidate computes alternate winning moves', () {
    const line =
        'mateA,6k1/5Q2/6K1/8/8/8/8/8 b - - 0 1,g8h8 f7f8,900,60,90,500,fork mate mateIn1 short,https://lichess.org/example,';
    final row = LichessPuzzleRow.fromCsvLine(line);
    final candidate = buildCandidate(
      row!,
      themeDescriptions: const <String, String>{'mateIn2': 'Mate in 2'},
    );

    expect(candidate, isNotNull);
    expect(candidate!.puzzle.alternateWinningMoves, isNotEmpty);
    expect(
      candidate.puzzle.alternateWinningMoves,
      contains(candidate.puzzle.playerMoves.first),
    );
  });

  test('top keeper keeps best score and tie breaks by lower id', () {
    const basePuzzle = Puzzle(
      id: 'stub',
      fen: '7k/5Q2/6K1/8/8/8/8/8 w - - 0 1',
      playerMoves: <String>['f7f8'],
      opponentMoves: <String>[],
      solutionSan: <String>['Qf8#'],
      themes: <String>['mate'],
      rating: 900,
    );
    final keeper = TopCandidateKeeper(2);

    keeper.add(
      GeneratedPuzzleCandidate(
        id: 'lichess_c',
        theme: 'fork',
        band: '600_999',
        score: 100,
        puzzle: basePuzzle,
      ),
    );
    keeper.add(
      GeneratedPuzzleCandidate(
        id: 'lichess_b',
        theme: 'fork',
        band: '600_999',
        score: 100,
        puzzle: basePuzzle,
      ),
    );
    keeper.add(
      GeneratedPuzzleCandidate(
        id: 'lichess_a',
        theme: 'fork',
        band: '600_999',
        score: 101,
        puzzle: basePuzzle,
      ),
    );

    final best = keeper.bestDescending();
    expect(best.map((candidate) => candidate.id).toList(), <String>[
      'lichess_a',
      'lichess_b',
    ]);
  });
}
