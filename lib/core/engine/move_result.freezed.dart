// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameResult {

 GameResultType get type; String get message;
/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameResultCopyWith<GameResult> get copyWith => _$GameResultCopyWithImpl<GameResult>(this as GameResult, _$identity);

  /// Serializes this GameResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResult&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,message);

@override
String toString() {
  return 'GameResult(type: $type, message: $message)';
}


}

/// @nodoc
abstract mixin class $GameResultCopyWith<$Res>  {
  factory $GameResultCopyWith(GameResult value, $Res Function(GameResult) _then) = _$GameResultCopyWithImpl;
@useResult
$Res call({
 GameResultType type, String message
});




}
/// @nodoc
class _$GameResultCopyWithImpl<$Res>
    implements $GameResultCopyWith<$Res> {
  _$GameResultCopyWithImpl(this._self, this._then);

  final GameResult _self;
  final $Res Function(GameResult) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? message = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GameResultType,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GameResult].
extension GameResultPatterns on GameResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameResult value)  $default,){
final _that = this;
switch (_that) {
case _GameResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameResult value)?  $default,){
final _that = this;
switch (_that) {
case _GameResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GameResultType type,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameResult() when $default != null:
return $default(_that.type,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GameResultType type,  String message)  $default,) {final _that = this;
switch (_that) {
case _GameResult():
return $default(_that.type,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GameResultType type,  String message)?  $default,) {final _that = this;
switch (_that) {
case _GameResult() when $default != null:
return $default(_that.type,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameResult implements GameResult {
  const _GameResult({required this.type, required this.message});
  factory _GameResult.fromJson(Map<String, dynamic> json) => _$GameResultFromJson(json);

@override final  GameResultType type;
@override final  String message;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameResultCopyWith<_GameResult> get copyWith => __$GameResultCopyWithImpl<_GameResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameResult&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,message);

@override
String toString() {
  return 'GameResult(type: $type, message: $message)';
}


}

/// @nodoc
abstract mixin class _$GameResultCopyWith<$Res> implements $GameResultCopyWith<$Res> {
  factory _$GameResultCopyWith(_GameResult value, $Res Function(_GameResult) _then) = __$GameResultCopyWithImpl;
@override @useResult
$Res call({
 GameResultType type, String message
});




}
/// @nodoc
class __$GameResultCopyWithImpl<$Res>
    implements _$GameResultCopyWith<$Res> {
  __$GameResultCopyWithImpl(this._self, this._then);

  final _GameResult _self;
  final $Res Function(_GameResult) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? message = null,}) {
  return _then(_GameResult(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GameResultType,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MoveResult {

 bool get isLegal; String? get playedMove; String? get message; bool get isCheck; bool get isCheckmate; bool get isStalemate; bool get isDraw; String? get winner;
/// Create a copy of MoveResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveResultCopyWith<MoveResult> get copyWith => _$MoveResultCopyWithImpl<MoveResult>(this as MoveResult, _$identity);

  /// Serializes this MoveResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveResult&&(identical(other.isLegal, isLegal) || other.isLegal == isLegal)&&(identical(other.playedMove, playedMove) || other.playedMove == playedMove)&&(identical(other.message, message) || other.message == message)&&(identical(other.isCheck, isCheck) || other.isCheck == isCheck)&&(identical(other.isCheckmate, isCheckmate) || other.isCheckmate == isCheckmate)&&(identical(other.isStalemate, isStalemate) || other.isStalemate == isStalemate)&&(identical(other.isDraw, isDraw) || other.isDraw == isDraw)&&(identical(other.winner, winner) || other.winner == winner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLegal,playedMove,message,isCheck,isCheckmate,isStalemate,isDraw,winner);

@override
String toString() {
  return 'MoveResult(isLegal: $isLegal, playedMove: $playedMove, message: $message, isCheck: $isCheck, isCheckmate: $isCheckmate, isStalemate: $isStalemate, isDraw: $isDraw, winner: $winner)';
}


}

/// @nodoc
abstract mixin class $MoveResultCopyWith<$Res>  {
  factory $MoveResultCopyWith(MoveResult value, $Res Function(MoveResult) _then) = _$MoveResultCopyWithImpl;
@useResult
$Res call({
 bool isLegal, String? playedMove, String? message, bool isCheck, bool isCheckmate, bool isStalemate, bool isDraw, String? winner
});




}
/// @nodoc
class _$MoveResultCopyWithImpl<$Res>
    implements $MoveResultCopyWith<$Res> {
  _$MoveResultCopyWithImpl(this._self, this._then);

  final MoveResult _self;
  final $Res Function(MoveResult) _then;

/// Create a copy of MoveResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLegal = null,Object? playedMove = freezed,Object? message = freezed,Object? isCheck = null,Object? isCheckmate = null,Object? isStalemate = null,Object? isDraw = null,Object? winner = freezed,}) {
  return _then(_self.copyWith(
isLegal: null == isLegal ? _self.isLegal : isLegal // ignore: cast_nullable_to_non_nullable
as bool,playedMove: freezed == playedMove ? _self.playedMove : playedMove // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,isCheck: null == isCheck ? _self.isCheck : isCheck // ignore: cast_nullable_to_non_nullable
as bool,isCheckmate: null == isCheckmate ? _self.isCheckmate : isCheckmate // ignore: cast_nullable_to_non_nullable
as bool,isStalemate: null == isStalemate ? _self.isStalemate : isStalemate // ignore: cast_nullable_to_non_nullable
as bool,isDraw: null == isDraw ? _self.isDraw : isDraw // ignore: cast_nullable_to_non_nullable
as bool,winner: freezed == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MoveResult].
extension MoveResultPatterns on MoveResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoveResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoveResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoveResult value)  $default,){
final _that = this;
switch (_that) {
case _MoveResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoveResult value)?  $default,){
final _that = this;
switch (_that) {
case _MoveResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLegal,  String? playedMove,  String? message,  bool isCheck,  bool isCheckmate,  bool isStalemate,  bool isDraw,  String? winner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoveResult() when $default != null:
return $default(_that.isLegal,_that.playedMove,_that.message,_that.isCheck,_that.isCheckmate,_that.isStalemate,_that.isDraw,_that.winner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLegal,  String? playedMove,  String? message,  bool isCheck,  bool isCheckmate,  bool isStalemate,  bool isDraw,  String? winner)  $default,) {final _that = this;
switch (_that) {
case _MoveResult():
return $default(_that.isLegal,_that.playedMove,_that.message,_that.isCheck,_that.isCheckmate,_that.isStalemate,_that.isDraw,_that.winner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLegal,  String? playedMove,  String? message,  bool isCheck,  bool isCheckmate,  bool isStalemate,  bool isDraw,  String? winner)?  $default,) {final _that = this;
switch (_that) {
case _MoveResult() when $default != null:
return $default(_that.isLegal,_that.playedMove,_that.message,_that.isCheck,_that.isCheckmate,_that.isStalemate,_that.isDraw,_that.winner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoveResult implements MoveResult {
  const _MoveResult({required this.isLegal, this.playedMove, this.message, this.isCheck = false, this.isCheckmate = false, this.isStalemate = false, this.isDraw = false, this.winner});
  factory _MoveResult.fromJson(Map<String, dynamic> json) => _$MoveResultFromJson(json);

@override final  bool isLegal;
@override final  String? playedMove;
@override final  String? message;
@override@JsonKey() final  bool isCheck;
@override@JsonKey() final  bool isCheckmate;
@override@JsonKey() final  bool isStalemate;
@override@JsonKey() final  bool isDraw;
@override final  String? winner;

/// Create a copy of MoveResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoveResultCopyWith<_MoveResult> get copyWith => __$MoveResultCopyWithImpl<_MoveResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoveResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoveResult&&(identical(other.isLegal, isLegal) || other.isLegal == isLegal)&&(identical(other.playedMove, playedMove) || other.playedMove == playedMove)&&(identical(other.message, message) || other.message == message)&&(identical(other.isCheck, isCheck) || other.isCheck == isCheck)&&(identical(other.isCheckmate, isCheckmate) || other.isCheckmate == isCheckmate)&&(identical(other.isStalemate, isStalemate) || other.isStalemate == isStalemate)&&(identical(other.isDraw, isDraw) || other.isDraw == isDraw)&&(identical(other.winner, winner) || other.winner == winner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLegal,playedMove,message,isCheck,isCheckmate,isStalemate,isDraw,winner);

@override
String toString() {
  return 'MoveResult(isLegal: $isLegal, playedMove: $playedMove, message: $message, isCheck: $isCheck, isCheckmate: $isCheckmate, isStalemate: $isStalemate, isDraw: $isDraw, winner: $winner)';
}


}

/// @nodoc
abstract mixin class _$MoveResultCopyWith<$Res> implements $MoveResultCopyWith<$Res> {
  factory _$MoveResultCopyWith(_MoveResult value, $Res Function(_MoveResult) _then) = __$MoveResultCopyWithImpl;
@override @useResult
$Res call({
 bool isLegal, String? playedMove, String? message, bool isCheck, bool isCheckmate, bool isStalemate, bool isDraw, String? winner
});




}
/// @nodoc
class __$MoveResultCopyWithImpl<$Res>
    implements _$MoveResultCopyWith<$Res> {
  __$MoveResultCopyWithImpl(this._self, this._then);

  final _MoveResult _self;
  final $Res Function(_MoveResult) _then;

/// Create a copy of MoveResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLegal = null,Object? playedMove = freezed,Object? message = freezed,Object? isCheck = null,Object? isCheckmate = null,Object? isStalemate = null,Object? isDraw = null,Object? winner = freezed,}) {
  return _then(_MoveResult(
isLegal: null == isLegal ? _self.isLegal : isLegal // ignore: cast_nullable_to_non_nullable
as bool,playedMove: freezed == playedMove ? _self.playedMove : playedMove // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,isCheck: null == isCheck ? _self.isCheck : isCheck // ignore: cast_nullable_to_non_nullable
as bool,isCheckmate: null == isCheckmate ? _self.isCheckmate : isCheckmate // ignore: cast_nullable_to_non_nullable
as bool,isStalemate: null == isStalemate ? _self.isStalemate : isStalemate // ignore: cast_nullable_to_non_nullable
as bool,isDraw: null == isDraw ? _self.isDraw : isDraw // ignore: cast_nullable_to_non_nullable
as bool,winner: freezed == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
