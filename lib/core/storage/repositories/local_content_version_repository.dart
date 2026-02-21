import 'package:drift/drift.dart';
import 'package:schach_app/core/storage/database.dart';
import 'package:schach_app/core/storage/repositories/content_version_repository.dart';

class LocalContentVersionRepository implements ContentVersionRepository {
  LocalContentVersionRepository(this._db);

  final AppDatabase _db;

  @override
  Future<int?> getVersion(String contentId) async {
    final row = await (_db.select(
      _db.contentVersions,
    )..where((tbl) => tbl.contentId.equals(contentId))).getSingleOrNull();
    return row?.version;
  }

  @override
  Future<void> upsertVersion({
    required String contentId,
    required String contentType,
    required int version,
  }) async {
    await _db
        .into(_db.contentVersions)
        .insertOnConflictUpdate(
          ContentVersionsCompanion.insert(
            contentId: contentId,
            contentType: contentType,
            version: version,
            installedAt: Value(DateTime.now()),
          ),
        );
  }
}
