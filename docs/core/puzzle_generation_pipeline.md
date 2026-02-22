# Puzzle Generation Pipeline

## Responsibility
Generate static, serverless puzzle packs from the Lichess CSV database into app assets.

## Entry Point
- Script: `tool/puzzles/generate_lichess_packs.dart`
- Defaults:
  - Input DB: `lichess_db_puzzle.csv.zst`
  - Theme metadata: `puzzle_theme.xml`
  - Output packs: `assets/content/puzzles/generated`
  - Manifest: `assets/content/manifest.json`

## Generation Rules
- Keep puzzles that satisfy:
  - `600 <= rating <= 1799`
  - `ratingDeviation <= 95`
  - `popularity >= 75`
  - `nbPlays >= 100`
  - line length `<= 12` plies
- Convert each row from "position before opponent move" to app start position:
  - apply first move from CSV line to source FEN
  - resulting position is stored as puzzle `fen`
- Split remaining line into:
  - `playerMoves` (forced user moves)
  - `opponentMoves` (auto-played replies)
- Compute `solutionSan` from the start position.
- For `mateIn1` rows, precompute `alternateWinningMoves` (all checkmating legal moves).

## Pack Layout
- Theme packs: `fork`, `pin`, `skewer`, `discoveredAttack`, `deflection`, `attraction`, `sacrifice`, `mateIn2`
- Rating bands: `600_999`, `1000_1399`, `1400_1799`
- Size:
  - 24 packs x 200 puzzles = 4,800
  - 1 starter mix pack x 200 puzzles = 200
  - Total: 5,000

## Determinism
- Candidate score: popularity + plays + ratingDeviation penalty.
- Tiebreak: lower `PuzzleId` wins.
- Bounded top-k selection is used per bucket.

## Output Contract
- Generated pack files are `gen_*` JSON files in `assets/content/puzzles/generated`.
- Manifest puzzle entries are replaced by generated `gen_*` entries.
- Runtime loader validates all generated lines via `ContentLoader.verifyContentIntegrity()`.

## Validation
Run before commit:

```bash
dart format .
flutter analyze
flutter test
```
