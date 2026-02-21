import 'package:schach_app/core/models/game_record.dart';

abstract class GameHistoryRepository {
  Future<void> addRecord(GameRecord record);

  Future<List<GameRecord>> getRecent({required String ownerUserId, int limit});
}
