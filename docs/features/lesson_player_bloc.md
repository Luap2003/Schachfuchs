# LessonPlayerBloc

## Responsibility
Control lesson step flow with drag-first move input, hints, retry/reset behavior, and progress persistence.

## Inputs/Outputs
- Input: lesson id, `onUserMove(uci)`, hint/next/reset actions, restart-from-start action.
- Output: updated lesson state and persisted lesson progress.

## State Model
- `status`, `lesson`, `stepIndex`, `legalMoves`, `feedback`, `showHint`.
- Drag-sync fields: `boardFen`, `positionVersion`.
- Retry marker: `requiresResetToRetry` when a legal-but-wrong move is made.

## Failure Handling
- Invalid content -> `error` state.
- Illegal move -> feedback, no progression.
- Wrong legal move -> keep moved board visible, set reset-required hint.
- Previously completed lesson load -> open in `completed` state until restarted.

## Dependencies
- `ContentLoader`
- `ChessEngine`
- `ProgressRepository`
- `AuthRepository`

## Test Strategy
- Correct drag move advances step.
- Wrong legal drag keeps moved board and enables reset path.
- Hint visibility and reset behavior.
- Completed lesson can restart from step 1 and clear completion marker.

## Extension Points
- Add richer pedagogical feedback over wrong-move positions.
- Add timed/star scoring adjustments.
