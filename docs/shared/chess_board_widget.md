# ChessBoardWidget

## Responsibility
Render chess position from FEN and optional guidance overlays (highlights/arrows).

## Inputs/Outputs
- Input: FEN, highlighted squares, arrow descriptors.
- Output: visual board widget for lesson/puzzle/game screens.

## State Model
- internal `ChessBoardController` synced via `didUpdateWidget`.

## Failure Handling
- invalid FEN should be rejected before reaching widget (loader/engine level).

## Dependencies
- `flutter_chess_board`

## Test Strategy
- widget smoke test for FEN update and overlay rendering.

## Extension Points
- add tap callbacks for custom move input.
- animate move paths and celebrations.
