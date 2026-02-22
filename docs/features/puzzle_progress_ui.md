# Puzzle Progress UI

## Goal
Provide scalable navigation and progress feedback for large puzzle packs while preserving replay freedom.

## Status Model
- `unplayed`: no progress row exists
- `attempted`: progress row exists and `isSolved == false`
- `solved`: `isSolved == true`

## Pack Menu
- Each pack tile shows:
  - metadata (category/level/count)
  - segmented progress bar:
    - green = solved
    - amber = attempted-unsolved
    - neutral = open
  - summary text:
    - `<solved>/<total> gelöst · <attempted> versucht · <open> offen`

## Puzzle Player
- On load, open first unsolved puzzle (fallback to index 0 if all solved).
- App bar includes index button (`list_alt`) to open puzzle index drawer.
- Header shows:
  - current puzzle number
  - current puzzle status chip (`Offen`, `Versucht`, `Gelöst`)
  - pack-level segmented progress and counts

## Index Drawer
- Shows segmented progress + counts for current pack.
- Filter chips:
  - `Alle`
  - `Offen`
  - `Versucht`
  - `Gelöst`
- Scroll list of puzzle indices with status icons and current-item highlight.
- Tap an index to jump directly to that puzzle.

## Replay Semantics
- Solved puzzles can always be replayed.
- A failed replay attempt does **not** downgrade solved state.
- Next button at end-of-pack shows a non-blocking feedback message and keeps replay available.
