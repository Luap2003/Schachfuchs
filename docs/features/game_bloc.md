# GameBloc

## Responsibility
Orchestrate full game loop: player drag move, opponent move, game end handling, and game history persistence.

## Inputs/Outputs
- Input: `playMove(uci)` from board drag callback, `startGame`.
- Output: board updates, opponent thinking state, result state, persisted game record.

## State Model
- `status`, `boardState`, `legalMoves`, `isOpponentThinking`, messages.
- UI must lock board input while `isOpponentThinking` or game `finished`.

## Failure Handling
- Illegal player move -> error message, board state unchanged.
- Opponent timeout/no move -> return to player turn without crash.

## Dependencies
- `ChessEngine`
- `OpponentProvider`
- `AuthRepository`
- `GameHistoryRepository`

## Test Strategy
- Player move -> opponent move sequencing.
- Game-over persistence path.
- Input-locking behavior covered by play widget smoke tests.

## Extension Points
- Clocks/time controls.
- Online opponent integration.
