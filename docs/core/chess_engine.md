# ChessEngine

## Responsibility
Provide local move validation, legal move generation, game-over detection, and PGN export.

## Inputs/Outputs
- Input: UCI move strings and FEN strings.
- Output: `MoveResult`, `BoardState`, legal move lists, PGN.

## State Model
- Internal immutable `dartchess.Position`.
- SAN move list for PGN generation.

## Failure Handling
- Invalid UCI -> illegal result.
- Illegal move in current position -> illegal result.
- Invalid FEN -> throws parser/setup exception.

## Dependencies
- `dartchess`

## Test Strategy
- Unit tests for legal/illegal move handling.
- Checkmate/stalemate/draw scenarios.
- Promotion move generation and parsing.

## Extension Points
- Add SAN history persistence.
- Add move undo stack if required later.
