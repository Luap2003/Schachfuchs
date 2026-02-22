# PuzzlePlayerBloc

## Responsibility
Drive puzzle solving with drag-first input, full-line validation, replay-friendly progress tracking, and persistence.

## Inputs/Outputs
- Input: pack id, `onUserMove(uci)`, hint/reset/next actions, jump/filter actions from puzzle index drawer.
- Output: puzzle progression state and persisted puzzle progress.

## State Model
- `status`, `pack`, `puzzleIndex`, `legalMoves`, `feedback`, `solved`.
- `currentPlayerMoveIndex` tracks where the user is in the forced line.
- Pack progress cache:
  - `puzzleStatusesById` (`unplayed` / `attempted` / `solved`)
  - `solvedCount`, `attemptedCount`, derived `openCount`
  - index filter (`all` / `open` / `attempted` / `solved`)
- Drag-sync fields: `boardFen`, `positionVersion`.
- Default start index is the first unsolved puzzle; solved puzzles remain replayable.

## Failure Handling
- Illegal move -> feedback only.
- Wrong legal move -> keep moved position visible, increment attempts, do not auto-reset.
- Invalid generated puzzle line (illegal opponent reply) -> error state.
- End-of-pack "next" action no longer hard-locks the session; user can continue replaying from index drawer.

## Dependencies
- `ContentLoader`
- `ChessEngine`
- `ProgressRepository`
- `AuthRepository`

## Test Strategy
- Correct player line solves puzzle only after final move.
- Correct move auto-plays scripted opponent reply and advances line index.
- Wrong legal drag preserves moved board and feedback.
- Mate-in-1 alternate checkmating move is accepted.
- Replay on previously solved puzzle keeps solved status sticky.
- Manual reset restores start position.
- Jump-to-index and next-unsolved navigation.

## Extension Points
- Adaptive hint/feedback system.
