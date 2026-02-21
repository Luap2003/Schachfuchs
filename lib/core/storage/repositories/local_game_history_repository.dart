import 'package:drift/drift.dart';
import 'package:schach_app/core/models/game_record.dart';
import 'package:schach_app/core/models/sync_state.dart';
import 'package:schach_app/core/storage/database.dart';
import 'package:schach_app/core/storage/repositories/game_history_repository.dart';

class LocalGameHistoryRepository implements GameHistoryRepository {
  LocalGameHistoryRepository(this._db);

  final AppDatabase _db;

  @override
  Future<void> addRecord(GameRecord record) async {
    await _db
        .into(_db.gameHistories)
        .insert(
          GameHistoriesCompanion.insert(
            ownerUserId: record.ownerUserId,
            pgn: record.pgn,
            opponentType: record.opponentType,
            result: record.outcome.name,
            updatedAt: record.updatedAt,
            opponentName: Value(record.opponentName),
            playedAt: Value(record.playedAt),
            durationSeconds: Value(record.durationSeconds),
            moveCount: Value(record.moveCount),
            syncState: Value(record.syncState.dbValue),
          ),
        );
  }

  @override
  Future<List<GameRecord>> getRecent({
    required String ownerUserId,
    int limit = 20,
  }) async {
    final rows =
        await (_db.select(_db.gameHistories)
              ..where((tbl) => tbl.ownerUserId.equals(ownerUserId))
              ..orderBy(<OrderingTerm Function(GameHistories)>[
                (tbl) => OrderingTerm.desc(tbl.playedAt),
              ])
              ..limit(limit))
            .get();

    return rows
        .map(
          (row) => GameRecord(
            id: row.id,
            ownerUserId: row.ownerUserId,
            pgn: row.pgn,
            opponentType: row.opponentType,
            opponentName: row.opponentName,
            outcome: GameOutcome.values.firstWhere(
              (item) => item.name == row.result,
              orElse: () => GameOutcome.draw,
            ),
            playedAt: row.playedAt,
            durationSeconds: row.durationSeconds,
            moveCount: row.moveCount,
            updatedAt: row.updatedAt,
            syncState: SyncStateX.fromDbValue(row.syncState),
          ),
        )
        .toList(growable: false);
  }
}
