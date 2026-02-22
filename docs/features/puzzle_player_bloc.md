# PuzzlePlayerBloc

## Responsibility
Drive puzzle solving with drag-first input, full-line validation, hint handling, attempt tracking, and persistence.

## Inputs/Outputs
- Input: pack id, `onUserMove(uci)`, hint/reset/next actions, restart-pack action.
- Output: puzzle progression state and persisted puzzle progress.

## State Model
- `status`, `pack`, `puzzleIndex`, `legalMoves`, `feedback`, `solved`.
- `currentPlayerMoveIndex` tracks where the user is in the forced line.
- Drag-sync fields: `boardFen`, `positionVersion`.
- Terminal flow: end-of-pack sets `status=completed`, then restart returns to index 0.

## Failure Handling
- Illegal move -> feedback only.
- Wrong legal move -> keep moved position visible, increment attempts, do not auto-reset.
- Invalid generated puzzle line (illegal opponent reply) -> error state.

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
- Manual reset restores start position.
- Completed pack can restart from puzzle 1.

## Extension Points
- Adaptive hint/feedback system.
