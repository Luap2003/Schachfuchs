# GameBloc

## Responsibility
Orchestrate full game loop: player drag move, opponent move, save/resume session handling, game end handling, and game history persistence.

## Inputs/Outputs
- Input: `playMove(uci)` from board drag callback, `startGame({resumeGameId})`.
- Output: board updates, opponent thinking state, result state, persisted game record, persisted ongoing AI session.

## State Model
- `status`, `boardState`, `legalMoves`, `isOpponentThinking`, messages.
- UI must lock board input while `isOpponentThinking` or game `finished`.
- Ongoing game sessions are autosaved on start and after each legal move.

## Failure Handling
- Illegal player move -> error message, board state unchanged.
- Opponent timeout/no move -> return to player turn without crash.
- Checkmate -> finish game with explicit win/loss message.
- Stalemate -> finish game as draw (`Patt`).
- Missing/invalid resume id -> fallback to a fresh game and surface a user-facing error.

## Dependencies
- `ChessEngine`
- `OpponentProvider`
- `AuthRepository`
- `GameHistoryRepository`
- `SavedAiGameRepository`

## Test Strategy
- Player move -> opponent move sequencing.
- Game-over persistence path.
- Checkmate detection for both player win and player loss paths.
- Save/resume path: autosave, resume reconstruction, delete ongoing session on finish.
- Input-locking behavior covered by play widget smoke tests.

## Extension Points
- Clocks/time controls.
- Online opponent integration.
