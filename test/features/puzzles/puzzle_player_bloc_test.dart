import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/models/progress.dart';
import 'package:schach_app/core/models/puzzle.dart';
import 'package:schach_app/core/models/puzzle_progress_view.dart';
import 'package:schach_app/features/puzzles/bloc/puzzle_player_bloc.dart';

import '../../support/fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('puzzle bloc marks puzzle solved for expected drag move', () async {
    final bloc = PuzzlePlayerBloc(
      contentLoader: ContentLoader(),
      engine: ChessEngine(),
      progressRepository: InMemoryProgressRepository(),
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadPack('gen_fork_600_999');
    final puzzle = bloc.state.currentPuzzle!;

    for (var index = 0; index < puzzle.playerMoves.length; index++) {
      final expectedMove = puzzle.playerMoves[index];
      await bloc.onUserMove(expectedMove);
    }

    expect(bloc.state.currentPlayerMoveIndex, puzzle.playerMoves.length);
    expect(bloc.state.solved, isTrue);
    await bloc.close();
  });

  test('wrong legal move keeps moved board and feedback', () async {
    final bloc = PuzzlePlayerBloc(
      contentLoader: ContentLoader(),
      engine: ChessEngine(),
      progressRepository: InMemoryProgressRepository(),
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadPack('gen_fork_600_999');
    final initialFen = bloc.state.boardFen;
    final expectedMove = bloc.state.currentPuzzle!.playerMoves.first;
    final wrongMove = bloc.state.legalMoves.firstWhere(
      (move) => move != expectedMove,
    );

    await bloc.onUserMove(wrongMove);

    expect(bloc.state.solved, isFalse);
    expect(bloc.state.feedback, isNotNull);
    expect(bloc.state.boardFen, isNot(initialFen));
    expect(bloc.state.currentPlayerMoveIndex, 0);

    bloc.resetCurrentPuzzlePosition();
    expect(bloc.state.boardFen, initialFen);
    expect(bloc.state.currentPlayerMoveIndex, 0);
    await bloc.close();
  });

  test('completed puzzle pack can be restarted from beginning', () async {
    final bloc = PuzzlePlayerBloc(
      contentLoader: ContentLoader(),
      engine: ChessEngine(),
      progressRepository: InMemoryProgressRepository(),
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadPack('gen_fork_600_999');
    final totalPuzzles = bloc.state.pack!.puzzles.length;
    for (var index = 0; index < totalPuzzles; index++) {
      final puzzle = bloc.state.currentPuzzle!;
      for (final expectedMove in puzzle.playerMoves) {
        await bloc.onUserMove(expectedMove);
      }
      await bloc.nextPuzzle();
    }

    expect(bloc.state.status, PuzzlePlayerStatus.ready);
    expect(bloc.state.feedback, contains('Ende erreicht'));

    await bloc.restartPackFromBeginning();

    expect(bloc.state.status, PuzzlePlayerStatus.ready);
    expect(bloc.state.puzzleIndex, 0);
    expect(bloc.state.solved, isFalse);
    expect(bloc.state.currentPuzzle?.id, bloc.state.pack!.puzzles.first.id);
    await bloc.close();
  });

  test('load pack starts at first unsolved puzzle', () async {
    const puzzleA = Puzzle(
      id: 'puzzle_a',
      fen: '3r4/ppk2pp1/2p1p3/4b3/P3n1P1/8/KPP2PN1/3rBR1R w - - 3 32',
      playerMoves: <String>['e1a5', 'f1d1'],
      opponentMoves: <String>['b7b6'],
      solutionSan: <String>['Ba5+', 'Rd1'],
      themes: <String>['discoveredAttack'],
      rating: 998,
    );
    const puzzleB = Puzzle(
      id: 'puzzle_b',
      fen: '7k/5Q2/6K1/8/8/8/8/8 w - - 0 1',
      playerMoves: <String>['f7f8'],
      opponentMoves: <String>[],
      solutionSan: <String>['Qf8#'],
      themes: <String>['mate'],
      rating: 900,
    );
    const puzzleC = Puzzle(
      id: 'puzzle_c',
      fen: '8/4B1kp/4p1p1/1p4P1/7P/5PK1/1r6/8 w - - 0 40',
      playerMoves: <String>['e7f6', 'f6b2'],
      opponentMoves: <String>['g7f7'],
      solutionSan: <String>['Bf6+', 'Bxb2'],
      themes: <String>['fork'],
      rating: 858,
    );
    final progressRepository = InMemoryProgressRepository();
    await progressRepository.upsertPuzzleProgress(
      PuzzleProgress(
        ownerUserId: 'test-user',
        puzzleId: 'puzzle_a',
        packId: 'custom_pack',
        isSolved: true,
        attempts: 3,
        solvedAt: DateTime(2026, 2, 1),
        updatedAt: DateTime(2026, 2, 1),
      ),
    );

    final bloc = PuzzlePlayerBloc(
      contentLoader: _SinglePackLoader(
        const PuzzlePack(
          packId: 'custom_pack',
          title: 'Custom',
          description: 'custom',
          category: 'test',
          puzzles: <Puzzle>[puzzleA, puzzleB, puzzleC],
        ),
      ),
      engine: ChessEngine(),
      progressRepository: progressRepository,
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadPack('custom_pack');

    expect(bloc.state.puzzleIndex, 1);
    expect(bloc.state.currentPuzzle?.id, 'puzzle_b');
    expect(bloc.state.solvedCount, 1);
    expect(bloc.state.currentPuzzleStatus, PuzzleStatus.unplayed);
    await bloc.close();
  });

  test(
    'correct move auto-plays opponent reply and advances line index',
    () async {
      const puzzle = Puzzle(
        id: 'custom_1',
        fen: '3r4/ppk2pp1/2p1p3/4b3/P3n1P1/8/KPP2PN1/3rBR1R w - - 3 32',
        playerMoves: <String>['e1a5', 'f1d1'],
        opponentMoves: <String>['b7b6'],
        solutionSan: <String>['Ba5+', 'Rd1'],
        themes: <String>['discoveredAttack'],
        rating: 998,
      );
      final bloc = PuzzlePlayerBloc(
        contentLoader: _SinglePackLoader(
          const PuzzlePack(
            packId: 'custom_pack',
            title: 'Custom',
            description: 'custom',
            category: 'test',
            puzzles: <Puzzle>[puzzle],
          ),
        ),
        engine: ChessEngine(),
        progressRepository: InMemoryProgressRepository(),
        authRepository: InMemoryAuthRepository(),
      );

      await bloc.loadPack('custom_pack');
      await bloc.onUserMove('e1a5');

      final engine = ChessEngine()..loadFen(puzzle.fen);
      engine.makeMove('e1a5');
      engine.makeMove('b7b6');

      expect(bloc.state.currentPlayerMoveIndex, 1);
      expect(bloc.state.solved, isFalse);
      expect(bloc.state.boardFen, engine.boardState.fen);
      await bloc.close();
    },
  );

  test('mate-in-1 alternate move is accepted as solved', () async {
    const puzzle = Puzzle(
      id: 'custom_mate_1',
      fen: '7k/5Q2/6K1/8/8/8/8/8 w - - 0 1',
      playerMoves: <String>['f7f8'],
      opponentMoves: <String>[],
      solutionSan: <String>['Qf8#'],
      themes: <String>['mate', 'mateIn1'],
      rating: 900,
      alternateWinningMoves: <String>['f7e8', 'f7g7', 'f7h7'],
    );

    final bloc = PuzzlePlayerBloc(
      contentLoader: _SinglePackLoader(
        const PuzzlePack(
          packId: 'custom_mate_pack',
          title: 'Custom Mate',
          description: 'custom',
          category: 'test',
          puzzles: <Puzzle>[puzzle],
        ),
      ),
      engine: ChessEngine(),
      progressRepository: InMemoryProgressRepository(),
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadPack('custom_mate_pack');
    await bloc.onUserMove('f7h7');

    expect(bloc.state.solved, isTrue);
    await bloc.close();
  });

  test('replay failure does not downgrade solved progress', () async {
    const puzzle = Puzzle(
      id: 'sticky_solved',
      fen: '3r4/ppk2pp1/2p1p3/4b3/P3n1P1/8/KPP2PN1/3rBR1R w - - 3 32',
      playerMoves: <String>['e1a5', 'f1d1'],
      opponentMoves: <String>['b7b6'],
      solutionSan: <String>['Ba5+', 'Rd1'],
      themes: <String>['discoveredAttack'],
      rating: 998,
    );
    final progressRepository = InMemoryProgressRepository();
    final bloc = PuzzlePlayerBloc(
      contentLoader: _SinglePackLoader(
        const PuzzlePack(
          packId: 'custom_pack',
          title: 'Custom',
          description: 'custom',
          category: 'test',
          puzzles: <Puzzle>[puzzle],
        ),
      ),
      engine: ChessEngine(),
      progressRepository: progressRepository,
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadPack('custom_pack');
    await bloc.onUserMove('e1a5');
    await bloc.onUserMove('f1d1');
    expect(bloc.state.currentPuzzleStatus, PuzzleStatus.solved);

    bloc.resetCurrentPuzzlePosition();
    final wrongMove = bloc.state.legalMoves.firstWhere((m) => m != 'e1a5');
    await bloc.onUserMove(wrongMove);

    final saved = await progressRepository.getPuzzleProgress(
      ownerUserId: 'test-user',
      puzzleId: puzzle.id,
    );
    expect(saved?.isSolved, isTrue);
    expect(bloc.state.currentPuzzleStatus, PuzzleStatus.solved);
    await bloc.close();
  });

  test('jumpToPuzzle and goToNextUnsolvedPuzzle work', () async {
    const puzzleA = Puzzle(
      id: 'jump_a',
      fen: '3r4/ppk2pp1/2p1p3/4b3/P3n1P1/8/KPP2PN1/3rBR1R w - - 3 32',
      playerMoves: <String>['e1a5', 'f1d1'],
      opponentMoves: <String>['b7b6'],
      solutionSan: <String>['Ba5+', 'Rd1'],
      themes: <String>['discoveredAttack'],
      rating: 998,
    );
    const puzzleB = Puzzle(
      id: 'jump_b',
      fen: '7k/5Q2/6K1/8/8/8/8/8 w - - 0 1',
      playerMoves: <String>['f7f8'],
      opponentMoves: <String>[],
      solutionSan: <String>['Qf8#'],
      themes: <String>['mate'],
      rating: 900,
    );
    const puzzleC = Puzzle(
      id: 'jump_c',
      fen: '8/4B1kp/4p1p1/1p4P1/7P/5PK1/1r6/8 w - - 0 40',
      playerMoves: <String>['e7f6', 'f6b2'],
      opponentMoves: <String>['g7f7'],
      solutionSan: <String>['Bf6+', 'Bxb2'],
      themes: <String>['fork'],
      rating: 858,
    );
    final progressRepository = InMemoryProgressRepository();
    await progressRepository.upsertPuzzleProgress(
      PuzzleProgress(
        ownerUserId: 'test-user',
        puzzleId: 'jump_b',
        packId: 'jump_pack',
        isSolved: true,
        attempts: 1,
        solvedAt: DateTime(2026, 2, 1),
        updatedAt: DateTime(2026, 2, 1),
      ),
    );

    final bloc = PuzzlePlayerBloc(
      contentLoader: _SinglePackLoader(
        const PuzzlePack(
          packId: 'jump_pack',
          title: 'Jump',
          description: 'jump',
          category: 'test',
          puzzles: <Puzzle>[puzzleA, puzzleB, puzzleC],
        ),
      ),
      engine: ChessEngine(),
      progressRepository: progressRepository,
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadPack('jump_pack');
    bloc.jumpToPuzzle(0);
    expect(bloc.state.currentPuzzle?.id, 'jump_a');

    bloc.goToNextUnsolvedPuzzle();
    expect(bloc.state.currentPuzzle?.id, 'jump_c');
    await bloc.close();
  });
}

class _SinglePackLoader extends ContentLoader {
  _SinglePackLoader(this.pack);

  final PuzzlePack pack;

  @override
  Future<PuzzlePack> loadPuzzlePackById(String id) async => pack;
}
