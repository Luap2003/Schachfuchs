# GameBloc

## Responsibility
Orchestrate full game loop: player move, opponent move, game end handling, and game history persistence.

## Inputs/Outputs
- Input: player move UCI, start game action.
- Output: board updates, thinking state, result state, persisted record.

## State Model
- status, board state, legal moves, opponent thinking, error/result messages.

## Failure Handling
- illegal player move -> error message.
- opponent timeout/no move -> keep game alive.

## Dependencies
- `ChessEngine`
- `OpponentProvider`
- `AuthRepository`
- `GameHistoryRepository`

## Test Strategy
- player->opponent turn sequencing.
- game-over conditions and persistence.

## Extension Points
- clock controls.
- online opponent integration.
