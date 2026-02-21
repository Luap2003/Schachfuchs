# AiOpponent

## Responsibility
Provide Stockfish-backed move calculation with configurable skill level and move time.

## Inputs/Outputs
- Input: `BoardState.fen`.
- Output: Stockfish `bestmove` UCI string.

## State Model
- Lazy engine initialization.
- One pending move completer at a time.
- Timeout guard for engine responsiveness.

## Failure Handling
- Timeout completes with `null`.
- Cleanup is best-effort on dispose.

## Dependencies
- `stockfish` package
- `OpponentProvider`

## Test Strategy
- Mock stream parsing tests.
- Timeout behavior tests.

## Extension Points
- Add dynamic time control.
- Add personality presets.
