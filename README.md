# Schach App

Offline-first Flutter app to help children learn chess with lessons, puzzles, and AI games.

## Implemented MVP Vertical Slice
- Lessons: one complete pawn lesson flow (`explanation`, `guided_move`, `free_play`)
- Puzzles: generated offline puzzle catalog (`gen_*` packs) with line-based solving
- Play: game vs Stockfish AI (3 skill presets)
- Local-first persistence with Drift/SQLite
- Future-ready user model (`local_user_id`, nullable `remote_user_id`, `owner_user_id`, `sync_state`)
- Data-driven content via JSON assets and manifest

## Stack
- Flutter + BLoC + GetIt + Drift (SQLite)
- `dartchess` for move validation/rules
- `stockfish` for local AI opponent
- `flutter_chess_board` for board rendering

## Project Structure
- `lib/core`: engine, opponents, content, storage, models
- `lib/features`: home, lessons, puzzles, play
- `lib/shared`: reusable UI/theme
- `assets/content`: lessons, puzzles, manifest
- `docs`: ADRs and per-service docs

## Run
```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Quality Checks
```bash
dart format .
flutter analyze
flutter test
```

## Puzzle Pack Generation
Generate curated puzzle packs from `lichess_db_puzzle.csv.zst`:
```bash
dart run tool/puzzles/generate_lichess_packs.dart
```

## Android Setup Note
If Android runs fail on this machine, install Android SDK cmdline-tools and accept licenses:
```bash
flutter doctor --android-licenses
```

## Golden Tests
`test/golden/golden_smoke_test.dart` is included and currently skipped by default.
Unskip and run with `--update-goldens` once reference images are approved.
