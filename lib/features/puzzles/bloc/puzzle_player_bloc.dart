import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/models/progress.dart' as model;
import 'package:schach_app/core/models/puzzle.dart';
import 'package:schach_app/core/models/puzzle_progress_view.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';

part 'puzzle_player_state.dart';

class PuzzlePlayerBloc extends Cubit<PuzzlePlayerState> {
  PuzzlePlayerBloc({
    required ContentLoader contentLoader,
    required ChessEngine engine,
    required ProgressRepository progressRepository,
    required AuthRepository authRepository,
  }) : _contentLoader = contentLoader,
       _engine = engine,
       _progressRepository = progressRepository,
       _authRepository = authRepository,
       super(const PuzzlePlayerState());

  final ContentLoader _contentLoader;
  final ChessEngine _engine;
  final ProgressRepository _progressRepository;
  final AuthRepository _authRepository;

  Future<void> loadPack(String packId) async {
    emit(state.copyWith(status: PuzzlePlayerStatus.loading, clearError: true));

    try {
      final pack = await _contentLoader.loadPuzzlePackById(packId);
      final userId = await _authRepository.getCurrentLocalUserId();
      final progressRows = await _progressRepository.listPuzzleProgressByPack(
        ownerUserId: userId,
        packId: packId,
      );
      final statusById = _buildStatusByPuzzleId(
        puzzles: pack.puzzles,
        progressRows: progressRows,
      );
      final solvedCount = statusById.values
          .where((status) => status == PuzzleStatus.solved)
          .length;
      final attemptedCount = statusById.values
          .where((status) => status == PuzzleStatus.attempted)
          .length;
      final startIndex = _findFirstUnsolvedIndex(pack, statusById);
      final puzzle = pack.puzzles[startIndex];
      _engine.loadFen(puzzle.fen);
      emit(
        state.copyWith(
          status: PuzzlePlayerStatus.ready,
          pack: pack,
          puzzleIndex: startIndex,
          legalMoves: _engine.allLegalMoves(),
          selectedMove: null,
          feedback: null,
          hintsUsed: 0,
          solved: false,
          currentPlayerMoveIndex: 0,
          puzzleStatusesById: statusById,
          solvedCount: solvedCount,
          attemptedCount: attemptedCount,
          indexFilter: PuzzleStatusFilter.all,
          boardFen: _engine.boardState.fen,
          positionVersion: state.positionVersion + 1,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: PuzzlePlayerStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void selectMove(String move) {
    emit(state.copyWith(selectedMove: move, feedback: null));
  }

  void showHint() {
    final puzzle = state.currentPuzzle;
    if (puzzle == null) {
      return;
    }
    emit(
      state.copyWith(
        hintsUsed: state.hintsUsed + 1,
        feedback:
            puzzle.hint ??
            (puzzle.solutionSan.isNotEmpty
                ? 'Denke an ${puzzle.solutionSan.first}.'
                : 'Suche den besten Zug.'),
      ),
    );
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

  Future<void> _evaluateMove(String selectedMove) async {
    final puzzle = state.currentPuzzle;
    final pack = state.pack;
    if (puzzle == null || pack == null) {
      return;
    }

    final moveResult = _engine.makeMove(selectedMove);
    if (!moveResult.isLegal) {
      emit(
        state.copyWith(
          feedback: 'Dieser Zug ist nicht legal.',
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

    final moveIndex = state.currentPlayerMoveIndex;
    if (moveIndex >= puzzle.playerMoves.length) {
      return;
    }

    final expectedMove = puzzle.playerMoves[moveIndex];
    final allowsMateInOneAlternative =
        moveIndex == 0 && puzzle.alternateWinningMoves.contains(selectedMove);
    if (selectedMove != expectedMove && !allowsMateInOneAlternative) {
      final saved = await _saveProgressAndReturn(
        solved: false,
        puzzle: puzzle,
        packId: pack.packId,
      );
      final nextStatus = saved.isSolved
          ? PuzzleStatus.solved
          : PuzzleStatus.attempted;
      final updatedStatusById = _withPuzzleStatus(puzzle.id, nextStatus);
      emit(
        state.copyWith(
          solved: false,
          puzzleStatusesById: updatedStatusById,
          solvedCount: _countSolved(updatedStatusById),
          attemptedCount: _countAttempted(updatedStatusById),
          feedback:
              'Nicht ganz. Versuche es erneut oder setze die Position zurück.',
          selectedMove: null,
        ),
      );
      return;
    }

    final nextPlayerMoveIndex = moveIndex + 1;
    final isSolved = nextPlayerMoveIndex >= puzzle.playerMoves.length;
    final alternateMateSolution =
        allowsMateInOneAlternative && puzzle.playerMoves.length == 1;
    if (isSolved || alternateMateSolution) {
      final saved = await _saveProgressAndReturn(
        solved: true,
        puzzle: puzzle,
        packId: pack.packId,
      );
      final nextStatus = saved.isSolved
          ? PuzzleStatus.solved
          : PuzzleStatus.attempted;
      final updatedStatusById = _withPuzzleStatus(puzzle.id, nextStatus);
      emit(
        state.copyWith(
          solved: true,
          currentPlayerMoveIndex: nextPlayerMoveIndex,
          puzzleStatusesById: updatedStatusById,
          solvedCount: _countSolved(updatedStatusById),
          attemptedCount: _countAttempted(updatedStatusById),
          feedback: 'Perfekt gelöst!',
          selectedMove: null,
        ),
      );
      return;
    }

    if (moveIndex < puzzle.opponentMoves.length) {
      final opponentMove = puzzle.opponentMoves[moveIndex];
      final opponentMoveResult = _engine.makeMove(opponentMove);
      if (!opponentMoveResult.isLegal) {
        emit(
          state.copyWith(
            status: PuzzlePlayerStatus.error,
            errorMessage:
                'Puzzle-Datenfehler: Gegnerzug ist illegal ($opponentMove).',
          ),
        );
        return;
      }
    }

    emit(
      state.copyWith(
        solved: false,
        currentPlayerMoveIndex: nextPlayerMoveIndex,
        boardFen: _engine.boardState.fen,
        legalMoves: _engine.allLegalMoves(),
        feedback: 'Richtig. Finde den nächsten Zug.',
        selectedMove: null,
      ),
    );
  }

  Future<void> nextPuzzle() async {
    final pack = state.pack;
    if (pack == null) {
      return;
    }

    final nextIndex = state.puzzleIndex + 1;
    if (nextIndex >= pack.puzzles.length) {
      emit(
        state.copyWith(
          status: PuzzlePlayerStatus.ready,
          solved: false,
          selectedMove: null,
          feedback: 'Ende erreicht. Wähle ein Puzzle aus der Liste zum Replay.',
        ),
      );
      return;
    }

    _openPuzzleAtIndex(nextIndex);
  }

  Future<void> restartPackFromBeginning() async {
    if (state.pack == null) {
      return;
    }
    _openPuzzleAtIndex(0);
  }

  void jumpToPuzzle(int index) {
    _openPuzzleAtIndex(index);
  }

  void setIndexFilter(PuzzleStatusFilter filter) {
    emit(state.copyWith(indexFilter: filter));
  }

  void goToNextUnsolvedPuzzle() {
    final pack = state.pack;
    if (pack == null || pack.puzzles.isEmpty) {
      return;
    }
    for (var i = state.puzzleIndex + 1; i < pack.puzzles.length; i++) {
      final status =
          state.puzzleStatusesById[pack.puzzles[i].id] ?? PuzzleStatus.unplayed;
      if (status != PuzzleStatus.solved) {
        _openPuzzleAtIndex(i);
        return;
      }
    }
    emit(state.copyWith(feedback: 'Kein weiteres offenes Puzzle gefunden.'));
  }

  void resetCurrentPuzzlePosition() {
    final puzzle = state.currentPuzzle;
    if (puzzle == null) {
      return;
    }
    _engine.loadFen(puzzle.fen);
    emit(
      state.copyWith(
        boardFen: _engine.boardState.fen,
        legalMoves: _engine.allLegalMoves(),
        positionVersion: state.positionVersion + 1,
        selectedMove: null,
        feedback: null,
        solved: false,
        currentPlayerMoveIndex: 0,
      ),
    );
  }

  void _openPuzzleAtIndex(int index) {
    final pack = state.pack;
    if (pack == null || pack.puzzles.isEmpty) {
      return;
    }
    if (index < 0 || index >= pack.puzzles.length) {
      return;
    }
    final puzzle = pack.puzzles[index];
    _engine.loadFen(puzzle.fen);
    emit(
      state.copyWith(
        status: PuzzlePlayerStatus.ready,
        puzzleIndex: index,
        legalMoves: _engine.allLegalMoves(),
        selectedMove: null,
        feedback: null,
        solved: false,
        currentPlayerMoveIndex: 0,
        boardFen: _engine.boardState.fen,
        positionVersion: state.positionVersion + 1,
      ),
    );
  }

  Map<String, PuzzleStatus> _buildStatusByPuzzleId({
    required List<Puzzle> puzzles,
    required List<model.PuzzleProgress> progressRows,
  }) {
    final status = <String, PuzzleStatus>{};
    for (final puzzle in puzzles) {
      status[puzzle.id] = PuzzleStatus.unplayed;
    }
    for (final row in progressRows) {
      final next = row.isSolved ? PuzzleStatus.solved : PuzzleStatus.attempted;
      status[row.puzzleId] = next;
    }
    return status;
  }

  int _findFirstUnsolvedIndex(
    PuzzlePack pack,
    Map<String, PuzzleStatus> statusById,
  ) {
    for (var index = 0; index < pack.puzzles.length; index++) {
      final puzzle = pack.puzzles[index];
      final status = statusById[puzzle.id] ?? PuzzleStatus.unplayed;
      if (status != PuzzleStatus.solved) {
        return index;
      }
    }
    return 0;
  }

  Map<String, PuzzleStatus> _withPuzzleStatus(
    String puzzleId,
    PuzzleStatus newStatus,
  ) {
    final next = Map<String, PuzzleStatus>.from(state.puzzleStatusesById);
    next[puzzleId] = newStatus;
    return next;
  }

  int _countSolved(Map<String, PuzzleStatus> statusById) {
    return statusById.values
        .where((status) => status == PuzzleStatus.solved)
        .length;
  }

  int _countAttempted(Map<String, PuzzleStatus> statusById) {
    return statusById.values
        .where((status) => status == PuzzleStatus.attempted)
        .length;
  }

  Future<model.PuzzleProgress> _saveProgressAndReturn({
    required bool solved,
    required Puzzle puzzle,
    required String packId,
  }) async {
    final userId = await _authRepository.getCurrentLocalUserId();
    final existing = await _progressRepository.getPuzzleProgress(
      ownerUserId: userId,
      puzzleId: puzzle.id,
    );

    final nextSolved = solved || (existing?.isSolved ?? false);
    final progress = model.PuzzleProgress(
      ownerUserId: userId,
      puzzleId: puzzle.id,
      packId: packId,
      isSolved: nextSolved,
      bestTimeMs: nextSolved ? (existing?.bestTimeMs ?? 5000) : null,
      hintsUsed: state.hintsUsed,
      attempts: (existing?.attempts ?? 0) + 1,
      solvedAt: nextSolved ? (existing?.solvedAt ?? DateTime.now()) : null,
      updatedAt: DateTime.now(),
    );
    await _progressRepository.upsertPuzzleProgress(progress);
    return progress;
  }
}
