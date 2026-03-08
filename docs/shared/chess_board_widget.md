# ChessBoardWidget

## Responsibility
Render chess position from FEN, support guidance overlays, and emit user tap-selected moves as UCI.

## Inputs/Outputs
- Input: `fen`, `positionVersion`, `enableUserMoves`, `isInputLocked`, `legalMoves`, highlights, arrows.
- Output: board UI and `onUserMoveUci` callbacks after successful tap move selection.

## State Model
- Internal `ChessBoardController`.
- Controller is recreated when `fen` or `positionVersion` changes.
- `isInputLocked` disables tap interactions without removing board state.
- Widget tracks a selected origin square and renders legal destination dots/rings.

## Failure Handling
- Invalid FEN should be filtered before widget usage (engine/content layer).
- If no legal move matches selected origin/target pair, callback is skipped.

## Dependencies
- `flutter_chess_board`

## Test Strategy
- Widget tests for tap input, selection state, and destination overlays.

## Extension Points
- Add animation hooks for wrong/correct-move feedback.
- Add deterministic fallback mapper if history parsing is insufficient.
