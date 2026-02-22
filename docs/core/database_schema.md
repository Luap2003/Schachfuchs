# Database Schema

## Responsibility
Persist offline profile, progress, game history, resumable AI games, achievements, and content versions.

## Inputs/Outputs
- Input: repository write operations.
- Output: typed query results and durable SQLite records.

## State Model
- `users` table with `local_user_id` and nullable `remote_user_id`.
- User-owned tables keyed by `owner_user_id`.
- `sync_state` + `updated_at` on syncable entities.
- `saved_ai_games` stores autosaved AI sessions (skill level, move list JSON, last-played timestamp).

## Failure Handling
- FK constraints protect orphan records.
- conflict updates via `insertOnConflictUpdate` for idempotent upserts.

## Dependencies
- Drift
- SQLite

## Test Strategy
- CRUD and upsert unit tests.
- migration v1/v2 creation + upgrade tests.

## Extension Points
- Add sync cursor and conflict resolution metadata.
- Add index tuning when datasets grow.
- Add persisted per-pack aggregates if puzzle-pack scale grows beyond on-read aggregation.

## Puzzle Progress Aggregation Notes
- No schema migration is required for pack progress UI.
- Pack summaries are derived from `puzzle_progresses` rows:
  - solved: `is_solved = true`
  - attempted-unsolved: `is_solved = false` (row exists)
  - open: puzzles without a row
- Repository supports pack-level reads:
  - `listPuzzleProgressByPack(ownerUserId, packId)`
  - `listPuzzleProgressByPacks(ownerUserId, packIds)`
