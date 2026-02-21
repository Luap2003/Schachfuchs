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
}
