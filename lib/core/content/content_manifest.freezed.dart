// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_manifest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentIndexEntry {

 String get id; String get file; int get version; int? get count; String? get title; String? get category; int? get difficulty; List<String> get tags;
/// Create a copy of ContentIndexEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentIndexEntryCopyWith<ContentIndexEntry> get copyWith => _$ContentIndexEntryCopyWithImpl<ContentIndexEntry>(this as ContentIndexEntry, _$identity);

  /// Serializes this ContentIndexEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentIndexEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.file, file) || other.file == file)&&(identical(other.version, version) || other.version == version)&&(identical(other.count, count) || other.count == count)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,file,version,count,title,category,difficulty,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'ContentIndexEntry(id: $id, file: $file, version: $version, count: $count, title: $title, category: $category, difficulty: $difficulty, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ContentIndexEntryCopyWith<$Res>  {
  factory $ContentIndexEntryCopyWith(ContentIndexEntry value, $Res Function(ContentIndexEntry) _then) = _$ContentIndexEntryCopyWithImpl;
@useResult
$Res call({
 String id, String file, int version, int? count, String? title, String? category, int? difficulty, List<String> tags
});




}
/// @nodoc
class _$ContentIndexEntryCopyWithImpl<$Res>
    implements $ContentIndexEntryCopyWith<$Res> {
  _$ContentIndexEntryCopyWithImpl(this._self, this._then);

  final ContentIndexEntry _self;
  final $Res Function(ContentIndexEntry) _then;

/// Create a copy of ContentIndexEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? file = null,Object? version = null,Object? count = freezed,Object? title = freezed,Object? category = freezed,Object? difficulty = freezed,Object? tags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentIndexEntry].
extension ContentIndexEntryPatterns on ContentIndexEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentIndexEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentIndexEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentIndexEntry value)  $default,){
final _that = this;
switch (_that) {
case _ContentIndexEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentIndexEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ContentIndexEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String file,  int version,  int? count,  String? title,  String? category,  int? difficulty,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentIndexEntry() when $default != null:
return $default(_that.id,_that.file,_that.version,_that.count,_that.title,_that.category,_that.difficulty,_that.tags);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String file,  int version,  int? count,  String? title,  String? category,  int? difficulty,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _ContentIndexEntry():
return $default(_that.id,_that.file,_that.version,_that.count,_that.title,_that.category,_that.difficulty,_that.tags);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String file,  int version,  int? count,  String? title,  String? category,  int? difficulty,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _ContentIndexEntry() when $default != null:
return $default(_that.id,_that.file,_that.version,_that.count,_that.title,_that.category,_that.difficulty,_that.tags);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _ContentIndexEntry implements ContentIndexEntry {
  const _ContentIndexEntry({required this.id, required this.file, required this.version, this.count, this.title, this.category, this.difficulty, final  List<String> tags = const <String>[]}): _tags = tags;
  factory _ContentIndexEntry.fromJson(Map<String, dynamic> json) => _$ContentIndexEntryFromJson(json);

@override final  String id;
@override final  String file;
@override final  int version;
@override final  int? count;
@override final  String? title;
@override final  String? category;
@override final  int? difficulty;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of ContentIndexEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentIndexEntryCopyWith<_ContentIndexEntry> get copyWith => __$ContentIndexEntryCopyWithImpl<_ContentIndexEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentIndexEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentIndexEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.file, file) || other.file == file)&&(identical(other.version, version) || other.version == version)&&(identical(other.count, count) || other.count == count)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,file,version,count,title,category,difficulty,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'ContentIndexEntry(id: $id, file: $file, version: $version, count: $count, title: $title, category: $category, difficulty: $difficulty, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$ContentIndexEntryCopyWith<$Res> implements $ContentIndexEntryCopyWith<$Res> {
  factory _$ContentIndexEntryCopyWith(_ContentIndexEntry value, $Res Function(_ContentIndexEntry) _then) = __$ContentIndexEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String file, int version, int? count, String? title, String? category, int? difficulty, List<String> tags
});




}
/// @nodoc
class __$ContentIndexEntryCopyWithImpl<$Res>
    implements _$ContentIndexEntryCopyWith<$Res> {
  __$ContentIndexEntryCopyWithImpl(this._self, this._then);

  final _ContentIndexEntry _self;
  final $Res Function(_ContentIndexEntry) _then;

/// Create a copy of ContentIndexEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? file = null,Object? version = null,Object? count = freezed,Object? title = freezed,Object? category = freezed,Object? difficulty = freezed,Object? tags = null,}) {
  return _then(_ContentIndexEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ContentManifest {

 String get version; List<ContentIndexEntry> get lessons;@JsonKey(name: 'puzzlePacks') List<ContentIndexEntry> get puzzlePacks;
/// Create a copy of ContentManifest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentManifestCopyWith<ContentManifest> get copyWith => _$ContentManifestCopyWithImpl<ContentManifest>(this as ContentManifest, _$identity);

  /// Serializes this ContentManifest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentManifest&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.lessons, lessons)&&const DeepCollectionEquality().equals(other.puzzlePacks, puzzlePacks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,const DeepCollectionEquality().hash(lessons),const DeepCollectionEquality().hash(puzzlePacks));

@override
String toString() {
  return 'ContentManifest(version: $version, lessons: $lessons, puzzlePacks: $puzzlePacks)';
}


}

/// @nodoc
abstract mixin class $ContentManifestCopyWith<$Res>  {
  factory $ContentManifestCopyWith(ContentManifest value, $Res Function(ContentManifest) _then) = _$ContentManifestCopyWithImpl;
@useResult
$Res call({
 String version, List<ContentIndexEntry> lessons,@JsonKey(name: 'puzzlePacks') List<ContentIndexEntry> puzzlePacks
});




}
/// @nodoc
class _$ContentManifestCopyWithImpl<$Res>
    implements $ContentManifestCopyWith<$Res> {
  _$ContentManifestCopyWithImpl(this._self, this._then);

  final ContentManifest _self;
  final $Res Function(ContentManifest) _then;

/// Create a copy of ContentManifest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? lessons = null,Object? puzzlePacks = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,lessons: null == lessons ? _self.lessons : lessons // ignore: cast_nullable_to_non_nullable
as List<ContentIndexEntry>,puzzlePacks: null == puzzlePacks ? _self.puzzlePacks : puzzlePacks // ignore: cast_nullable_to_non_nullable
as List<ContentIndexEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentManifest].
extension ContentManifestPatterns on ContentManifest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentManifest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentManifest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentManifest value)  $default,){
final _that = this;
switch (_that) {
case _ContentManifest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentManifest value)?  $default,){
final _that = this;
switch (_that) {
case _ContentManifest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version,  List<ContentIndexEntry> lessons, @JsonKey(name: 'puzzlePacks')  List<ContentIndexEntry> puzzlePacks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentManifest() when $default != null:
return $default(_that.version,_that.lessons,_that.puzzlePacks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version,  List<ContentIndexEntry> lessons, @JsonKey(name: 'puzzlePacks')  List<ContentIndexEntry> puzzlePacks)  $default,) {final _that = this;
switch (_that) {
case _ContentManifest():
return $default(_that.version,_that.lessons,_that.puzzlePacks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version,  List<ContentIndexEntry> lessons, @JsonKey(name: 'puzzlePacks')  List<ContentIndexEntry> puzzlePacks)?  $default,) {final _that = this;
switch (_that) {
case _ContentManifest() when $default != null:
return $default(_that.version,_that.lessons,_that.puzzlePacks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentManifest implements ContentManifest {
  const _ContentManifest({required this.version, final  List<ContentIndexEntry> lessons = const <ContentIndexEntry>[], @JsonKey(name: 'puzzlePacks') final  List<ContentIndexEntry> puzzlePacks = const <ContentIndexEntry>[]}): _lessons = lessons,_puzzlePacks = puzzlePacks;
  factory _ContentManifest.fromJson(Map<String, dynamic> json) => _$ContentManifestFromJson(json);

@override final  String version;
 final  List<ContentIndexEntry> _lessons;
@override@JsonKey() List<ContentIndexEntry> get lessons {
  if (_lessons is EqualUnmodifiableListView) return _lessons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lessons);
}

 final  List<ContentIndexEntry> _puzzlePacks;
@override@JsonKey(name: 'puzzlePacks') List<ContentIndexEntry> get puzzlePacks {
  if (_puzzlePacks is EqualUnmodifiableListView) return _puzzlePacks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_puzzlePacks);
}


/// Create a copy of ContentManifest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentManifestCopyWith<_ContentManifest> get copyWith => __$ContentManifestCopyWithImpl<_ContentManifest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentManifestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentManifest&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._lessons, _lessons)&&const DeepCollectionEquality().equals(other._puzzlePacks, _puzzlePacks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,const DeepCollectionEquality().hash(_lessons),const DeepCollectionEquality().hash(_puzzlePacks));

@override
String toString() {
  return 'ContentManifest(version: $version, lessons: $lessons, puzzlePacks: $puzzlePacks)';
}


}

/// @nodoc
abstract mixin class _$ContentManifestCopyWith<$Res> implements $ContentManifestCopyWith<$Res> {
  factory _$ContentManifestCopyWith(_ContentManifest value, $Res Function(_ContentManifest) _then) = __$ContentManifestCopyWithImpl;
@override @useResult
$Res call({
 String version, List<ContentIndexEntry> lessons,@JsonKey(name: 'puzzlePacks') List<ContentIndexEntry> puzzlePacks
});




}
/// @nodoc
class __$ContentManifestCopyWithImpl<$Res>
    implements _$ContentManifestCopyWith<$Res> {
  __$ContentManifestCopyWithImpl(this._self, this._then);

  final _ContentManifest _self;
  final $Res Function(_ContentManifest) _then;

/// Create a copy of ContentManifest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? lessons = null,Object? puzzlePacks = null,}) {
  return _then(_ContentManifest(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,lessons: null == lessons ? _self._lessons : lessons // ignore: cast_nullable_to_non_nullable
as List<ContentIndexEntry>,puzzlePacks: null == puzzlePacks ? _self._puzzlePacks : puzzlePacks // ignore: cast_nullable_to_non_nullable
as List<ContentIndexEntry>,
  ));
}


}

// dart format on
