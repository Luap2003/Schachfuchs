// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameRecord {

 int? get id; String get ownerUserId; String get pgn; String get opponentType; String? get opponentName; GameOutcome get outcome; DateTime get playedAt; int? get durationSeconds; int? get moveCount; DateTime get updatedAt; SyncState get syncState;
/// Create a copy of GameRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameRecordCopyWith<GameRecord> get copyWith => _$GameRecordCopyWithImpl<GameRecord>(this as GameRecord, _$identity);

  /// Serializes this GameRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.pgn, pgn) || other.pgn == pgn)&&(identical(other.opponentType, opponentType) || other.opponentType == opponentType)&&(identical(other.opponentName, opponentName) || other.opponentName == opponentName)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.playedAt, playedAt) || other.playedAt == playedAt)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.moveCount, moveCount) || other.moveCount == moveCount)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerUserId,pgn,opponentType,opponentName,outcome,playedAt,durationSeconds,moveCount,updatedAt,syncState);

@override
String toString() {
  return 'GameRecord(id: $id, ownerUserId: $ownerUserId, pgn: $pgn, opponentType: $opponentType, opponentName: $opponentName, outcome: $outcome, playedAt: $playedAt, durationSeconds: $durationSeconds, moveCount: $moveCount, updatedAt: $updatedAt, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class $GameRecordCopyWith<$Res>  {
  factory $GameRecordCopyWith(GameRecord value, $Res Function(GameRecord) _then) = _$GameRecordCopyWithImpl;
@useResult
$Res call({
 int? id, String ownerUserId, String pgn, String opponentType, String? opponentName, GameOutcome outcome, DateTime playedAt, int? durationSeconds, int? moveCount, DateTime updatedAt, SyncState syncState
});




}
/// @nodoc
class _$GameRecordCopyWithImpl<$Res>
    implements $GameRecordCopyWith<$Res> {
  _$GameRecordCopyWithImpl(this._self, this._then);

  final GameRecord _self;
  final $Res Function(GameRecord) _then;

/// Create a copy of GameRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? ownerUserId = null,Object? pgn = null,Object? opponentType = null,Object? opponentName = freezed,Object? outcome = null,Object? playedAt = null,Object? durationSeconds = freezed,Object? moveCount = freezed,Object? updatedAt = null,Object? syncState = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,pgn: null == pgn ? _self.pgn : pgn // ignore: cast_nullable_to_non_nullable
as String,opponentType: null == opponentType ? _self.opponentType : opponentType // ignore: cast_nullable_to_non_nullable
as String,opponentName: freezed == opponentName ? _self.opponentName : opponentName // ignore: cast_nullable_to_non_nullable
as String?,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as GameOutcome,playedAt: null == playedAt ? _self.playedAt : playedAt // ignore: cast_nullable_to_non_nullable
as DateTime,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,moveCount: freezed == moveCount ? _self.moveCount : moveCount // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}

}


/// Adds pattern-matching-related methods to [GameRecord].
extension GameRecordPatterns on GameRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameRecord value)  $default,){
final _that = this;
switch (_that) {
case _GameRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameRecord value)?  $default,){
final _that = this;
switch (_that) {
case _GameRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String ownerUserId,  String pgn,  String opponentType,  String? opponentName,  GameOutcome outcome,  DateTime playedAt,  int? durationSeconds,  int? moveCount,  DateTime updatedAt,  SyncState syncState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameRecord() when $default != null:
return $default(_that.id,_that.ownerUserId,_that.pgn,_that.opponentType,_that.opponentName,_that.outcome,_that.playedAt,_that.durationSeconds,_that.moveCount,_that.updatedAt,_that.syncState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String ownerUserId,  String pgn,  String opponentType,  String? opponentName,  GameOutcome outcome,  DateTime playedAt,  int? durationSeconds,  int? moveCount,  DateTime updatedAt,  SyncState syncState)  $default,) {final _that = this;
switch (_that) {
case _GameRecord():
return $default(_that.id,_that.ownerUserId,_that.pgn,_that.opponentType,_that.opponentName,_that.outcome,_that.playedAt,_that.durationSeconds,_that.moveCount,_that.updatedAt,_that.syncState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String ownerUserId,  String pgn,  String opponentType,  String? opponentName,  GameOutcome outcome,  DateTime playedAt,  int? durationSeconds,  int? moveCount,  DateTime updatedAt,  SyncState syncState)?  $default,) {final _that = this;
switch (_that) {
case _GameRecord() when $default != null:
return $default(_that.id,_that.ownerUserId,_that.pgn,_that.opponentType,_that.opponentName,_that.outcome,_that.playedAt,_that.durationSeconds,_that.moveCount,_that.updatedAt,_that.syncState);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameRecord implements GameRecord {
  const _GameRecord({this.id, required this.ownerUserId, required this.pgn, required this.opponentType, this.opponentName, required this.outcome, required this.playedAt, this.durationSeconds, this.moveCount, required this.updatedAt, this.syncState = SyncState.localOnly});
  factory _GameRecord.fromJson(Map<String, dynamic> json) => _$GameRecordFromJson(json);

@override final  int? id;
@override final  String ownerUserId;
@override final  String pgn;
@override final  String opponentType;
@override final  String? opponentName;
@override final  GameOutcome outcome;
@override final  DateTime playedAt;
@override final  int? durationSeconds;
@override final  int? moveCount;
@override final  DateTime updatedAt;
@override@JsonKey() final  SyncState syncState;

/// Create a copy of GameRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameRecordCopyWith<_GameRecord> get copyWith => __$GameRecordCopyWithImpl<_GameRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.pgn, pgn) || other.pgn == pgn)&&(identical(other.opponentType, opponentType) || other.opponentType == opponentType)&&(identical(other.opponentName, opponentName) || other.opponentName == opponentName)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.playedAt, playedAt) || other.playedAt == playedAt)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.moveCount, moveCount) || other.moveCount == moveCount)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerUserId,pgn,opponentType,opponentName,outcome,playedAt,durationSeconds,moveCount,updatedAt,syncState);

@override
String toString() {
  return 'GameRecord(id: $id, ownerUserId: $ownerUserId, pgn: $pgn, opponentType: $opponentType, opponentName: $opponentName, outcome: $outcome, playedAt: $playedAt, durationSeconds: $durationSeconds, moveCount: $moveCount, updatedAt: $updatedAt, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class _$GameRecordCopyWith<$Res> implements $GameRecordCopyWith<$Res> {
  factory _$GameRecordCopyWith(_GameRecord value, $Res Function(_GameRecord) _then) = __$GameRecordCopyWithImpl;
@override @useResult
$Res call({
 int? id, String ownerUserId, String pgn, String opponentType, String? opponentName, GameOutcome outcome, DateTime playedAt, int? durationSeconds, int? moveCount, DateTime updatedAt, SyncState syncState
});




}
/// @nodoc
class __$GameRecordCopyWithImpl<$Res>
    implements _$GameRecordCopyWith<$Res> {
  __$GameRecordCopyWithImpl(this._self, this._then);

  final _GameRecord _self;
  final $Res Function(_GameRecord) _then;

/// Create a copy of GameRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? ownerUserId = null,Object? pgn = null,Object? opponentType = null,Object? opponentName = freezed,Object? outcome = null,Object? playedAt = null,Object? durationSeconds = freezed,Object? moveCount = freezed,Object? updatedAt = null,Object? syncState = null,}) {
  return _then(_GameRecord(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,pgn: null == pgn ? _self.pgn : pgn // ignore: cast_nullable_to_non_nullable
as String,opponentType: null == opponentType ? _self.opponentType : opponentType // ignore: cast_nullable_to_non_nullable
as String,opponentName: freezed == opponentName ? _self.opponentName : opponentName // ignore: cast_nullable_to_non_nullable
as String?,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as GameOutcome,playedAt: null == playedAt ? _self.playedAt : playedAt // ignore: cast_nullable_to_non_nullable
as DateTime,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,moveCount: freezed == moveCount ? _self.moveCount : moveCount // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}


}

// dart format on
