# PuzzlePlayerBloc

## Responsibility
Drive puzzle solving with drag-first input, hint handling, attempt tracking, and persistence.

## Inputs/Outputs
- Input: pack id, `onUserMove(uci)`, hint/reset/next actions, restart-pack action.
- Output: puzzle progression state and persisted puzzle progress.

## State Model
- `status`, `pack`, `puzzleIndex`, `legalMoves`, `feedback`, `solved`.
- Drag-sync fields: `boardFen`, `positionVersion`.
- Terminal flow: end-of-pack sets `status=completed`, then restart returns to index 0.

## Failure Handling
- Illegal move -> feedback only.
- Wrong legal move -> keep moved position visible, increment attempts, do not auto-reset.

## Dependencies
- `ContentLoader`
- `ChessEngine`
- `ProgressRepository`
- `AuthRepository`

## Test Strategy
- Correct drag move solves puzzle.
- Wrong legal drag preserves moved board and feedback.
- Manual reset restores start position.
- Completed pack can restart from puzzle 1.

## Extension Points
- Multi-ply puzzle lines.
- Adaptive hint/feedback system.
