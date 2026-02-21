# ADR 0001: Local-First Architecture

## Responsibility
Define how the app remains fully usable offline and sync-ready for future cloud features.

## Inputs/Outputs
- Input: bundled lesson/puzzle assets, local user actions.
- Output: persisted progress, game history, local content versions.

## State Model
- Single local profile in `users`.
- All learning data keyed by `owner_user_id`.
- `sync_state` and `updated_at` present on syncable records.

## Failure Handling
- Missing/invalid assets fail fast in `ContentLoader.verifyContentIntegrity`.
- Illegal moves are rejected in local engine.

## Dependencies
- Drift/SQLite
- `ContentLoader`
- `ChessEngine`

## Test Strategy
- Unit tests for schema/repositories/content loader.
- Widget and bloc tests for offline flows.

## Extension Points
- Add cloud sync layer on top of local repositories.
- Link `remote_user_id` once auth is introduced.
