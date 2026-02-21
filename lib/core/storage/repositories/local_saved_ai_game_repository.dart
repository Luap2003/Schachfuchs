import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:schach_app/core/models/saved_ai_game.dart';
import 'package:schach_app/core/models/sync_state.dart';
import 'package:schach_app/core/storage/database.dart';
import 'package:schach_app/core/storage/repositories/saved_ai_game_repository.dart';

class LocalSavedAiGameRepository implements SavedAiGameRepository {
  LocalSavedAiGameRepository(this._db);

  final AppDatabase _db;

  @override
  Future<int> createNewGame({
    required String ownerUserId,
    required int skillLevel,
  }) async {
    final now = DateTime.now();
    final id = await _db
        .into(_db.savedAiGameSessions)
        .insert(
          SavedAiGameSessionsCompanion.insert(
            ownerUserId: ownerUserId,
            skillLevel: skillLevel,
            createdAt: Value(now),
            updatedAt: now,
            movesUciJson: const Value('[]'),
          ),
        );
    return id;
  }

  @override
  Future<SavedAiGame?> getById({
    required String ownerUserId,
    required int id,
  }) async {
    final row =
        await (_db.select(_db.savedAiGameSessions)..where(
              (tbl) => tbl.ownerUserId.equals(ownerUserId) & tbl.id.equals(id),
            ))
            .getSingleOrNull();

    if (row == null) {
      return null;
    }

    return _toModel(row);
  }

  @override
  Future<List<SavedAiGame>> listByUser({
    required String ownerUserId,
    int limit = 50,
  }) async {
    final rows =
        await (_db.select(_db.savedAiGameSessions)
              ..where((tbl) => tbl.ownerUserId.equals(ownerUserId))
              ..orderBy(<OrderingTerm Function(SavedAiGameSessions)>[
                (tbl) => OrderingTerm.desc(tbl.updatedAt),
              ])
              ..limit(limit))
            .get();

    return rows.map(_toModel).toList(growable: false);
  }

  @override
  Future<void> updateMoves({
    required String ownerUserId,
    required int id,
    required List<String> movesUci,
    required DateTime updatedAt,
  }) async {
    await (_db.update(_db.savedAiGameSessions)..where(
          (tbl) => tbl.ownerUserId.equals(ownerUserId) & tbl.id.equals(id),
        ))
        .write(
          SavedAiGameSessionsCompanion(
            movesUciJson: Value(jsonEncode(movesUci)),
            updatedAt: Value(updatedAt),
          ),
        );
  }

  @override
  Future<void> deleteById({
    required String ownerUserId,
    required int id,
  }) async {
    await (_db.delete(_db.savedAiGameSessions)..where(
          (tbl) => tbl.ownerUserId.equals(ownerUserId) & tbl.id.equals(id),
        ))
        .go();
  }

  SavedAiGame _toModel(SavedAiGameSession row) {
    return SavedAiGame(
      id: row.id,
      ownerUserId: row.ownerUserId,
      skillLevel: row.skillLevel,
      movesUci: _decodeMoves(row.movesUciJson),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      syncState: SyncStateX.fromDbValue(row.syncState),
    );
  }

  List<String> _decodeMoves(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is List<dynamic>) {
        return decoded.whereType<String>().toList(growable: false);
      }
    } catch (_) {
      // Ignore malformed rows and treat as empty move list.
    }
    return const <String>[];
  }
}
