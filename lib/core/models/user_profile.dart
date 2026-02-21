import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String localUserId,
    String? remoteUserId,
    String? authProvider,
    @Default('Spieler') String name,
    @Default('default') String avatarId,
    @Default(0) int totalXp,
    @Default(400) int currentRating,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
