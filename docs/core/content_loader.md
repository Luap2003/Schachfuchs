# ContentLoader

## Responsibility
Load and validate manifest-driven lesson/puzzle JSON assets, including generated multi-ply puzzle packs.

## Inputs/Outputs
- Input: asset JSON files + manifest entries.
- Output: typed `Lesson`, `PuzzlePack`, and `ContentManifest` objects.

## State Model
- Cached manifest in-memory.

## Failure Handling
- Missing manifest entries throw state errors.
- Invalid FEN/UCI in content throws validation errors.
- Invalid puzzle line shape (player/opponent move mismatch, illegal scripted move, SAN mismatch) throws validation errors.

## Dependencies
- Flutter `rootBundle`
- `dartchess` parsers for integrity checks

## Test Strategy
- Unit tests for manifest lookup and validation failures.
- Integrity tests on generated `gen_*` puzzle packs.

## Extension Points
- Add signed OTA content source.
- Add locale-based content variants.
