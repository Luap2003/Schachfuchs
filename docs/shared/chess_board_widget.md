# ChessBoardWidget

## Responsibility
Render chess position from FEN, support guidance overlays, and emit user drag moves as UCI.

## Inputs/Outputs
- Input: `fen`, `positionVersion`, `enableUserMoves`, `isInputLocked`, highlights, arrows.
- Output: board UI and `onUserMoveUci` callbacks after successful drag moves.

## State Model
- Internal `ChessBoardController`.
- Controller is recreated when `fen` or `positionVersion` changes.
- `isInputLocked` disables drag interactions without removing board state.

## Failure Handling
- Invalid FEN should be filtered before widget usage (engine/content layer).
- If move history cannot be mapped to UCI, callback is skipped.

## Dependencies
- `flutter_chess_board`
- `UciMoveMapper`

## Test Strategy
- Unit tests for `UciMoveMapper` (normal/capture/castling/promotion).
- Widget tests for drag-input visibility and fallback behavior.

## Extension Points
- Add animation hooks for wrong/correct-move feedback.
- Add deterministic fallback mapper if history parsing is insufficient.
