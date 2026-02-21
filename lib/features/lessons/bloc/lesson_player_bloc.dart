import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/models/lesson.dart';
import 'package:schach_app/core/models/progress.dart' as model;
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';

part 'lesson_player_state.dart';

class LessonPlayerBloc extends Cubit<LessonPlayerState> {
  LessonPlayerBloc({
    required ContentLoader contentLoader,
    required ChessEngine engine,
    required ProgressRepository progressRepository,
    required AuthRepository authRepository,
  }) : _contentLoader = contentLoader,
       _engine = engine,
       _progressRepository = progressRepository,
       _authRepository = authRepository,
       super(const LessonPlayerState());

  final ContentLoader _contentLoader;
  final ChessEngine _engine;
  final ProgressRepository _progressRepository;
  final AuthRepository _authRepository;

  Future<void> loadLesson(String lessonId) async {
    emit(state.copyWith(status: LessonPlayerStatus.loading, clearError: true));

    try {
      final lesson = await _contentLoader.loadLessonById(lessonId);
      if (lesson.steps.isEmpty) {
        emit(
          state.copyWith(
            status: LessonPlayerStatus.ready,
            lesson: lesson,
            stepIndex: 0,
            selectedMove: null,
            feedback: null,
            showHint: false,
            legalMoves: const <String>[],
            boardFen: null,
            positionVersion: state.positionVersion + 1,
            requiresResetToRetry: false,
          ),
        );
        return;
      }

      final userId = await _authRepository.getCurrentLocalUserId();
      final saved = await _progressRepository.getLessonProgress(
        ownerUserId: userId,
        lessonId: lesson.id,
      );
      final savedIndex = saved?.currentStepIndex ?? 0;
      final maxIndex = lesson.steps.length - 1;
      final initialIndex = savedIndex < 0
          ? 0
          : (savedIndex > maxIndex ? maxIndex : savedIndex);
      final wasCompleted = saved?.isCompleted ?? false;

      _loadStepPosition(lesson.steps[initialIndex]);
      emit(
        state.copyWith(
          status: wasCompleted
              ? LessonPlayerStatus.completed
              : LessonPlayerStatus.ready,
          lesson: lesson,
          stepIndex: initialIndex,
          selectedMove: null,
          feedback: null,
          showHint: false,
          legalMoves: _engine.allLegalMoves(),
          boardFen: _engine.boardState.fen,
          positionVersion: state.positionVersion + 1,
          requiresResetToRetry: false,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: LessonPlayerStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void selectMove(String move) {
    emit(state.copyWith(selectedMove: move, feedback: null, showHint: false));
  }

  void revealHint() {
    emit(state.copyWith(showHint: true));
  }

  Future<void> onUserMove(String move) async {
    await _evaluateMove(move);
  }

  Future<void> submitMove() async {
    if (state.selectedMove == null) {
      emit(state.copyWith(feedback: 'Bitte wähle zuerst einen Zug aus.'));
      return;
    }
    await _evaluateMove(state.selectedMove!);
  }

  Future<void> _evaluateMove(String move) async {
    final lesson = state.lesson;
    if (lesson == null || state.status == LessonPlayerStatus.completed) {
      return;
    }

    final step = lesson.steps[state.stepIndex];
    if (step.type == LessonStepType.explanation) {
      await goToNextStep();
      return;
    }

    final moveResult = _engine.makeMove(move);
    if (!moveResult.isLegal) {
      emit(
        state.copyWith(
          feedback: 'Dieser Zug ist hier nicht erlaubt.',
          selectedMove: null,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        boardFen: _engine.boardState.fen,
        legalMoves: _engine.allLegalMoves(),
      ),
    );

    final bool isCorrect;
    if (step.type == LessonStepType.guidedMove) {
      isCorrect = step.expectedMove == move;
    } else if (step.type == LessonStepType.freePlay) {
      isCorrect = step.acceptedMoves.contains(move);
    } else {
      isCorrect = true;
    }

    if (!isCorrect) {
      emit(
        state.copyWith(
          feedback:
              '${step.failText ?? 'Noch nicht richtig. Versuch es nochmal.'} Nutze bei Bedarf "Startposition".',
          showHint: false,
          selectedMove: null,
          requiresResetToRetry: true,
        ),
      );
      return;
    }

    final feedback = step.successText ?? 'Stark!';
    final isLast = state.stepIndex == lesson.steps.length - 1;

    if (isLast) {
      await _persistProgress(lesson, lesson.steps.length - 1, completed: true);
      emit(
        state.copyWith(
          status: LessonPlayerStatus.completed,
          feedback: feedback,
          selectedMove: null,
          requiresResetToRetry: false,
        ),
      );
      return;
    }

    emit(state.copyWith(feedback: feedback));
    await goToNextStep();
  }

  Future<void> goToNextStep() async {
    final lesson = state.lesson;
    if (lesson == null) {
      return;
    }

    final nextIndex = state.stepIndex + 1;
    if (nextIndex >= lesson.steps.length) {
      return;
    }

    final step = lesson.steps[nextIndex];
    _loadStepPosition(step);
    await _persistProgress(lesson, nextIndex, completed: false);

    emit(
      state.copyWith(
        status: LessonPlayerStatus.ready,
        stepIndex: nextIndex,
        selectedMove: null,
        feedback: null,
        showHint: false,
        legalMoves: _engine.allLegalMoves(),
        boardFen: _engine.boardState.fen,
        positionVersion: state.positionVersion + 1,
        requiresResetToRetry: false,
      ),
    );
  }

  void resetCurrentStepPosition() {
    final lesson = state.lesson;
    if (lesson == null) {
      return;
    }
    final step = lesson.steps[state.stepIndex];
    _loadStepPosition(step);
    emit(
      state.copyWith(
        boardFen: _engine.boardState.fen,
        legalMoves: _engine.allLegalMoves(),
        positionVersion: state.positionVersion + 1,
        requiresResetToRetry: false,
        feedback: null,
        selectedMove: null,
      ),
    );
  }

  Future<void> restartFromBeginning() async {
    final lesson = state.lesson;
    if (lesson == null) {
      return;
    }

    const firstStepIndex = 0;
    final firstStep = lesson.steps[firstStepIndex];
    _loadStepPosition(firstStep);
    await _persistProgress(lesson, firstStepIndex, completed: false);

    emit(
      state.copyWith(
        status: LessonPlayerStatus.ready,
        stepIndex: firstStepIndex,
        selectedMove: null,
        feedback: null,
        showHint: false,
        legalMoves: _engine.allLegalMoves(),
        boardFen: _engine.boardState.fen,
        positionVersion: state.positionVersion + 1,
        requiresResetToRetry: false,
      ),
    );
  }

  void _loadStepPosition(LessonStep step) {
    _engine.loadFen(step.fen);
  }

  Future<void> _persistProgress(
    Lesson lesson,
    int stepIndex, {
    required bool completed,
  }) async {
    final userId = await _authRepository.getCurrentLocalUserId();
    await _progressRepository.upsertLessonProgress(
      model.LessonProgress(
        ownerUserId: userId,
        lessonId: lesson.id,
        currentStepIndex: stepIndex,
        isCompleted: completed,
        starsEarned: completed ? 3 : 0,
        completedAt: completed ? DateTime.now() : null,
        attempts: 1,
        updatedAt: DateTime.now(),
      ),
    );
  }
}
