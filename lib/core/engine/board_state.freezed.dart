// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardState {

 String get fen; String get turn; bool get isCheck; bool get isCheckmate; bool get isStalemate; bool get isDraw;
/// Create a copy of BoardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardStateCopyWith<BoardState> get copyWith => _$BoardStateCopyWithImpl<BoardState>(this as BoardState, _$identity);

  /// Serializes this BoardState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardState&&(identical(other.fen, fen) || other.fen == fen)&&(identical(other.turn, turn) || other.turn == turn)&&(identical(other.isCheck, isCheck) || other.isCheck == isCheck)&&(identical(other.isCheckmate, isCheckmate) || other.isCheckmate == isCheckmate)&&(identical(other.isStalemate, isStalemate) || other.isStalemate == isStalemate)&&(identical(other.isDraw, isDraw) || other.isDraw == isDraw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fen,turn,isCheck,isCheckmate,isStalemate,isDraw);

@override
String toString() {
  return 'BoardState(fen: $fen, turn: $turn, isCheck: $isCheck, isCheckmate: $isCheckmate, isStalemate: $isStalemate, isDraw: $isDraw)';
}


}

/// @nodoc
abstract mixin class $BoardStateCopyWith<$Res>  {
  factory $BoardStateCopyWith(BoardState value, $Res Function(BoardState) _then) = _$BoardStateCopyWithImpl;
@useResult
$Res call({
 String fen, String turn, bool isCheck, bool isCheckmate, bool isStalemate, bool isDraw
});




}
/// @nodoc
class _$BoardStateCopyWithImpl<$Res>
    implements $BoardStateCopyWith<$Res> {
  _$BoardStateCopyWithImpl(this._self, this._then);

  final BoardState _self;
  final $Res Function(BoardState) _then;

/// Create a copy of BoardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fen = null,Object? turn = null,Object? isCheck = null,Object? isCheckmate = null,Object? isStalemate = null,Object? isDraw = null,}) {
  return _then(_self.copyWith(
fen: null == fen ? _self.fen : fen // ignore: cast_nullable_to_non_nullable
as String,turn: null == turn ? _self.turn : turn // ignore: cast_nullable_to_non_nullable
as String,isCheck: null == isCheck ? _self.isCheck : isCheck // ignore: cast_nullable_to_non_nullable
as bool,isCheckmate: null == isCheckmate ? _self.isCheckmate : isCheckmate // ignore: cast_nullable_to_non_nullable
as bool,isStalemate: null == isStalemate ? _self.isStalemate : isStalemate // ignore: cast_nullable_to_non_nullable
as bool,isDraw: null == isDraw ? _self.isDraw : isDraw // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardState].
extension BoardStatePatterns on BoardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardState value)  $default,){
final _that = this;
switch (_that) {
case _BoardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardState value)?  $default,){
final _that = this;
switch (_that) {
case _BoardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fen,  String turn,  bool isCheck,  bool isCheckmate,  bool isStalemate,  bool isDraw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardState() when $default != null:
return $default(_that.fen,_that.turn,_that.isCheck,_that.isCheckmate,_that.isStalemate,_that.isDraw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fen,  String turn,  bool isCheck,  bool isCheckmate,  bool isStalemate,  bool isDraw)  $default,) {final _that = this;
switch (_that) {
case _BoardState():
return $default(_that.fen,_that.turn,_that.isCheck,_that.isCheckmate,_that.isStalemate,_that.isDraw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fen,  String turn,  bool isCheck,  bool isCheckmate,  bool isStalemate,  bool isDraw)?  $default,) {final _that = this;
switch (_that) {
case _BoardState() when $default != null:
return $default(_that.fen,_that.turn,_that.isCheck,_that.isCheckmate,_that.isStalemate,_that.isDraw);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoardState implements BoardState {
  const _BoardState({required this.fen, required this.turn, this.isCheck = false, this.isCheckmate = false, this.isStalemate = false, this.isDraw = false});
  factory _BoardState.fromJson(Map<String, dynamic> json) => _$BoardStateFromJson(json);

@override final  String fen;
@override final  String turn;
@override@JsonKey() final  bool isCheck;
@override@JsonKey() final  bool isCheckmate;
@override@JsonKey() final  bool isStalemate;
@override@JsonKey() final  bool isDraw;

/// Create a copy of BoardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardStateCopyWith<_BoardState> get copyWith => __$BoardStateCopyWithImpl<_BoardState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardState&&(identical(other.fen, fen) || other.fen == fen)&&(identical(other.turn, turn) || other.turn == turn)&&(identical(other.isCheck, isCheck) || other.isCheck == isCheck)&&(identical(other.isCheckmate, isCheckmate) || other.isCheckmate == isCheckmate)&&(identical(other.isStalemate, isStalemate) || other.isStalemate == isStalemate)&&(identical(other.isDraw, isDraw) || other.isDraw == isDraw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fen,turn,isCheck,isCheckmate,isStalemate,isDraw);

@override
String toString() {
  return 'BoardState(fen: $fen, turn: $turn, isCheck: $isCheck, isCheckmate: $isCheckmate, isStalemate: $isStalemate, isDraw: $isDraw)';
}


}

/// @nodoc
abstract mixin class _$BoardStateCopyWith<$Res> implements $BoardStateCopyWith<$Res> {
  factory _$BoardStateCopyWith(_BoardState value, $Res Function(_BoardState) _then) = __$BoardStateCopyWithImpl;
@override @useResult
$Res call({
 String fen, String turn, bool isCheck, bool isCheckmate, bool isStalemate, bool isDraw
});




}
/// @nodoc
class __$BoardStateCopyWithImpl<$Res>
    implements _$BoardStateCopyWith<$Res> {
  __$BoardStateCopyWithImpl(this._self, this._then);

  final _BoardState _self;
  final $Res Function(_BoardState) _then;

/// Create a copy of BoardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fen = null,Object? turn = null,Object? isCheck = null,Object? isCheckmate = null,Object? isStalemate = null,Object? isDraw = null,}) {
  return _then(_BoardState(
fen: null == fen ? _self.fen : fen // ignore: cast_nullable_to_non_nullable
as String,turn: null == turn ? _self.turn : turn // ignore: cast_nullable_to_non_nullable
as String,isCheck: null == isCheck ? _self.isCheck : isCheck // ignore: cast_nullable_to_non_nullable
as bool,isCheckmate: null == isCheckmate ? _self.isCheckmate : isCheckmate // ignore: cast_nullable_to_non_nullable
as bool,isStalemate: null == isStalemate ? _self.isStalemate : isStalemate // ignore: cast_nullable_to_non_nullable
as bool,isDraw: null == isDraw ? _self.isDraw : isDraw // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
