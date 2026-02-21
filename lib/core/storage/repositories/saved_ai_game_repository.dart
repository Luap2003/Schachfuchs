import 'package:schach_app/core/models/saved_ai_game.dart';

abstract class SavedAiGameRepository {
  Future<int> createNewGame({
    required String ownerUserId,
    required int skillLevel,
  });

  Future<SavedAiGame?> getById({required String ownerUserId, required int id});

  Future<List<SavedAiGame>> listByUser({
    required String ownerUserId,
    int limit = 50,
  });

  Future<void> updateMoves({
    required String ownerUserId,
    required int id,
    required List<String> movesUci,
    required DateTime updatedAt,
  });

  Future<void> deleteById({required String ownerUserId, required int id});
}
