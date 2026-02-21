// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LessonProgress {

 String get ownerUserId; String get lessonId; int get currentStepIndex; bool get isCompleted; int get starsEarned; DateTime? get completedAt; int get attempts; DateTime get updatedAt; SyncState get syncState;
/// Create a copy of LessonProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonProgressCopyWith<LessonProgress> get copyWith => _$LessonProgressCopyWithImpl<LessonProgress>(this as LessonProgress, _$identity);

  /// Serializes this LessonProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonProgress&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.starsEarned, starsEarned) || other.starsEarned == starsEarned)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ownerUserId,lessonId,currentStepIndex,isCompleted,starsEarned,completedAt,attempts,updatedAt,syncState);

@override
String toString() {
  return 'LessonProgress(ownerUserId: $ownerUserId, lessonId: $lessonId, currentStepIndex: $currentStepIndex, isCompleted: $isCompleted, starsEarned: $starsEarned, completedAt: $completedAt, attempts: $attempts, updatedAt: $updatedAt, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class $LessonProgressCopyWith<$Res>  {
  factory $LessonProgressCopyWith(LessonProgress value, $Res Function(LessonProgress) _then) = _$LessonProgressCopyWithImpl;
@useResult
$Res call({
 String ownerUserId, String lessonId, int currentStepIndex, bool isCompleted, int starsEarned, DateTime? completedAt, int attempts, DateTime updatedAt, SyncState syncState
});




}
/// @nodoc
class _$LessonProgressCopyWithImpl<$Res>
    implements $LessonProgressCopyWith<$Res> {
  _$LessonProgressCopyWithImpl(this._self, this._then);

  final LessonProgress _self;
  final $Res Function(LessonProgress) _then;

/// Create a copy of LessonProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ownerUserId = null,Object? lessonId = null,Object? currentStepIndex = null,Object? isCompleted = null,Object? starsEarned = null,Object? completedAt = freezed,Object? attempts = null,Object? updatedAt = null,Object? syncState = null,}) {
  return _then(_self.copyWith(
ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,starsEarned: null == starsEarned ? _self.starsEarned : starsEarned // ignore: cast_nullable_to_non_nullable
as int,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonProgress].
extension LessonProgressPatterns on LessonProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonProgress value)  $default,){
final _that = this;
switch (_that) {
case _LessonProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonProgress value)?  $default,){
final _that = this;
switch (_that) {
case _LessonProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ownerUserId,  String lessonId,  int currentStepIndex,  bool isCompleted,  int starsEarned,  DateTime? completedAt,  int attempts,  DateTime updatedAt,  SyncState syncState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonProgress() when $default != null:
return $default(_that.ownerUserId,_that.lessonId,_that.currentStepIndex,_that.isCompleted,_that.starsEarned,_that.completedAt,_that.attempts,_that.updatedAt,_that.syncState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ownerUserId,  String lessonId,  int currentStepIndex,  bool isCompleted,  int starsEarned,  DateTime? completedAt,  int attempts,  DateTime updatedAt,  SyncState syncState)  $default,) {final _that = this;
switch (_that) {
case _LessonProgress():
return $default(_that.ownerUserId,_that.lessonId,_that.currentStepIndex,_that.isCompleted,_that.starsEarned,_that.completedAt,_that.attempts,_that.updatedAt,_that.syncState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ownerUserId,  String lessonId,  int currentStepIndex,  bool isCompleted,  int starsEarned,  DateTime? completedAt,  int attempts,  DateTime updatedAt,  SyncState syncState)?  $default,) {final _that = this;
switch (_that) {
case _LessonProgress() when $default != null:
return $default(_that.ownerUserId,_that.lessonId,_that.currentStepIndex,_that.isCompleted,_that.starsEarned,_that.completedAt,_that.attempts,_that.updatedAt,_that.syncState);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LessonProgress implements LessonProgress {
  const _LessonProgress({required this.ownerUserId, required this.lessonId, this.currentStepIndex = 0, this.isCompleted = false, this.starsEarned = 0, this.completedAt, this.attempts = 0, required this.updatedAt, this.syncState = SyncState.localOnly});
  factory _LessonProgress.fromJson(Map<String, dynamic> json) => _$LessonProgressFromJson(json);

@override final  String ownerUserId;
@override final  String lessonId;
@override@JsonKey() final  int currentStepIndex;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  int starsEarned;
@override final  DateTime? completedAt;
@override@JsonKey() final  int attempts;
@override final  DateTime updatedAt;
@override@JsonKey() final  SyncState syncState;

/// Create a copy of LessonProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonProgressCopyWith<_LessonProgress> get copyWith => __$LessonProgressCopyWithImpl<_LessonProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LessonProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonProgress&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.starsEarned, starsEarned) || other.starsEarned == starsEarned)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ownerUserId,lessonId,currentStepIndex,isCompleted,starsEarned,completedAt,attempts,updatedAt,syncState);

@override
String toString() {
  return 'LessonProgress(ownerUserId: $ownerUserId, lessonId: $lessonId, currentStepIndex: $currentStepIndex, isCompleted: $isCompleted, starsEarned: $starsEarned, completedAt: $completedAt, attempts: $attempts, updatedAt: $updatedAt, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class _$LessonProgressCopyWith<$Res> implements $LessonProgressCopyWith<$Res> {
  factory _$LessonProgressCopyWith(_LessonProgress value, $Res Function(_LessonProgress) _then) = __$LessonProgressCopyWithImpl;
@override @useResult
$Res call({
 String ownerUserId, String lessonId, int currentStepIndex, bool isCompleted, int starsEarned, DateTime? completedAt, int attempts, DateTime updatedAt, SyncState syncState
});




}
/// @nodoc
class __$LessonProgressCopyWithImpl<$Res>
    implements _$LessonProgressCopyWith<$Res> {
  __$LessonProgressCopyWithImpl(this._self, this._then);

  final _LessonProgress _self;
  final $Res Function(_LessonProgress) _then;

/// Create a copy of LessonProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ownerUserId = null,Object? lessonId = null,Object? currentStepIndex = null,Object? isCompleted = null,Object? starsEarned = null,Object? completedAt = freezed,Object? attempts = null,Object? updatedAt = null,Object? syncState = null,}) {
  return _then(_LessonProgress(
ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,starsEarned: null == starsEarned ? _self.starsEarned : starsEarned // ignore: cast_nullable_to_non_nullable
as int,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}


}


/// @nodoc
mixin _$PuzzleProgress {

 String get ownerUserId; String get puzzleId; String get packId; bool get isSolved; int? get bestTimeMs; int get hintsUsed; int get attempts; DateTime? get solvedAt; DateTime get updatedAt; SyncState get syncState;
/// Create a copy of PuzzleProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PuzzleProgressCopyWith<PuzzleProgress> get copyWith => _$PuzzleProgressCopyWithImpl<PuzzleProgress>(this as PuzzleProgress, _$identity);

  /// Serializes this PuzzleProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PuzzleProgress&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.puzzleId, puzzleId) || other.puzzleId == puzzleId)&&(identical(other.packId, packId) || other.packId == packId)&&(identical(other.isSolved, isSolved) || other.isSolved == isSolved)&&(identical(other.bestTimeMs, bestTimeMs) || other.bestTimeMs == bestTimeMs)&&(identical(other.hintsUsed, hintsUsed) || other.hintsUsed == hintsUsed)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.solvedAt, solvedAt) || other.solvedAt == solvedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ownerUserId,puzzleId,packId,isSolved,bestTimeMs,hintsUsed,attempts,solvedAt,updatedAt,syncState);

@override
String toString() {
  return 'PuzzleProgress(ownerUserId: $ownerUserId, puzzleId: $puzzleId, packId: $packId, isSolved: $isSolved, bestTimeMs: $bestTimeMs, hintsUsed: $hintsUsed, attempts: $attempts, solvedAt: $solvedAt, updatedAt: $updatedAt, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class $PuzzleProgressCopyWith<$Res>  {
  factory $PuzzleProgressCopyWith(PuzzleProgress value, $Res Function(PuzzleProgress) _then) = _$PuzzleProgressCopyWithImpl;
@useResult
$Res call({
 String ownerUserId, String puzzleId, String packId, bool isSolved, int? bestTimeMs, int hintsUsed, int attempts, DateTime? solvedAt, DateTime updatedAt, SyncState syncState
});




}
/// @nodoc
class _$PuzzleProgressCopyWithImpl<$Res>
    implements $PuzzleProgressCopyWith<$Res> {
  _$PuzzleProgressCopyWithImpl(this._self, this._then);

  final PuzzleProgress _self;
  final $Res Function(PuzzleProgress) _then;

/// Create a copy of PuzzleProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ownerUserId = null,Object? puzzleId = null,Object? packId = null,Object? isSolved = null,Object? bestTimeMs = freezed,Object? hintsUsed = null,Object? attempts = null,Object? solvedAt = freezed,Object? updatedAt = null,Object? syncState = null,}) {
  return _then(_self.copyWith(
ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,puzzleId: null == puzzleId ? _self.puzzleId : puzzleId // ignore: cast_nullable_to_non_nullable
as String,packId: null == packId ? _self.packId : packId // ignore: cast_nullable_to_non_nullable
as String,isSolved: null == isSolved ? _self.isSolved : isSolved // ignore: cast_nullable_to_non_nullable
as bool,bestTimeMs: freezed == bestTimeMs ? _self.bestTimeMs : bestTimeMs // ignore: cast_nullable_to_non_nullable
as int?,hintsUsed: null == hintsUsed ? _self.hintsUsed : hintsUsed // ignore: cast_nullable_to_non_nullable
as int,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,solvedAt: freezed == solvedAt ? _self.solvedAt : solvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}

}


/// Adds pattern-matching-related methods to [PuzzleProgress].
extension PuzzleProgressPatterns on PuzzleProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PuzzleProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PuzzleProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PuzzleProgress value)  $default,){
final _that = this;
switch (_that) {
case _PuzzleProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PuzzleProgress value)?  $default,){
final _that = this;
switch (_that) {
case _PuzzleProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ownerUserId,  String puzzleId,  String packId,  bool isSolved,  int? bestTimeMs,  int hintsUsed,  int attempts,  DateTime? solvedAt,  DateTime updatedAt,  SyncState syncState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PuzzleProgress() when $default != null:
return $default(_that.ownerUserId,_that.puzzleId,_that.packId,_that.isSolved,_that.bestTimeMs,_that.hintsUsed,_that.attempts,_that.solvedAt,_that.updatedAt,_that.syncState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ownerUserId,  String puzzleId,  String packId,  bool isSolved,  int? bestTimeMs,  int hintsUsed,  int attempts,  DateTime? solvedAt,  DateTime updatedAt,  SyncState syncState)  $default,) {final _that = this;
switch (_that) {
case _PuzzleProgress():
return $default(_that.ownerUserId,_that.puzzleId,_that.packId,_that.isSolved,_that.bestTimeMs,_that.hintsUsed,_that.attempts,_that.solvedAt,_that.updatedAt,_that.syncState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ownerUserId,  String puzzleId,  String packId,  bool isSolved,  int? bestTimeMs,  int hintsUsed,  int attempts,  DateTime? solvedAt,  DateTime updatedAt,  SyncState syncState)?  $default,) {final _that = this;
switch (_that) {
case _PuzzleProgress() when $default != null:
return $default(_that.ownerUserId,_that.puzzleId,_that.packId,_that.isSolved,_that.bestTimeMs,_that.hintsUsed,_that.attempts,_that.solvedAt,_that.updatedAt,_that.syncState);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PuzzleProgress implements PuzzleProgress {
  const _PuzzleProgress({required this.ownerUserId, required this.puzzleId, required this.packId, this.isSolved = false, this.bestTimeMs, this.hintsUsed = 0, this.attempts = 0, this.solvedAt, required this.updatedAt, this.syncState = SyncState.localOnly});
  factory _PuzzleProgress.fromJson(Map<String, dynamic> json) => _$PuzzleProgressFromJson(json);

@override final  String ownerUserId;
@override final  String puzzleId;
@override final  String packId;
@override@JsonKey() final  bool isSolved;
@override final  int? bestTimeMs;
@override@JsonKey() final  int hintsUsed;
@override@JsonKey() final  int attempts;
@override final  DateTime? solvedAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  SyncState syncState;

/// Create a copy of PuzzleProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PuzzleProgressCopyWith<_PuzzleProgress> get copyWith => __$PuzzleProgressCopyWithImpl<_PuzzleProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PuzzleProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PuzzleProgress&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.puzzleId, puzzleId) || other.puzzleId == puzzleId)&&(identical(other.packId, packId) || other.packId == packId)&&(identical(other.isSolved, isSolved) || other.isSolved == isSolved)&&(identical(other.bestTimeMs, bestTimeMs) || other.bestTimeMs == bestTimeMs)&&(identical(other.hintsUsed, hintsUsed) || other.hintsUsed == hintsUsed)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.solvedAt, solvedAt) || other.solvedAt == solvedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ownerUserId,puzzleId,packId,isSolved,bestTimeMs,hintsUsed,attempts,solvedAt,updatedAt,syncState);

@override
String toString() {
  return 'PuzzleProgress(ownerUserId: $ownerUserId, puzzleId: $puzzleId, packId: $packId, isSolved: $isSolved, bestTimeMs: $bestTimeMs, hintsUsed: $hintsUsed, attempts: $attempts, solvedAt: $solvedAt, updatedAt: $updatedAt, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class _$PuzzleProgressCopyWith<$Res> implements $PuzzleProgressCopyWith<$Res> {
  factory _$PuzzleProgressCopyWith(_PuzzleProgress value, $Res Function(_PuzzleProgress) _then) = __$PuzzleProgressCopyWithImpl;
@override @useResult
$Res call({
 String ownerUserId, String puzzleId, String packId, bool isSolved, int? bestTimeMs, int hintsUsed, int attempts, DateTime? solvedAt, DateTime updatedAt, SyncState syncState
});




}
/// @nodoc
class __$PuzzleProgressCopyWithImpl<$Res>
    implements _$PuzzleProgressCopyWith<$Res> {
  __$PuzzleProgressCopyWithImpl(this._self, this._then);

  final _PuzzleProgress _self;
  final $Res Function(_PuzzleProgress) _then;

/// Create a copy of PuzzleProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ownerUserId = null,Object? puzzleId = null,Object? packId = null,Object? isSolved = null,Object? bestTimeMs = freezed,Object? hintsUsed = null,Object? attempts = null,Object? solvedAt = freezed,Object? updatedAt = null,Object? syncState = null,}) {
  return _then(_PuzzleProgress(
ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,puzzleId: null == puzzleId ? _self.puzzleId : puzzleId // ignore: cast_nullable_to_non_nullable
as String,packId: null == packId ? _self.packId : packId // ignore: cast_nullable_to_non_nullable
as String,isSolved: null == isSolved ? _self.isSolved : isSolved // ignore: cast_nullable_to_non_nullable
as bool,bestTimeMs: freezed == bestTimeMs ? _self.bestTimeMs : bestTimeMs // ignore: cast_nullable_to_non_nullable
as int?,hintsUsed: null == hintsUsed ? _self.hintsUsed : hintsUsed // ignore: cast_nullable_to_non_nullable
as int,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,solvedAt: freezed == solvedAt ? _self.solvedAt : solvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}


}

// dart format on
