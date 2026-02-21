// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_ai_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedAiGame {

 int? get id; String get ownerUserId; int get skillLevel; List<String> get movesUci; DateTime get createdAt; DateTime get updatedAt; SyncState get syncState;
/// Create a copy of SavedAiGame
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedAiGameCopyWith<SavedAiGame> get copyWith => _$SavedAiGameCopyWithImpl<SavedAiGame>(this as SavedAiGame, _$identity);

  /// Serializes this SavedAiGame to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedAiGame&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.skillLevel, skillLevel) || other.skillLevel == skillLevel)&&const DeepCollectionEquality().equals(other.movesUci, movesUci)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerUserId,skillLevel,const DeepCollectionEquality().hash(movesUci),createdAt,updatedAt,syncState);

@override
String toString() {
  return 'SavedAiGame(id: $id, ownerUserId: $ownerUserId, skillLevel: $skillLevel, movesUci: $movesUci, createdAt: $createdAt, updatedAt: $updatedAt, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class $SavedAiGameCopyWith<$Res>  {
  factory $SavedAiGameCopyWith(SavedAiGame value, $Res Function(SavedAiGame) _then) = _$SavedAiGameCopyWithImpl;
@useResult
$Res call({
 int? id, String ownerUserId, int skillLevel, List<String> movesUci, DateTime createdAt, DateTime updatedAt, SyncState syncState
});




}
/// @nodoc
class _$SavedAiGameCopyWithImpl<$Res>
    implements $SavedAiGameCopyWith<$Res> {
  _$SavedAiGameCopyWithImpl(this._self, this._then);

  final SavedAiGame _self;
  final $Res Function(SavedAiGame) _then;

/// Create a copy of SavedAiGame
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? ownerUserId = null,Object? skillLevel = null,Object? movesUci = null,Object? createdAt = null,Object? updatedAt = null,Object? syncState = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,skillLevel: null == skillLevel ? _self.skillLevel : skillLevel // ignore: cast_nullable_to_non_nullable
as int,movesUci: null == movesUci ? _self.movesUci : movesUci // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedAiGame].
extension SavedAiGamePatterns on SavedAiGame {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedAiGame value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedAiGame() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedAiGame value)  $default,){
final _that = this;
switch (_that) {
case _SavedAiGame():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedAiGame value)?  $default,){
final _that = this;
switch (_that) {
case _SavedAiGame() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String ownerUserId,  int skillLevel,  List<String> movesUci,  DateTime createdAt,  DateTime updatedAt,  SyncState syncState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedAiGame() when $default != null:
return $default(_that.id,_that.ownerUserId,_that.skillLevel,_that.movesUci,_that.createdAt,_that.updatedAt,_that.syncState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String ownerUserId,  int skillLevel,  List<String> movesUci,  DateTime createdAt,  DateTime updatedAt,  SyncState syncState)  $default,) {final _that = this;
switch (_that) {
case _SavedAiGame():
return $default(_that.id,_that.ownerUserId,_that.skillLevel,_that.movesUci,_that.createdAt,_that.updatedAt,_that.syncState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String ownerUserId,  int skillLevel,  List<String> movesUci,  DateTime createdAt,  DateTime updatedAt,  SyncState syncState)?  $default,) {final _that = this;
switch (_that) {
case _SavedAiGame() when $default != null:
return $default(_that.id,_that.ownerUserId,_that.skillLevel,_that.movesUci,_that.createdAt,_that.updatedAt,_that.syncState);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedAiGame implements SavedAiGame {
  const _SavedAiGame({this.id, required this.ownerUserId, required this.skillLevel, final  List<String> movesUci = const <String>[], required this.createdAt, required this.updatedAt, this.syncState = SyncState.localOnly}): _movesUci = movesUci;
  factory _SavedAiGame.fromJson(Map<String, dynamic> json) => _$SavedAiGameFromJson(json);

@override final  int? id;
@override final  String ownerUserId;
@override final  int skillLevel;
 final  List<String> _movesUci;
@override@JsonKey() List<String> get movesUci {
  if (_movesUci is EqualUnmodifiableListView) return _movesUci;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movesUci);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  SyncState syncState;

/// Create a copy of SavedAiGame
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedAiGameCopyWith<_SavedAiGame> get copyWith => __$SavedAiGameCopyWithImpl<_SavedAiGame>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedAiGameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedAiGame&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.skillLevel, skillLevel) || other.skillLevel == skillLevel)&&const DeepCollectionEquality().equals(other._movesUci, _movesUci)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerUserId,skillLevel,const DeepCollectionEquality().hash(_movesUci),createdAt,updatedAt,syncState);

@override
String toString() {
  return 'SavedAiGame(id: $id, ownerUserId: $ownerUserId, skillLevel: $skillLevel, movesUci: $movesUci, createdAt: $createdAt, updatedAt: $updatedAt, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class _$SavedAiGameCopyWith<$Res> implements $SavedAiGameCopyWith<$Res> {
  factory _$SavedAiGameCopyWith(_SavedAiGame value, $Res Function(_SavedAiGame) _then) = __$SavedAiGameCopyWithImpl;
@override @useResult
$Res call({
 int? id, String ownerUserId, int skillLevel, List<String> movesUci, DateTime createdAt, DateTime updatedAt, SyncState syncState
});




}
/// @nodoc
class __$SavedAiGameCopyWithImpl<$Res>
    implements _$SavedAiGameCopyWith<$Res> {
  __$SavedAiGameCopyWithImpl(this._self, this._then);

  final _SavedAiGame _self;
  final $Res Function(_SavedAiGame) _then;

/// Create a copy of SavedAiGame
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? ownerUserId = null,Object? skillLevel = null,Object? movesUci = null,Object? createdAt = null,Object? updatedAt = null,Object? syncState = null,}) {
  return _then(_SavedAiGame(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,skillLevel: null == skillLevel ? _self.skillLevel : skillLevel // ignore: cast_nullable_to_non_nullable
as int,movesUci: null == movesUci ? _self._movesUci : movesUci // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}


}

// dart format on
