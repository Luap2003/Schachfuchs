import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:schach_app/core/models/sync_state.dart';

part 'game_record.freezed.dart';
part 'game_record.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum GameOutcome { win, loss, draw }

@freezed
abstract class GameRecord with _$GameRecord {
  const factory GameRecord({
    int? id,
    required String ownerUserId,
    required String pgn,
    required String opponentType,
    String? opponentName,
    required GameOutcome outcome,
    required DateTime playedAt,
    int? durationSeconds,
    int? moveCount,
    required DateTime updatedAt,
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _GameRecord;

  factory GameRecord.fromJson(Map<String, dynamic> json) =>
      _$GameRecordFromJson(json);
}
