# ADR 0002: Opponent Abstraction

## Responsibility
Keep one local chess rules engine and swap only opponent move source.

## Inputs/Outputs
- Input: current `BoardState`.
- Output: opponent move UCI string or `null`.

## State Model
- `GameBloc` owns game loop.
- `OpponentProvider` implementations: `AiOpponent`, `PuzzleOpponent`, `OnlineOpponent` (future).

## Failure Handling
- Opponent move is always validated locally via `ChessEngine`.
- Stockfish timeout returns `null` move.

## Dependencies
- `OpponentProvider`
- `ChessEngine`
- Stockfish package (AI only)

## Test Strategy
- Mock opponent for deterministic game flow tests.
- Unit tests for AI output parsing and timeout behavior.

## Extension Points
- Add websocket opponent without changing `GameBloc` contract.
