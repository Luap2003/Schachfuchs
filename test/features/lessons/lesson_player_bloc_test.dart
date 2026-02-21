import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/features/lessons/bloc/lesson_player_bloc.dart';

import '../../support/fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('lesson bloc progresses after correct guided drag move', () async {
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

    await bloc.onUserMove('e2e3');

    expect(bloc.state.stepIndex, 2);
    await bloc.close();
  });

  test('wrong legal move keeps moved board and requires reset', () async {
    final bloc = LessonPlayerBloc(
      contentLoader: ContentLoader(),
      engine: ChessEngine(),
      progressRepository: InMemoryProgressRepository(),
      authRepository: InMemoryAuthRepository(),
    );

    await bloc.loadLesson('lesson_pawn');
    await bloc.goToNextStep();
    final initialFen = bloc.state.boardFen;

    await bloc.onUserMove('e2e4');

    expect(bloc.state.feedback, isNotNull);
    expect(bloc.state.requiresResetToRetry, isTrue);
    expect(bloc.state.boardFen, isNot(initialFen));

    bloc.resetCurrentStepPosition();
    expect(bloc.state.boardFen, initialFen);
    expect(bloc.state.requiresResetToRetry, isFalse);
    await bloc.close();
  });
}
