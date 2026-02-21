import 'package:drift/drift.dart';
import 'package:schach_app/core/models/user_profile.dart';
import 'package:schach_app/core/storage/database.dart';
import 'package:schach_app/core/storage/repositories/profile_repository.dart';
import 'package:uuid/uuid.dart';

class LocalProfileRepository implements ProfileRepository {
  LocalProfileRepository(this._db, this._uuid);

  final AppDatabase _db;
  final Uuid _uuid;

  @override
  Future<void> ensureLocalProfile() async {
    final hasUser = await (_db.select(_db.users)..limit(1)).getSingleOrNull();
    if (hasUser != null) {
      return;
    }

    final now = DateTime.now();
    await _db
        .into(_db.users)
        .insert(
          UsersCompanion.insert(
            localUserId: _uuid.v4(),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  @override
  Future<UserProfile> getActiveProfile() async {
    await ensureLocalProfile();
    final row = await (_db.select(_db.users)..limit(1)).getSingle();
    return UserProfile(
      localUserId: row.localUserId,
      remoteUserId: row.remoteUserId,
      authProvider: row.authProvider,
      name: row.name,
      avatarId: row.avatarId,
      totalXp: row.totalXp,
      currentRating: row.currentRating,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  @override
  Future<void> updateProfileName(String name) async {
    final profile = await getActiveProfile();
    await (_db.update(
      _db.users,
    )..where((tbl) => tbl.localUserId.equals(profile.localUserId))).write(
      UsersCompanion(name: Value(name), updatedAt: Value(DateTime.now())),
    );
  }
}
