// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  localUserId: json['localUserId'] as String,
  remoteUserId: json['remoteUserId'] as String?,
  authProvider: json['authProvider'] as String?,
  name: json['name'] as String? ?? 'Spieler',
  avatarId: json['avatarId'] as String? ?? 'default',
  totalXp: (json['totalXp'] as num?)?.toInt() ?? 0,
  currentRating: (json['currentRating'] as num?)?.toInt() ?? 400,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'localUserId': instance.localUserId,
      'remoteUserId': instance.remoteUserId,
      'authProvider': instance.authProvider,
      'name': instance.name,
      'avatarId': instance.avatarId,
      'totalXp': instance.totalXp,
      'currentRating': instance.currentRating,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
