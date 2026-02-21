import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum LessonStepType { explanation, guidedMove, freePlay, multipleChoice, watch }

@freezed
abstract class LessonArrow with _$LessonArrow {
  const factory LessonArrow({
    required String from,
    required String to,
    @Default('green') String color,
  }) = _LessonArrow;

  factory LessonArrow.fromJson(Map<String, dynamic> json) =>
      _$LessonArrowFromJson(json);
}

@freezed
abstract class LessonStep with _$LessonStep {
  const factory LessonStep({
    required String id,
    required LessonStepType type,
    required String fen,
    required String title,
    required String text,
    @Default(<String>[]) List<String> highlightSquares,
    @Default(<LessonArrow>[]) List<LessonArrow> arrows,
    String? expectedMove,
    @Default(<String>[]) List<String> acceptedMoves,
    String? hint,
    @Default(false) bool showLegalMoves,
    String? successText,
    String? failText,
  }) = _LessonStep;

  factory LessonStep.fromJson(Map<String, dynamic> json) =>
      _$LessonStepFromJson(json);
}

@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({
    required String id,
    required String title,
    required String description,
    required int order,
    required String category,
    required String difficulty,
    required int estimatedMinutes,
    @Default('pawn') String icon,
    @Default(<LessonStep>[]) List<LessonStep> steps,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}
