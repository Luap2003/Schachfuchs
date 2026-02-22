# ADR 0003: Generated Puzzle Content from Lichess DB

## Status
Accepted

## Context
- Hand-authored puzzle packs do not scale for large offline training catalogs.
- The app is serverless/offline-first and should not depend on runtime backend puzzle APIs.
- Lichess puzzle DB provides enough volume and metadata for deterministic local curation.

## Decision
- Replace legacy hand-authored puzzle packs with generated `gen_*` puzzle packs.
- Use a local generation script (`tool/puzzles/generate_lichess_packs.dart`) to build static JSON assets from `lichess_db_puzzle.csv.zst`.
- Keep delivery static via app-bundled assets and manifest entries.
- Use full-line puzzle validation at runtime with:
  - forced player moves (`playerMoves`)
  - auto opponent replies (`opponentMoves`)
  - SAN display (`solutionSan`)

## Consequences
### Positive
- Scales to thousands of puzzles while staying fully offline.
- Deterministic outputs enable reproducible QA and versioning.
- Runtime model aligns with Lichess puzzle semantics.

### Tradeoffs
- Larger content footprint in app assets.
- Generation pipeline becomes part of maintenance workflow.
- Schema is intentionally breaking; old puzzle JSON files are removed.

## Follow-ups
- Consider static CDN add-on in a future ADR if optional post-install content downloads are needed.
- Consider exercise/lesson auto-generation from selected puzzle motifs in a later phase.
