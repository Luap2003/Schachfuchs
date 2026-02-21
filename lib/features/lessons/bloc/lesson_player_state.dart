part of 'lesson_player_bloc.dart';

enum LessonPlayerStatus { initial, loading, ready, completed, error }

class LessonPlayerState extends Equatable {
  const LessonPlayerState({
    this.status = LessonPlayerStatus.initial,
    this.lesson,
    this.stepIndex = 0,
    this.legalMoves = const <String>[],
    this.selectedMove,
    this.feedback,
    this.errorMessage,
    this.showHint = false,
    this.boardFen,
    this.positionVersion = 0,
    this.requiresResetToRetry = false,
  });

  final LessonPlayerStatus status;
  final Lesson? lesson;
  final int stepIndex;
  final List<String> legalMoves;
  final String? selectedMove;
  final String? feedback;
  final String? errorMessage;
  final bool showHint;
  final String? boardFen;
  final int positionVersion;
  final bool requiresResetToRetry;

  LessonStep? get currentStep {
    final lesson = this.lesson;
    if (lesson == null || lesson.steps.isEmpty) {
      return null;
    }
    return lesson.steps[stepIndex];
  }

  LessonPlayerState copyWith({
    LessonPlayerStatus? status,
    Lesson? lesson,
    int? stepIndex,
    List<String>? legalMoves,
    Object? selectedMove = _sentinel,
    Object? feedback = _sentinel,
    String? errorMessage,
    bool? showHint,
    Object? boardFen = _sentinel,
    int? positionVersion,
    bool? requiresResetToRetry,
    bool clearError = false,
  }) {
    return LessonPlayerState(
      status: status ?? this.status,
      lesson: lesson ?? this.lesson,
      stepIndex: stepIndex ?? this.stepIndex,
      legalMoves: legalMoves ?? this.legalMoves,
      selectedMove: selectedMove == _sentinel
          ? this.selectedMove
          : selectedMove as String?,
      feedback: feedback == _sentinel ? this.feedback : feedback as String?,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      showHint: showHint ?? this.showHint,
      boardFen: boardFen == _sentinel ? this.boardFen : boardFen as String?,
      positionVersion: positionVersion ?? this.positionVersion,
      requiresResetToRetry: requiresResetToRetry ?? this.requiresResetToRetry,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    status,
    lesson,
    stepIndex,
    legalMoves,
    selectedMove,
    feedback,
    errorMessage,
    showHint,
    boardFen,
    positionVersion,
    requiresResetToRetry,
  ];
}

const Object _sentinel = Object();
