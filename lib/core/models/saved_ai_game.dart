import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:schach_app/core/models/sync_state.dart';

part 'saved_ai_game.freezed.dart';
part 'saved_ai_game.g.dart';

@freezed
abstract class SavedAiGame with _$SavedAiGame {
  const factory SavedAiGame({
    int? id,
    required String ownerUserId,
    required int skillLevel,
    @Default(<String>[]) List<String> movesUci,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _SavedAiGame;

  factory SavedAiGame.fromJson(Map<String, dynamic> json) =>
      _$SavedAiGameFromJson(json);
}
