import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/features/lessons/bloc/lesson_player_bloc.dart';

import '../../support/fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('lesson bloc progresses after correct guided move', () async {
    final bloc = LessonPlayerBloc(
      contentLoader: ContentLoader(),
      engine: ChessEngine(),
      progressRepository: InMemoryProgressRepository(),
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadLesson('lesson_pawn');
    expect(bloc.state.currentStep?.id, 'pawn_intro');

    await bloc.goToNextStep();
    expect(bloc.state.currentStep?.id, 'pawn_move_one');

    bloc.selectMove('e2e3');
    await bloc.submitMove();

    expect(bloc.state.stepIndex, 2);
    await bloc.close();
  });
}
