enum PuzzleStatus { unplayed, attempted, solved }

enum PuzzleStatusFilter { all, open, attempted, solved }

class PuzzlePackProgressSummary {
  const PuzzlePackProgressSummary({
    required this.packId,
    required this.totalPuzzles,
    required this.solvedCount,
    required this.attemptedCount,
  });

  final String packId;
  final int totalPuzzles;
  final int solvedCount;
  final int attemptedCount;

  int get openCount {
    final open = totalPuzzles - solvedCount - attemptedCount;
    return open < 0 ? 0 : open;
  }
}
