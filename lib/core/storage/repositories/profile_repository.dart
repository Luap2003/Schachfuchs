import 'package:schach_app/core/models/user_profile.dart';

abstract class ProfileRepository {
  Future<UserProfile> getActiveProfile();

  Future<void> ensureLocalProfile();

  Future<void> updateProfileName(String name);
}
