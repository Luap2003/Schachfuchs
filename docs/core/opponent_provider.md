# OpponentProvider

## Responsibility
Abstract opponent move source from game orchestration.

## Inputs/Outputs
- Input: `BoardState`.
- Output: next UCI move or `null`.

## State Model
- Lifecycle hooks: `onGameStart`, `onGameEnd`, `dispose`.

## Failure Handling
- Implementations should fail safely and return `null` where possible.

## Dependencies
- `BoardState`
- `GameResult`

## Test Strategy
- Contract tests with fake implementations.

## Extension Points
- Online and puzzle variants with same contract.
