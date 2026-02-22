part of 'puzzle_player_bloc.dart';

enum PuzzlePlayerStatus { initial, loading, ready, completed, error }

class PuzzlePlayerState extends Equatable {
  const PuzzlePlayerState({
    this.status = PuzzlePlayerStatus.initial,
    this.pack,
    this.puzzleIndex = 0,
    this.legalMoves = const <String>[],
    this.selectedMove,
    this.feedback,
    this.errorMessage,
    this.hintsUsed = 0,
    this.solved = false,
    this.currentPlayerMoveIndex = 0,
    this.puzzleStatusesById = const <String, PuzzleStatus>{},
    this.solvedCount = 0,
    this.attemptedCount = 0,
    this.indexFilter = PuzzleStatusFilter.all,
    this.boardFen,
    this.positionVersion = 0,
  });

  final PuzzlePlayerStatus status;
  final PuzzlePack? pack;
  final int puzzleIndex;
  final List<String> legalMoves;
  final String? selectedMove;
  final String? feedback;
  final String? errorMessage;
  final int hintsUsed;
  final bool solved;
  final int currentPlayerMoveIndex;
  final Map<String, PuzzleStatus> puzzleStatusesById;
  final int solvedCount;
  final int attemptedCount;
  final PuzzleStatusFilter indexFilter;
  final String? boardFen;
  final int positionVersion;

  Puzzle? get currentPuzzle {
    final pack = this.pack;
    if (pack == null || pack.puzzles.isEmpty) {
      return null;
    }
    return pack.puzzles[puzzleIndex];
  }

  PuzzleStatus get currentPuzzleStatus {
    final puzzle = currentPuzzle;
    if (puzzle == null) {
      return PuzzleStatus.unplayed;
    }
    return puzzleStatusesById[puzzle.id] ?? PuzzleStatus.unplayed;
  }

  int get totalPuzzles => pack?.puzzles.length ?? 0;

  int get openCount {
    final open = totalPuzzles - solvedCount - attemptedCount;
    return open < 0 ? 0 : open;
  }

  PuzzlePlayerState copyWith({
    PuzzlePlayerStatus? status,
    PuzzlePack? pack,
    int? puzzleIndex,
    List<String>? legalMoves,
    Object? selectedMove = _sentinel,
    Object? feedback = _sentinel,
    String? errorMessage,
    int? hintsUsed,
    bool? solved,
    int? currentPlayerMoveIndex,
    Map<String, PuzzleStatus>? puzzleStatusesById,
    int? solvedCount,
    int? attemptedCount,
    PuzzleStatusFilter? indexFilter,
    Object? boardFen = _sentinel,
    int? positionVersion,
    bool clearError = false,
  }) {
    return PuzzlePlayerState(
      status: status ?? this.status,
      pack: pack ?? this.pack,
      puzzleIndex: puzzleIndex ?? this.puzzleIndex,
      legalMoves: legalMoves ?? this.legalMoves,
      selectedMove: selectedMove == _sentinel
          ? this.selectedMove
          : selectedMove as String?,
      feedback: feedback == _sentinel ? this.feedback : feedback as String?,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      hintsUsed: hintsUsed ?? this.hintsUsed,
      solved: solved ?? this.solved,
      currentPlayerMoveIndex:
          currentPlayerMoveIndex ?? this.currentPlayerMoveIndex,
      puzzleStatusesById: puzzleStatusesById ?? this.puzzleStatusesById,
      solvedCount: solvedCount ?? this.solvedCount,
      attemptedCount: attemptedCount ?? this.attemptedCount,
      indexFilter: indexFilter ?? this.indexFilter,
      boardFen: boardFen == _sentinel ? this.boardFen : boardFen as String?,
      positionVersion: positionVersion ?? this.positionVersion,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    status,
    pack,
    puzzleIndex,
    legalMoves,
    selectedMove,
    feedback,
    errorMessage,
    hintsUsed,
    solved,
    currentPlayerMoveIndex,
    puzzleStatusesById,
    solvedCount,
    attemptedCount,
    indexFilter,
    boardFen,
    positionVersion,
  ];
}

const Object _sentinel = Object();
