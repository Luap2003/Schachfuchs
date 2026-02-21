// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_manifest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentIndexEntry _$ContentIndexEntryFromJson(Map<String, dynamic> json) =>
    _ContentIndexEntry(
      id: json['id'] as String,
      file: json['file'] as String,
      version: (json['version'] as num).toInt(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ContentIndexEntryToJson(_ContentIndexEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file': instance.file,
      'version': instance.version,
      'count': instance.count,
    };

_ContentManifest _$ContentManifestFromJson(
  Map<String, dynamic> json,
) => _ContentManifest(
  version: json['version'] as String,
  lessons:
      (json['lessons'] as List<dynamic>?)
          ?.map((e) => ContentIndexEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ContentIndexEntry>[],
  puzzlePacks:
      (json['puzzlePacks'] as List<dynamic>?)
          ?.map((e) => ContentIndexEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ContentIndexEntry>[],
);

Map<String, dynamic> _$ContentManifestToJson(_ContentManifest instance) =>
    <String, dynamic>{
      'version': instance.version,
      'lessons': instance.lessons,
      'puzzlePacks': instance.puzzlePacks,
    };
