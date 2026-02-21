import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
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

    await bloc.loadPack('forks_beginner');
    final expectedMove = bloc.state.currentPuzzle!.solutionMoves.first;

    await bloc.onUserMove(expectedMove);

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

    await bloc.loadPack('forks_beginner');
    final initialFen = bloc.state.boardFen;
    final expectedMove = bloc.state.currentPuzzle!.solutionMoves.first;
    final wrongMove = bloc.state.legalMoves.firstWhere(
      (move) => move != expectedMove,
    );

    await bloc.onUserMove(wrongMove);

    expect(bloc.state.solved, isFalse);
    expect(bloc.state.feedback, isNotNull);
    expect(bloc.state.boardFen, isNot(initialFen));

    bloc.resetCurrentPuzzlePosition();
    expect(bloc.state.boardFen, initialFen);
    await bloc.close();
  });

  test('completed puzzle pack can be restarted from beginning', () async {
    final bloc = PuzzlePlayerBloc(
      contentLoader: ContentLoader(),
      engine: ChessEngine(),
      progressRepository: InMemoryProgressRepository(),
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadPack('forks_beginner');
    final totalPuzzles = bloc.state.pack!.puzzles.length;
    for (var index = 0; index < totalPuzzles; index++) {
      final expectedMove = bloc.state.currentPuzzle!.solutionMoves.first;
      await bloc.onUserMove(expectedMove);
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
}
