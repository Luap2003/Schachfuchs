import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/models/lesson.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';
import 'package:schach_app/features/lessons/bloc/lesson_player_bloc.dart';
import 'package:schach_app/features/lessons/widgets/step_explanation.dart';
import 'package:schach_app/features/lessons/widgets/step_free_play.dart';
import 'package:schach_app/features/lessons/widgets/step_guided_move.dart';
import 'package:schach_app/features/lessons/widgets/step_multiple_choice.dart';
import 'package:schach_app/features/lessons/widgets/step_watch.dart';
import 'package:schach_app/shared/widgets/chess_board_widget.dart';

class LessonPlayerScreen extends StatelessWidget {
  const LessonPlayerScreen({required this.lessonId, super.key});

  final String lessonId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonPlayerBloc>(
      create: (_) => LessonPlayerBloc(
        contentLoader: getIt<ContentLoader>(),
        engine: getIt<ChessEngine>(),
        progressRepository: getIt<ProgressRepository>(),
        authRepository: getIt<AuthRepository>(),
      )..loadLesson(lessonId),
      child: Scaffold(
        appBar: AppBar(title: const Text('Lektion spielen')),
        body: BlocBuilder<LessonPlayerBloc, LessonPlayerState>(
          builder: (BuildContext context, LessonPlayerState state) {
            if (state.status == LessonPlayerStatus.loading ||
                state.status == LessonPlayerStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == LessonPlayerStatus.error) {
              return Center(
                child: Text(state.errorMessage ?? 'Unbekannter Fehler'),
              );
            }

            final step = state.currentStep;
            if (step == null) {
              return const Center(child: Text('Keine Schritte vorhanden.'));
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      state.lesson?.title ?? '',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Schritt ${state.stepIndex + 1}/${state.lesson!.steps.length}',
                    ),
                    const SizedBox(height: 16),
                    ChessBoardWidget(
                      fen: state.boardFen ?? step.fen,
                      positionVersion: state.positionVersion,
                      enableUserMoves: step.type != LessonStepType.explanation,
                      isInputLocked:
                          state.status == LessonPlayerStatus.completed,
                      onUserMoveUci: (String uci) =>
                          context.read<LessonPlayerBloc>().onUserMove(uci),
                      highlightSquares: step.highlightSquares,
                      arrows: step.arrows
                          .map(
                            (arrow) => ChessArrowData(
                              from: arrow.from,
                              to: arrow.to,
                              color: _colorFromName(arrow.color),
                            ),
                          )
                          .toList(growable: false),
                    ),
                    const SizedBox(height: 16),
                    _buildStepWidget(context, state, step),
                    if (state.status ==
                        LessonPlayerStatus.completed) ...<Widget>[
                      const SizedBox(height: 12),
                      const Text(
                        'Lektion abgeschlossen! Super!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStepWidget(
    BuildContext context,
    LessonPlayerState state,
    LessonStep step,
  ) {
    final bloc = context.read<LessonPlayerBloc>();
    switch (step.type) {
      case LessonStepType.explanation:
        return StepExplanation(text: step.text, onContinue: bloc.goToNextStep);
      case LessonStepType.guidedMove:
        return StepGuidedMove(
          text: step.text,
          feedback: state.showHint ? step.hint : state.feedback,
          requiresResetToRetry: state.requiresResetToRetry,
          onReset: bloc.resetCurrentStepPosition,
          moves: state.legalMoves,
          selectedMove: state.selectedMove,
          onSelectMove: (String? value) {
            if (value != null) {
              bloc.selectMove(value);
            }
          },
          onSubmitDebug: bloc.submitMove,
          onHint: bloc.revealHint,
        );
      case LessonStepType.freePlay:
        return StepFreePlay(
          text: step.text,
          feedback: state.showHint ? step.hint : state.feedback,
          requiresResetToRetry: state.requiresResetToRetry,
          onReset: bloc.resetCurrentStepPosition,
          moves: state.legalMoves,
          selectedMove: state.selectedMove,
          onSelectMove: (String? value) {
            if (value != null) {
              bloc.selectMove(value);
            }
          },
          onSubmitDebug: bloc.submitMove,
          onHint: bloc.revealHint,
        );
      case LessonStepType.multipleChoice:
        return const StepMultipleChoice();
      case LessonStepType.watch:
        return const StepWatch();
    }
  }

  Color _colorFromName(String color) {
    switch (color.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      default:
        return Colors.green;
    }
  }
}
