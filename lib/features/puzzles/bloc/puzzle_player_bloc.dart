import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/models/progress.dart' as model;
import 'package:schach_app/core/models/puzzle.dart';
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
      final puzzle = pack.puzzles.first;
      _engine.loadFen(puzzle.fen);
      emit(
        state.copyWith(
          status: PuzzlePlayerStatus.ready,
          pack: pack,
          puzzleIndex: 0,
          legalMoves: _engine.allLegalMoves(),
          selectedMove: null,
          feedback: null,
          hintsUsed: 0,
          solved: false,
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
        feedback: puzzle.hint ?? 'Suche einen Zug mit Doppelangriff.',
      ),
    );
  }

  Future<void> onUserMove(String move) async {
    await _evaluateMove(move);
  }

  Future<void> submitMove() async {
    if (state.selectedMove == null) {
      emit(state.copyWith(feedback: 'Bitte waehle zuerst einen Zug aus.'));
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

    final expectedMove = puzzle.solutionMoves.first;
    if (selectedMove != expectedMove) {
      await _saveProgress(solved: false, puzzle: puzzle, packId: pack.packId);
      emit(
        state.copyWith(
          solved: false,
          feedback:
              'Nicht ganz. Versuche es erneut oder setze die Position zurueck.',
          selectedMove: null,
        ),
      );
      return;
    }

    await _saveProgress(solved: true, puzzle: puzzle, packId: pack.packId);
    emit(state.copyWith(solved: true, feedback: 'Perfekt geloest!'));
  }

  Future<void> nextPuzzle() async {
    final pack = state.pack;
    if (pack == null) {
      return;
    }

    final nextIndex = state.puzzleIndex + 1;
    if (nextIndex >= pack.puzzles.length) {
      emit(state.copyWith(status: PuzzlePlayerStatus.completed));
      return;
    }

    final puzzle = pack.puzzles[nextIndex];
    _engine.loadFen(puzzle.fen);

    emit(
      state.copyWith(
        status: PuzzlePlayerStatus.ready,
        puzzleIndex: nextIndex,
        legalMoves: _engine.allLegalMoves(),
        selectedMove: null,
        feedback: null,
        solved: false,
        boardFen: _engine.boardState.fen,
        positionVersion: state.positionVersion + 1,
      ),
    );
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
      ),
    );
  }

  Future<void> _saveProgress({
    required bool solved,
    required Puzzle puzzle,
    required String packId,
  }) async {
    final userId = await _authRepository.getCurrentLocalUserId();
    final existing = await _progressRepository.getPuzzleProgress(
      ownerUserId: userId,
      puzzleId: puzzle.id,
    );

    await _progressRepository.upsertPuzzleProgress(
      model.PuzzleProgress(
        ownerUserId: userId,
        puzzleId: puzzle.id,
        packId: packId,
        isSolved: solved,
        bestTimeMs: solved ? 5000 : existing?.bestTimeMs,
        hintsUsed: state.hintsUsed,
        attempts: (existing?.attempts ?? 0) + 1,
        solvedAt: solved ? DateTime.now() : null,
        updatedAt: DateTime.now(),
      ),
    );
  }
}
