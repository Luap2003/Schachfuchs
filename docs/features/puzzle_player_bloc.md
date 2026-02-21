# PuzzlePlayerBloc

## Responsibility
Drive puzzle solving with drag-first input, hint handling, attempt tracking, and persistence.

## Inputs/Outputs
- Input: pack id, `onUserMove(uci)`, hint/reset/next actions.
- Output: puzzle progression state and persisted puzzle progress.

## State Model
- `status`, `pack`, `puzzleIndex`, `legalMoves`, `feedback`, `solved`.
- Drag-sync fields: `boardFen`, `positionVersion`.

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

## Extension Points
- Multi-ply puzzle lines.
- Adaptive hint/feedback system.
