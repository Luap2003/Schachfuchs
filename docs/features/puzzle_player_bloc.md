# PuzzlePlayerBloc

## Responsibility
Drive puzzle-solving flow with hint handling and persistence of attempts/solves.

## Inputs/Outputs
- Input: puzzle pack id, move selection, hint action.
- Output: puzzle state progression and persisted puzzle progress.

## State Model
- status, active pack/puzzle index, legal moves, selected move, feedback, solved flag.

## Failure Handling
- illegal move -> feedback.
- wrong move -> reset puzzle position and increment attempts.

## Dependencies
- `ContentLoader`
- `ChessEngine`
- `ProgressRepository`
- `AuthRepository`

## Test Strategy
- solve path and fail/retry path tests.
- hint usage and persistence tests.

## Extension Points
- support multi-ply puzzle lines.
- add timed mode and streak scoring.
