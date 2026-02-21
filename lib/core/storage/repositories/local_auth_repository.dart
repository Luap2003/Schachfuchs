import 'package:drift/drift.dart';
import 'package:schach_app/core/storage/database.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/profile_repository.dart';

class LocalAuthRepository implements AuthRepository {
  LocalAuthRepository(this._db, this._profileRepository);

  final AppDatabase _db;
  final ProfileRepository _profileRepository;

  @override
  Future<String> getCurrentLocalUserId() async {
    final profile = await _profileRepository.getActiveProfile();
    return profile.localUserId;
  }

  @override
  Future<void> linkRemoteIdentity({
    required String remoteUserId,
    required String authProvider,
  }) async {
    final localId = await getCurrentLocalUserId();
    await (_db.update(
      _db.users,
    )..where((tbl) => tbl.localUserId.equals(localId))).write(
      UsersCompanion(
        remoteUserId: Value(remoteUserId),
        authProvider: Value(authProvider),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
