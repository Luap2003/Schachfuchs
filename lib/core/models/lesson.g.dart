// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LessonArrow _$LessonArrowFromJson(Map<String, dynamic> json) => _LessonArrow(
  from: json['from'] as String,
  to: json['to'] as String,
  color: json['color'] as String? ?? 'green',
);

Map<String, dynamic> _$LessonArrowToJson(_LessonArrow instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'color': instance.color,
    };

_LessonStep _$LessonStepFromJson(Map<String, dynamic> json) => _LessonStep(
  id: json['id'] as String,
  type: $enumDecode(_$LessonStepTypeEnumMap, json['type']),
  fen: json['fen'] as String,
  title: json['title'] as String,
  text: json['text'] as String,
  highlightSquares:
      (json['highlightSquares'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  arrows:
      (json['arrows'] as List<dynamic>?)
          ?.map((e) => LessonArrow.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LessonArrow>[],
  expectedMove: json['expectedMove'] as String?,
  acceptedMoves:
      (json['acceptedMoves'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  hint: json['hint'] as String?,
  showLegalMoves: json['showLegalMoves'] as bool? ?? false,
  successText: json['successText'] as String?,
  failText: json['failText'] as String?,
);

Map<String, dynamic> _$LessonStepToJson(_LessonStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$LessonStepTypeEnumMap[instance.type]!,
      'fen': instance.fen,
      'title': instance.title,
      'text': instance.text,
      'highlightSquares': instance.highlightSquares,
      'arrows': instance.arrows,
      'expectedMove': instance.expectedMove,
      'acceptedMoves': instance.acceptedMoves,
      'hint': instance.hint,
      'showLegalMoves': instance.showLegalMoves,
      'successText': instance.successText,
      'failText': instance.failText,
    };

const _$LessonStepTypeEnumMap = {
  LessonStepType.explanation: 'explanation',
  LessonStepType.guidedMove: 'guided_move',
  LessonStepType.freePlay: 'free_play',
  LessonStepType.multipleChoice: 'multiple_choice',
  LessonStepType.watch: 'watch',
};

_Lesson _$LessonFromJson(Map<String, dynamic> json) => _Lesson(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  order: (json['order'] as num).toInt(),
  category: json['category'] as String,
  difficulty: json['difficulty'] as String,
  estimatedMinutes: (json['estimatedMinutes'] as num).toInt(),
  icon: json['icon'] as String? ?? 'pawn',
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map((e) => LessonStep.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LessonStep>[],
);

Map<String, dynamic> _$LessonToJson(_Lesson instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'order': instance.order,
  'category': instance.category,
  'difficulty': instance.difficulty,
  'estimatedMinutes': instance.estimatedMinutes,
  'icon': instance.icon,
  'steps': instance.steps,
};
