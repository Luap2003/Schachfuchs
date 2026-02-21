abstract class AuthRepository {
  Future<String> getCurrentLocalUserId();

  Future<void> linkRemoteIdentity({
    required String remoteUserId,
    required String authProvider,
  });
}
