import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_manifest.freezed.dart';
part 'content_manifest.g.dart';

@freezed
abstract class ContentIndexEntry with _$ContentIndexEntry {
  const factory ContentIndexEntry({
    required String id,
    required String file,
    required int version,
    int? count,
  }) = _ContentIndexEntry;

  factory ContentIndexEntry.fromJson(Map<String, dynamic> json) =>
      _$ContentIndexEntryFromJson(json);
}

@freezed
abstract class ContentManifest with _$ContentManifest {
  const factory ContentManifest({
    required String version,
    @Default(<ContentIndexEntry>[]) List<ContentIndexEntry> lessons,
    @JsonKey(name: 'puzzlePacks')
    @Default(<ContentIndexEntry>[])
    List<ContentIndexEntry> puzzlePacks,
  }) = _ContentManifest;

  factory ContentManifest.fromJson(Map<String, dynamic> json) =>
      _$ContentManifestFromJson(json);
}
