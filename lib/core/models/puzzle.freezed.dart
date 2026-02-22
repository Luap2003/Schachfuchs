// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puzzle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Puzzle {

 String get id; String get fen; List<String> get playerMoves; List<String> get opponentMoves; List<String> get solutionSan; List<String> get themes; int get rating; String? get hint; String? get source; List<String> get alternateWinningMoves;
/// Create a copy of Puzzle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PuzzleCopyWith<Puzzle> get copyWith => _$PuzzleCopyWithImpl<Puzzle>(this as Puzzle, _$identity);

  /// Serializes this Puzzle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Puzzle&&(identical(other.id, id) || other.id == id)&&(identical(other.fen, fen) || other.fen == fen)&&const DeepCollectionEquality().equals(other.playerMoves, playerMoves)&&const DeepCollectionEquality().equals(other.opponentMoves, opponentMoves)&&const DeepCollectionEquality().equals(other.solutionSan, solutionSan)&&const DeepCollectionEquality().equals(other.themes, themes)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.alternateWinningMoves, alternateWinningMoves));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fen,const DeepCollectionEquality().hash(playerMoves),const DeepCollectionEquality().hash(opponentMoves),const DeepCollectionEquality().hash(solutionSan),const DeepCollectionEquality().hash(themes),rating,hint,source,const DeepCollectionEquality().hash(alternateWinningMoves));

@override
String toString() {
  return 'Puzzle(id: $id, fen: $fen, playerMoves: $playerMoves, opponentMoves: $opponentMoves, solutionSan: $solutionSan, themes: $themes, rating: $rating, hint: $hint, source: $source, alternateWinningMoves: $alternateWinningMoves)';
}


}

/// @nodoc
abstract mixin class $PuzzleCopyWith<$Res>  {
  factory $PuzzleCopyWith(Puzzle value, $Res Function(Puzzle) _then) = _$PuzzleCopyWithImpl;
@useResult
$Res call({
 String id, String fen, List<String> playerMoves, List<String> opponentMoves, List<String> solutionSan, List<String> themes, int rating, String? hint, String? source, List<String> alternateWinningMoves
});




}
/// @nodoc
class _$PuzzleCopyWithImpl<$Res>
    implements $PuzzleCopyWith<$Res> {
  _$PuzzleCopyWithImpl(this._self, this._then);

  final Puzzle _self;
  final $Res Function(Puzzle) _then;

/// Create a copy of Puzzle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fen = null,Object? playerMoves = null,Object? opponentMoves = null,Object? solutionSan = null,Object? themes = null,Object? rating = null,Object? hint = freezed,Object? source = freezed,Object? alternateWinningMoves = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fen: null == fen ? _self.fen : fen // ignore: cast_nullable_to_non_nullable
as String,playerMoves: null == playerMoves ? _self.playerMoves : playerMoves // ignore: cast_nullable_to_non_nullable
as List<String>,opponentMoves: null == opponentMoves ? _self.opponentMoves : opponentMoves // ignore: cast_nullable_to_non_nullable
as List<String>,solutionSan: null == solutionSan ? _self.solutionSan : solutionSan // ignore: cast_nullable_to_non_nullable
as List<String>,themes: null == themes ? _self.themes : themes // ignore: cast_nullable_to_non_nullable
as List<String>,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,alternateWinningMoves: null == alternateWinningMoves ? _self.alternateWinningMoves : alternateWinningMoves // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Puzzle].
extension PuzzlePatterns on Puzzle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Puzzle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Puzzle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Puzzle value)  $default,){
final _that = this;
switch (_that) {
case _Puzzle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Puzzle value)?  $default,){
final _that = this;
switch (_that) {
case _Puzzle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fen,  List<String> playerMoves,  List<String> opponentMoves,  List<String> solutionSan,  List<String> themes,  int rating,  String? hint,  String? source,  List<String> alternateWinningMoves)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Puzzle() when $default != null:
return $default(_that.id,_that.fen,_that.playerMoves,_that.opponentMoves,_that.solutionSan,_that.themes,_that.rating,_that.hint,_that.source,_that.alternateWinningMoves);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fen,  List<String> playerMoves,  List<String> opponentMoves,  List<String> solutionSan,  List<String> themes,  int rating,  String? hint,  String? source,  List<String> alternateWinningMoves)  $default,) {final _that = this;
switch (_that) {
case _Puzzle():
return $default(_that.id,_that.fen,_that.playerMoves,_that.opponentMoves,_that.solutionSan,_that.themes,_that.rating,_that.hint,_that.source,_that.alternateWinningMoves);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fen,  List<String> playerMoves,  List<String> opponentMoves,  List<String> solutionSan,  List<String> themes,  int rating,  String? hint,  String? source,  List<String> alternateWinningMoves)?  $default,) {final _that = this;
switch (_that) {
case _Puzzle() when $default != null:
return $default(_that.id,_that.fen,_that.playerMoves,_that.opponentMoves,_that.solutionSan,_that.themes,_that.rating,_that.hint,_that.source,_that.alternateWinningMoves);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Puzzle implements Puzzle {
  const _Puzzle({required this.id, required this.fen, required final  List<String> playerMoves, required final  List<String> opponentMoves, required final  List<String> solutionSan, required final  List<String> themes, required this.rating, this.hint, this.source, final  List<String> alternateWinningMoves = const <String>[]}): _playerMoves = playerMoves,_opponentMoves = opponentMoves,_solutionSan = solutionSan,_themes = themes,_alternateWinningMoves = alternateWinningMoves;
  factory _Puzzle.fromJson(Map<String, dynamic> json) => _$PuzzleFromJson(json);

@override final  String id;
@override final  String fen;
 final  List<String> _playerMoves;
@override List<String> get playerMoves {
  if (_playerMoves is EqualUnmodifiableListView) return _playerMoves;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playerMoves);
}

 final  List<String> _opponentMoves;
@override List<String> get opponentMoves {
  if (_opponentMoves is EqualUnmodifiableListView) return _opponentMoves;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_opponentMoves);
}

 final  List<String> _solutionSan;
@override List<String> get solutionSan {
  if (_solutionSan is EqualUnmodifiableListView) return _solutionSan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_solutionSan);
}

 final  List<String> _themes;
@override List<String> get themes {
  if (_themes is EqualUnmodifiableListView) return _themes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_themes);
}

@override final  int rating;
@override final  String? hint;
@override final  String? source;
 final  List<String> _alternateWinningMoves;
@override@JsonKey() List<String> get alternateWinningMoves {
  if (_alternateWinningMoves is EqualUnmodifiableListView) return _alternateWinningMoves;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alternateWinningMoves);
}


/// Create a copy of Puzzle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PuzzleCopyWith<_Puzzle> get copyWith => __$PuzzleCopyWithImpl<_Puzzle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PuzzleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Puzzle&&(identical(other.id, id) || other.id == id)&&(identical(other.fen, fen) || other.fen == fen)&&const DeepCollectionEquality().equals(other._playerMoves, _playerMoves)&&const DeepCollectionEquality().equals(other._opponentMoves, _opponentMoves)&&const DeepCollectionEquality().equals(other._solutionSan, _solutionSan)&&const DeepCollectionEquality().equals(other._themes, _themes)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other._alternateWinningMoves, _alternateWinningMoves));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fen,const DeepCollectionEquality().hash(_playerMoves),const DeepCollectionEquality().hash(_opponentMoves),const DeepCollectionEquality().hash(_solutionSan),const DeepCollectionEquality().hash(_themes),rating,hint,source,const DeepCollectionEquality().hash(_alternateWinningMoves));

@override
String toString() {
  return 'Puzzle(id: $id, fen: $fen, playerMoves: $playerMoves, opponentMoves: $opponentMoves, solutionSan: $solutionSan, themes: $themes, rating: $rating, hint: $hint, source: $source, alternateWinningMoves: $alternateWinningMoves)';
}


}

/// @nodoc
abstract mixin class _$PuzzleCopyWith<$Res> implements $PuzzleCopyWith<$Res> {
  factory _$PuzzleCopyWith(_Puzzle value, $Res Function(_Puzzle) _then) = __$PuzzleCopyWithImpl;
@override @useResult
$Res call({
 String id, String fen, List<String> playerMoves, List<String> opponentMoves, List<String> solutionSan, List<String> themes, int rating, String? hint, String? source, List<String> alternateWinningMoves
});




}
/// @nodoc
class __$PuzzleCopyWithImpl<$Res>
    implements _$PuzzleCopyWith<$Res> {
  __$PuzzleCopyWithImpl(this._self, this._then);

  final _Puzzle _self;
  final $Res Function(_Puzzle) _then;

/// Create a copy of Puzzle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fen = null,Object? playerMoves = null,Object? opponentMoves = null,Object? solutionSan = null,Object? themes = null,Object? rating = null,Object? hint = freezed,Object? source = freezed,Object? alternateWinningMoves = null,}) {
  return _then(_Puzzle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fen: null == fen ? _self.fen : fen // ignore: cast_nullable_to_non_nullable
as String,playerMoves: null == playerMoves ? _self._playerMoves : playerMoves // ignore: cast_nullable_to_non_nullable
as List<String>,opponentMoves: null == opponentMoves ? _self._opponentMoves : opponentMoves // ignore: cast_nullable_to_non_nullable
as List<String>,solutionSan: null == solutionSan ? _self._solutionSan : solutionSan // ignore: cast_nullable_to_non_nullable
as List<String>,themes: null == themes ? _self._themes : themes // ignore: cast_nullable_to_non_nullable
as List<String>,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,alternateWinningMoves: null == alternateWinningMoves ? _self._alternateWinningMoves : alternateWinningMoves // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$PuzzlePack {

 String get packId; String get title; String get description; String get category; List<String> get tags; int get difficulty; List<Puzzle> get puzzles;
/// Create a copy of PuzzlePack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PuzzlePackCopyWith<PuzzlePack> get copyWith => _$PuzzlePackCopyWithImpl<PuzzlePack>(this as PuzzlePack, _$identity);

  /// Serializes this PuzzlePack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PuzzlePack&&(identical(other.packId, packId) || other.packId == packId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&const DeepCollectionEquality().equals(other.puzzles, puzzles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packId,title,description,category,const DeepCollectionEquality().hash(tags),difficulty,const DeepCollectionEquality().hash(puzzles));

@override
String toString() {
  return 'PuzzlePack(packId: $packId, title: $title, description: $description, category: $category, tags: $tags, difficulty: $difficulty, puzzles: $puzzles)';
}


}

/// @nodoc
abstract mixin class $PuzzlePackCopyWith<$Res>  {
  factory $PuzzlePackCopyWith(PuzzlePack value, $Res Function(PuzzlePack) _then) = _$PuzzlePackCopyWithImpl;
@useResult
$Res call({
 String packId, String title, String description, String category, List<String> tags, int difficulty, List<Puzzle> puzzles
});




}
/// @nodoc
class _$PuzzlePackCopyWithImpl<$Res>
    implements $PuzzlePackCopyWith<$Res> {
  _$PuzzlePackCopyWithImpl(this._self, this._then);

  final PuzzlePack _self;
  final $Res Function(PuzzlePack) _then;

/// Create a copy of PuzzlePack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packId = null,Object? title = null,Object? description = null,Object? category = null,Object? tags = null,Object? difficulty = null,Object? puzzles = null,}) {
  return _then(_self.copyWith(
packId: null == packId ? _self.packId : packId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int,puzzles: null == puzzles ? _self.puzzles : puzzles // ignore: cast_nullable_to_non_nullable
as List<Puzzle>,
  ));
}

}


/// Adds pattern-matching-related methods to [PuzzlePack].
extension PuzzlePackPatterns on PuzzlePack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PuzzlePack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PuzzlePack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PuzzlePack value)  $default,){
final _that = this;
switch (_that) {
case _PuzzlePack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PuzzlePack value)?  $default,){
final _that = this;
switch (_that) {
case _PuzzlePack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packId,  String title,  String description,  String category,  List<String> tags,  int difficulty,  List<Puzzle> puzzles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PuzzlePack() when $default != null:
return $default(_that.packId,_that.title,_that.description,_that.category,_that.tags,_that.difficulty,_that.puzzles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packId,  String title,  String description,  String category,  List<String> tags,  int difficulty,  List<Puzzle> puzzles)  $default,) {final _that = this;
switch (_that) {
case _PuzzlePack():
return $default(_that.packId,_that.title,_that.description,_that.category,_that.tags,_that.difficulty,_that.puzzles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packId,  String title,  String description,  String category,  List<String> tags,  int difficulty,  List<Puzzle> puzzles)?  $default,) {final _that = this;
switch (_that) {
case _PuzzlePack() when $default != null:
return $default(_that.packId,_that.title,_that.description,_that.category,_that.tags,_that.difficulty,_that.puzzles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PuzzlePack implements PuzzlePack {
  const _PuzzlePack({required this.packId, required this.title, required this.description, required this.category, final  List<String> tags = const <String>[], this.difficulty = 1, final  List<Puzzle> puzzles = const <Puzzle>[]}): _tags = tags,_puzzles = puzzles;
  factory _PuzzlePack.fromJson(Map<String, dynamic> json) => _$PuzzlePackFromJson(json);

@override final  String packId;
@override final  String title;
@override final  String description;
@override final  String category;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  int difficulty;
 final  List<Puzzle> _puzzles;
@override@JsonKey() List<Puzzle> get puzzles {
  if (_puzzles is EqualUnmodifiableListView) return _puzzles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_puzzles);
}


/// Create a copy of PuzzlePack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PuzzlePackCopyWith<_PuzzlePack> get copyWith => __$PuzzlePackCopyWithImpl<_PuzzlePack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PuzzlePackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PuzzlePack&&(identical(other.packId, packId) || other.packId == packId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&const DeepCollectionEquality().equals(other._puzzles, _puzzles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packId,title,description,category,const DeepCollectionEquality().hash(_tags),difficulty,const DeepCollectionEquality().hash(_puzzles));

@override
String toString() {
  return 'PuzzlePack(packId: $packId, title: $title, description: $description, category: $category, tags: $tags, difficulty: $difficulty, puzzles: $puzzles)';
}


}

/// @nodoc
abstract mixin class _$PuzzlePackCopyWith<$Res> implements $PuzzlePackCopyWith<$Res> {
  factory _$PuzzlePackCopyWith(_PuzzlePack value, $Res Function(_PuzzlePack) _then) = __$PuzzlePackCopyWithImpl;
@override @useResult
$Res call({
 String packId, String title, String description, String category, List<String> tags, int difficulty, List<Puzzle> puzzles
});




}
/// @nodoc
class __$PuzzlePackCopyWithImpl<$Res>
    implements _$PuzzlePackCopyWith<$Res> {
  __$PuzzlePackCopyWithImpl(this._self, this._then);

  final _PuzzlePack _self;
  final $Res Function(_PuzzlePack) _then;

/// Create a copy of PuzzlePack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packId = null,Object? title = null,Object? description = null,Object? category = null,Object? tags = null,Object? difficulty = null,Object? puzzles = null,}) {
  return _then(_PuzzlePack(
packId: null == packId ? _self.packId : packId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int,puzzles: null == puzzles ? _self._puzzles : puzzles // ignore: cast_nullable_to_non_nullable
as List<Puzzle>,
  ));
}


}

// dart format on
