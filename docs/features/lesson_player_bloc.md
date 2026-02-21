# LessonPlayerBloc

## Responsibility
Control lesson step flow, move validation, hints, and lesson progress persistence.

## Inputs/Outputs
- Input: lesson id, move selections, hint/next actions.
- Output: state updates for UI and persisted lesson progress.

## State Model
- status, current lesson, step index, legal moves, selected move, feedback, hint flag.

## Failure Handling
- invalid content -> error state.
- illegal move -> feedback message and no step advance.

## Dependencies
- `ContentLoader`
- `ChessEngine`
- `ProgressRepository`
- `AuthRepository`

## Test Strategy
- step transitions for explanation/guided/free play.
- correct vs incorrect move handling.

## Extension Points
- add scoring/time bonuses.
- add multiple-choice/watch full support.
