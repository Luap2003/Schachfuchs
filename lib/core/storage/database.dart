import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:schach_app/config/constants.dart';

part 'database.g.dart';

class Users extends Table {
  TextColumn get localUserId => text()();

  TextColumn get remoteUserId => text().nullable()();

  TextColumn get authProvider => text().nullable()();

  TextColumn get name => text().withDefault(const Constant('Spieler'))();

  TextColumn get avatarId => text().withDefault(const Constant('default'))();

  IntColumn get totalXp => integer().withDefault(const Constant(0))();

  IntColumn get currentRating => integer().withDefault(const Constant(400))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{localUserId};
}

class LessonProgresses extends Table {
  TextColumn get ownerUserId => text().references(Users, #localUserId)();

  TextColumn get lessonId => text()();

  IntColumn get currentStepIndex => integer().withDefault(const Constant(0))();

  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();

  IntColumn get starsEarned => integer().withDefault(const Constant(0))();

  DateTimeColumn get completedAt => dateTime().nullable()();

  IntColumn get attempts => integer().withDefault(const Constant(0))();

  DateTimeColumn get updatedAt => dateTime()();

  TextColumn get syncState =>
      text().withDefault(const Constant('local_only'))();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{ownerUserId, lessonId};
}

class PuzzleProgresses extends Table {
  TextColumn get ownerUserId => text().references(Users, #localUserId)();

  TextColumn get puzzleId => text()();

  TextColumn get packId => text()();

  BoolColumn get isSolved => boolean().withDefault(const Constant(false))();

  IntColumn get bestTimeMs => integer().nullable()();

  IntColumn get hintsUsed => integer().withDefault(const Constant(0))();

  IntColumn get attempts => integer().withDefault(const Constant(0))();

  DateTimeColumn get solvedAt => dateTime().nullable()();

  DateTimeColumn get updatedAt => dateTime()();

  TextColumn get syncState =>
      text().withDefault(const Constant('local_only'))();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{ownerUserId, puzzleId};
}

class GameHistories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get ownerUserId => text().references(Users, #localUserId)();

  TextColumn get pgn => text()();

  TextColumn get opponentType => text()();

  TextColumn get opponentName => text().nullable()();

  TextColumn get result => text()();

  DateTimeColumn get playedAt => dateTime().withDefault(currentDateAndTime)();

  IntColumn get durationSeconds => integer().nullable()();

  IntColumn get moveCount => integer().nullable()();

  DateTimeColumn get updatedAt => dateTime()();

  TextColumn get syncState =>
      text().withDefault(const Constant('local_only'))();
}

class Achievements extends Table {
  TextColumn get id => text()();

  TextColumn get ownerUserId => text().references(Users, #localUserId)();

  DateTimeColumn get unlockedAt => dateTime().nullable()();

  IntColumn get progress => integer().withDefault(const Constant(0))();

  IntColumn get target => integer()();

  DateTimeColumn get updatedAt => dateTime()();

  TextColumn get syncState =>
      text().withDefault(const Constant('local_only'))();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id, ownerUserId};
}

class ContentVersions extends Table {
  TextColumn get contentId => text()();

  TextColumn get contentType => text()();

  IntColumn get version => integer()();

  DateTimeColumn get installedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{contentId};
}

@DriftDatabase(
  tables: <Type>[
    Users,
    LessonProgresses,
    PuzzleProgresses,
    GameHistories,
    Achievements,
    ContentVersions,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator migrator) async {
      await migrator.createAll();
    },
  );
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, AppConstants.appDbName));
    return NativeDatabase.createInBackground(file);
  });
}
