import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/features/puzzles/bloc/puzzle_player_bloc.dart';

import '../../support/fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('puzzle bloc marks puzzle solved for expected move', () async {
    final bloc = PuzzlePlayerBloc(
      contentLoader: ContentLoader(),
      engine: ChessEngine(),
      progressRepository: InMemoryProgressRepository(),
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadPack('forks_beginner');
    final expectedMove = bloc.state.currentPuzzle!.solutionMoves.first;

    bloc.selectMove(expectedMove);
    await bloc.submitMove();

    expect(bloc.state.solved, isTrue);
    await bloc.close();
  });
}
