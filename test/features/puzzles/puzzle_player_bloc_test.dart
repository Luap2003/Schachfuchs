import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/models/puzzle.dart';
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

    expect(bloc.state.status, PuzzlePlayerStatus.completed);

    await bloc.restartPackFromBeginning();

    expect(bloc.state.status, PuzzlePlayerStatus.ready);
    expect(bloc.state.puzzleIndex, 0);
    expect(bloc.state.solved, isFalse);
    expect(bloc.state.currentPuzzle?.id, bloc.state.pack!.puzzles.first.id);
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
}

class _SinglePackLoader extends ContentLoader {
  _SinglePackLoader(this.pack);

  final PuzzlePack pack;

  @override
  Future<PuzzlePack> loadPuzzlePackById(String id) async => pack;
}
