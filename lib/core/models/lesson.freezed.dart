// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LessonArrow {

 String get from; String get to; String get color;
/// Create a copy of LessonArrow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonArrowCopyWith<LessonArrow> get copyWith => _$LessonArrowCopyWithImpl<LessonArrow>(this as LessonArrow, _$identity);

  /// Serializes this LessonArrow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonArrow&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,color);

@override
String toString() {
  return 'LessonArrow(from: $from, to: $to, color: $color)';
}


}

/// @nodoc
abstract mixin class $LessonArrowCopyWith<$Res>  {
  factory $LessonArrowCopyWith(LessonArrow value, $Res Function(LessonArrow) _then) = _$LessonArrowCopyWithImpl;
@useResult
$Res call({
 String from, String to, String color
});




}
/// @nodoc
class _$LessonArrowCopyWithImpl<$Res>
    implements $LessonArrowCopyWith<$Res> {
  _$LessonArrowCopyWithImpl(this._self, this._then);

  final LessonArrow _self;
  final $Res Function(LessonArrow) _then;

/// Create a copy of LessonArrow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,Object? color = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonArrow].
extension LessonArrowPatterns on LessonArrow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonArrow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonArrow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonArrow value)  $default,){
final _that = this;
switch (_that) {
case _LessonArrow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonArrow value)?  $default,){
final _that = this;
switch (_that) {
case _LessonArrow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String from,  String to,  String color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonArrow() when $default != null:
return $default(_that.from,_that.to,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String from,  String to,  String color)  $default,) {final _that = this;
switch (_that) {
case _LessonArrow():
return $default(_that.from,_that.to,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String from,  String to,  String color)?  $default,) {final _that = this;
switch (_that) {
case _LessonArrow() when $default != null:
return $default(_that.from,_that.to,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LessonArrow implements LessonArrow {
  const _LessonArrow({required this.from, required this.to, this.color = 'green'});
  factory _LessonArrow.fromJson(Map<String, dynamic> json) => _$LessonArrowFromJson(json);

@override final  String from;
@override final  String to;
@override@JsonKey() final  String color;

/// Create a copy of LessonArrow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonArrowCopyWith<_LessonArrow> get copyWith => __$LessonArrowCopyWithImpl<_LessonArrow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LessonArrowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonArrow&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,color);

@override
String toString() {
  return 'LessonArrow(from: $from, to: $to, color: $color)';
}


}

/// @nodoc
abstract mixin class _$LessonArrowCopyWith<$Res> implements $LessonArrowCopyWith<$Res> {
  factory _$LessonArrowCopyWith(_LessonArrow value, $Res Function(_LessonArrow) _then) = __$LessonArrowCopyWithImpl;
@override @useResult
$Res call({
 String from, String to, String color
});




}
/// @nodoc
class __$LessonArrowCopyWithImpl<$Res>
    implements _$LessonArrowCopyWith<$Res> {
  __$LessonArrowCopyWithImpl(this._self, this._then);

  final _LessonArrow _self;
  final $Res Function(_LessonArrow) _then;

/// Create a copy of LessonArrow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? color = null,}) {
  return _then(_LessonArrow(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LessonStep {

 String get id; LessonStepType get type; String get fen; String get title; String get text; List<String> get highlightSquares; List<LessonArrow> get arrows; String? get expectedMove; List<String> get acceptedMoves; String? get hint; bool get showLegalMoves; String? get successText; String? get failText;
/// Create a copy of LessonStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonStepCopyWith<LessonStep> get copyWith => _$LessonStepCopyWithImpl<LessonStep>(this as LessonStep, _$identity);

  /// Serializes this LessonStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonStep&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.fen, fen) || other.fen == fen)&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.highlightSquares, highlightSquares)&&const DeepCollectionEquality().equals(other.arrows, arrows)&&(identical(other.expectedMove, expectedMove) || other.expectedMove == expectedMove)&&const DeepCollectionEquality().equals(other.acceptedMoves, acceptedMoves)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.showLegalMoves, showLegalMoves) || other.showLegalMoves == showLegalMoves)&&(identical(other.successText, successText) || other.successText == successText)&&(identical(other.failText, failText) || other.failText == failText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,fen,title,text,const DeepCollectionEquality().hash(highlightSquares),const DeepCollectionEquality().hash(arrows),expectedMove,const DeepCollectionEquality().hash(acceptedMoves),hint,showLegalMoves,successText,failText);

@override
String toString() {
  return 'LessonStep(id: $id, type: $type, fen: $fen, title: $title, text: $text, highlightSquares: $highlightSquares, arrows: $arrows, expectedMove: $expectedMove, acceptedMoves: $acceptedMoves, hint: $hint, showLegalMoves: $showLegalMoves, successText: $successText, failText: $failText)';
}


}

/// @nodoc
abstract mixin class $LessonStepCopyWith<$Res>  {
  factory $LessonStepCopyWith(LessonStep value, $Res Function(LessonStep) _then) = _$LessonStepCopyWithImpl;
@useResult
$Res call({
 String id, LessonStepType type, String fen, String title, String text, List<String> highlightSquares, List<LessonArrow> arrows, String? expectedMove, List<String> acceptedMoves, String? hint, bool showLegalMoves, String? successText, String? failText
});




}
/// @nodoc
class _$LessonStepCopyWithImpl<$Res>
    implements $LessonStepCopyWith<$Res> {
  _$LessonStepCopyWithImpl(this._self, this._then);

  final LessonStep _self;
  final $Res Function(LessonStep) _then;

/// Create a copy of LessonStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? fen = null,Object? title = null,Object? text = null,Object? highlightSquares = null,Object? arrows = null,Object? expectedMove = freezed,Object? acceptedMoves = null,Object? hint = freezed,Object? showLegalMoves = null,Object? successText = freezed,Object? failText = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LessonStepType,fen: null == fen ? _self.fen : fen // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,highlightSquares: null == highlightSquares ? _self.highlightSquares : highlightSquares // ignore: cast_nullable_to_non_nullable
as List<String>,arrows: null == arrows ? _self.arrows : arrows // ignore: cast_nullable_to_non_nullable
as List<LessonArrow>,expectedMove: freezed == expectedMove ? _self.expectedMove : expectedMove // ignore: cast_nullable_to_non_nullable
as String?,acceptedMoves: null == acceptedMoves ? _self.acceptedMoves : acceptedMoves // ignore: cast_nullable_to_non_nullable
as List<String>,hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,showLegalMoves: null == showLegalMoves ? _self.showLegalMoves : showLegalMoves // ignore: cast_nullable_to_non_nullable
as bool,successText: freezed == successText ? _self.successText : successText // ignore: cast_nullable_to_non_nullable
as String?,failText: freezed == failText ? _self.failText : failText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonStep].
extension LessonStepPatterns on LessonStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonStep value)  $default,){
final _that = this;
switch (_that) {
case _LessonStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonStep value)?  $default,){
final _that = this;
switch (_that) {
case _LessonStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LessonStepType type,  String fen,  String title,  String text,  List<String> highlightSquares,  List<LessonArrow> arrows,  String? expectedMove,  List<String> acceptedMoves,  String? hint,  bool showLegalMoves,  String? successText,  String? failText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonStep() when $default != null:
return $default(_that.id,_that.type,_that.fen,_that.title,_that.text,_that.highlightSquares,_that.arrows,_that.expectedMove,_that.acceptedMoves,_that.hint,_that.showLegalMoves,_that.successText,_that.failText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LessonStepType type,  String fen,  String title,  String text,  List<String> highlightSquares,  List<LessonArrow> arrows,  String? expectedMove,  List<String> acceptedMoves,  String? hint,  bool showLegalMoves,  String? successText,  String? failText)  $default,) {final _that = this;
switch (_that) {
case _LessonStep():
return $default(_that.id,_that.type,_that.fen,_that.title,_that.text,_that.highlightSquares,_that.arrows,_that.expectedMove,_that.acceptedMoves,_that.hint,_that.showLegalMoves,_that.successText,_that.failText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LessonStepType type,  String fen,  String title,  String text,  List<String> highlightSquares,  List<LessonArrow> arrows,  String? expectedMove,  List<String> acceptedMoves,  String? hint,  bool showLegalMoves,  String? successText,  String? failText)?  $default,) {final _that = this;
switch (_that) {
case _LessonStep() when $default != null:
return $default(_that.id,_that.type,_that.fen,_that.title,_that.text,_that.highlightSquares,_that.arrows,_that.expectedMove,_that.acceptedMoves,_that.hint,_that.showLegalMoves,_that.successText,_that.failText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LessonStep implements LessonStep {
  const _LessonStep({required this.id, required this.type, required this.fen, required this.title, required this.text, final  List<String> highlightSquares = const <String>[], final  List<LessonArrow> arrows = const <LessonArrow>[], this.expectedMove, final  List<String> acceptedMoves = const <String>[], this.hint, this.showLegalMoves = false, this.successText, this.failText}): _highlightSquares = highlightSquares,_arrows = arrows,_acceptedMoves = acceptedMoves;
  factory _LessonStep.fromJson(Map<String, dynamic> json) => _$LessonStepFromJson(json);

@override final  String id;
@override final  LessonStepType type;
@override final  String fen;
@override final  String title;
@override final  String text;
 final  List<String> _highlightSquares;
@override@JsonKey() List<String> get highlightSquares {
  if (_highlightSquares is EqualUnmodifiableListView) return _highlightSquares;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlightSquares);
}

 final  List<LessonArrow> _arrows;
@override@JsonKey() List<LessonArrow> get arrows {
  if (_arrows is EqualUnmodifiableListView) return _arrows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_arrows);
}

@override final  String? expectedMove;
 final  List<String> _acceptedMoves;
@override@JsonKey() List<String> get acceptedMoves {
  if (_acceptedMoves is EqualUnmodifiableListView) return _acceptedMoves;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_acceptedMoves);
}

@override final  String? hint;
@override@JsonKey() final  bool showLegalMoves;
@override final  String? successText;
@override final  String? failText;

/// Create a copy of LessonStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonStepCopyWith<_LessonStep> get copyWith => __$LessonStepCopyWithImpl<_LessonStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LessonStepToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonStep&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.fen, fen) || other.fen == fen)&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._highlightSquares, _highlightSquares)&&const DeepCollectionEquality().equals(other._arrows, _arrows)&&(identical(other.expectedMove, expectedMove) || other.expectedMove == expectedMove)&&const DeepCollectionEquality().equals(other._acceptedMoves, _acceptedMoves)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.showLegalMoves, showLegalMoves) || other.showLegalMoves == showLegalMoves)&&(identical(other.successText, successText) || other.successText == successText)&&(identical(other.failText, failText) || other.failText == failText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,fen,title,text,const DeepCollectionEquality().hash(_highlightSquares),const DeepCollectionEquality().hash(_arrows),expectedMove,const DeepCollectionEquality().hash(_acceptedMoves),hint,showLegalMoves,successText,failText);

@override
String toString() {
  return 'LessonStep(id: $id, type: $type, fen: $fen, title: $title, text: $text, highlightSquares: $highlightSquares, arrows: $arrows, expectedMove: $expectedMove, acceptedMoves: $acceptedMoves, hint: $hint, showLegalMoves: $showLegalMoves, successText: $successText, failText: $failText)';
}


}

/// @nodoc
abstract mixin class _$LessonStepCopyWith<$Res> implements $LessonStepCopyWith<$Res> {
  factory _$LessonStepCopyWith(_LessonStep value, $Res Function(_LessonStep) _then) = __$LessonStepCopyWithImpl;
@override @useResult
$Res call({
 String id, LessonStepType type, String fen, String title, String text, List<String> highlightSquares, List<LessonArrow> arrows, String? expectedMove, List<String> acceptedMoves, String? hint, bool showLegalMoves, String? successText, String? failText
});




}
/// @nodoc
class __$LessonStepCopyWithImpl<$Res>
    implements _$LessonStepCopyWith<$Res> {
  __$LessonStepCopyWithImpl(this._self, this._then);

  final _LessonStep _self;
  final $Res Function(_LessonStep) _then;

/// Create a copy of LessonStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? fen = null,Object? title = null,Object? text = null,Object? highlightSquares = null,Object? arrows = null,Object? expectedMove = freezed,Object? acceptedMoves = null,Object? hint = freezed,Object? showLegalMoves = null,Object? successText = freezed,Object? failText = freezed,}) {
  return _then(_LessonStep(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LessonStepType,fen: null == fen ? _self.fen : fen // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,highlightSquares: null == highlightSquares ? _self._highlightSquares : highlightSquares // ignore: cast_nullable_to_non_nullable
as List<String>,arrows: null == arrows ? _self._arrows : arrows // ignore: cast_nullable_to_non_nullable
as List<LessonArrow>,expectedMove: freezed == expectedMove ? _self.expectedMove : expectedMove // ignore: cast_nullable_to_non_nullable
as String?,acceptedMoves: null == acceptedMoves ? _self._acceptedMoves : acceptedMoves // ignore: cast_nullable_to_non_nullable
as List<String>,hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,showLegalMoves: null == showLegalMoves ? _self.showLegalMoves : showLegalMoves // ignore: cast_nullable_to_non_nullable
as bool,successText: freezed == successText ? _self.successText : successText // ignore: cast_nullable_to_non_nullable
as String?,failText: freezed == failText ? _self.failText : failText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Lesson {

 String get id; String get title; String get description; int get order; String get category; String get difficulty; int get estimatedMinutes; String get icon; List<LessonStep> get steps;
/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonCopyWith<Lesson> get copyWith => _$LessonCopyWithImpl<Lesson>(this as Lesson, _$identity);

  /// Serializes this Lesson to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lesson&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.order, order) || other.order == order)&&(identical(other.category, category) || other.category == category)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&(identical(other.icon, icon) || other.icon == icon)&&const DeepCollectionEquality().equals(other.steps, steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,order,category,difficulty,estimatedMinutes,icon,const DeepCollectionEquality().hash(steps));

@override
String toString() {
  return 'Lesson(id: $id, title: $title, description: $description, order: $order, category: $category, difficulty: $difficulty, estimatedMinutes: $estimatedMinutes, icon: $icon, steps: $steps)';
}


}

/// @nodoc
abstract mixin class $LessonCopyWith<$Res>  {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) _then) = _$LessonCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, int order, String category, String difficulty, int estimatedMinutes, String icon, List<LessonStep> steps
});




}
/// @nodoc
class _$LessonCopyWithImpl<$Res>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._self, this._then);

  final Lesson _self;
  final $Res Function(Lesson) _then;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? order = null,Object? category = null,Object? difficulty = null,Object? estimatedMinutes = null,Object? icon = null,Object? steps = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<LessonStep>,
  ));
}

}


/// Adds pattern-matching-related methods to [Lesson].
extension LessonPatterns on Lesson {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lesson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lesson() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lesson value)  $default,){
final _that = this;
switch (_that) {
case _Lesson():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lesson value)?  $default,){
final _that = this;
switch (_that) {
case _Lesson() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  int order,  String category,  String difficulty,  int estimatedMinutes,  String icon,  List<LessonStep> steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lesson() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.order,_that.category,_that.difficulty,_that.estimatedMinutes,_that.icon,_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  int order,  String category,  String difficulty,  int estimatedMinutes,  String icon,  List<LessonStep> steps)  $default,) {final _that = this;
switch (_that) {
case _Lesson():
return $default(_that.id,_that.title,_that.description,_that.order,_that.category,_that.difficulty,_that.estimatedMinutes,_that.icon,_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  int order,  String category,  String difficulty,  int estimatedMinutes,  String icon,  List<LessonStep> steps)?  $default,) {final _that = this;
switch (_that) {
case _Lesson() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.order,_that.category,_that.difficulty,_that.estimatedMinutes,_that.icon,_that.steps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lesson implements Lesson {
  const _Lesson({required this.id, required this.title, required this.description, required this.order, required this.category, required this.difficulty, required this.estimatedMinutes, this.icon = 'pawn', final  List<LessonStep> steps = const <LessonStep>[]}): _steps = steps;
  factory _Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  int order;
@override final  String category;
@override final  String difficulty;
@override final  int estimatedMinutes;
@override@JsonKey() final  String icon;
 final  List<LessonStep> _steps;
@override@JsonKey() List<LessonStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonCopyWith<_Lesson> get copyWith => __$LessonCopyWithImpl<_Lesson>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LessonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lesson&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.order, order) || other.order == order)&&(identical(other.category, category) || other.category == category)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&(identical(other.icon, icon) || other.icon == icon)&&const DeepCollectionEquality().equals(other._steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,order,category,difficulty,estimatedMinutes,icon,const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'Lesson(id: $id, title: $title, description: $description, order: $order, category: $category, difficulty: $difficulty, estimatedMinutes: $estimatedMinutes, icon: $icon, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$LessonCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$LessonCopyWith(_Lesson value, $Res Function(_Lesson) _then) = __$LessonCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, int order, String category, String difficulty, int estimatedMinutes, String icon, List<LessonStep> steps
});




}
/// @nodoc
class __$LessonCopyWithImpl<$Res>
    implements _$LessonCopyWith<$Res> {
  __$LessonCopyWithImpl(this._self, this._then);

  final _Lesson _self;
  final $Res Function(_Lesson) _then;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? order = null,Object? category = null,Object? difficulty = null,Object? estimatedMinutes = null,Object? icon = null,Object? steps = null,}) {
  return _then(_Lesson(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<LessonStep>,
  ));
}


}

// dart format on
