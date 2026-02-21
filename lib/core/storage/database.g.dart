// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localUserIdMeta = const VerificationMeta(
    'localUserId',
  );
  @override
  late final GeneratedColumn<String> localUserId = GeneratedColumn<String>(
    'local_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteUserIdMeta = const VerificationMeta(
    'remoteUserId',
  );
  @override
  late final GeneratedColumn<String> remoteUserId = GeneratedColumn<String>(
    'remote_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authProviderMeta = const VerificationMeta(
    'authProvider',
  );
  @override
  late final GeneratedColumn<String> authProvider = GeneratedColumn<String>(
    'auth_provider',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Spieler'),
  );
  static const VerificationMeta _avatarIdMeta = const VerificationMeta(
    'avatarId',
  );
  @override
  late final GeneratedColumn<String> avatarId = GeneratedColumn<String>(
    'avatar_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('default'),
  );
  static const VerificationMeta _totalXpMeta = const VerificationMeta(
    'totalXp',
  );
  @override
  late final GeneratedColumn<int> totalXp = GeneratedColumn<int>(
    'total_xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currentRatingMeta = const VerificationMeta(
    'currentRating',
  );
  @override
  late final GeneratedColumn<int> currentRating = GeneratedColumn<int>(
    'current_rating',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(400),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localUserId,
    remoteUserId,
    authProvider,
    name,
    avatarId,
    totalXp,
    currentRating,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_user_id')) {
      context.handle(
        _localUserIdMeta,
        localUserId.isAcceptableOrUnknown(
          data['local_user_id']!,
          _localUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localUserIdMeta);
    }
    if (data.containsKey('remote_user_id')) {
      context.handle(
        _remoteUserIdMeta,
        remoteUserId.isAcceptableOrUnknown(
          data['remote_user_id']!,
          _remoteUserIdMeta,
        ),
      );
    }
    if (data.containsKey('auth_provider')) {
      context.handle(
        _authProviderMeta,
        authProvider.isAcceptableOrUnknown(
          data['auth_provider']!,
          _authProviderMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('avatar_id')) {
      context.handle(
        _avatarIdMeta,
        avatarId.isAcceptableOrUnknown(data['avatar_id']!, _avatarIdMeta),
      );
    }
    if (data.containsKey('total_xp')) {
      context.handle(
        _totalXpMeta,
        totalXp.isAcceptableOrUnknown(data['total_xp']!, _totalXpMeta),
      );
    }
    if (data.containsKey('current_rating')) {
      context.handle(
        _currentRatingMeta,
        currentRating.isAcceptableOrUnknown(
          data['current_rating']!,
          _currentRatingMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localUserId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      localUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_user_id'],
      )!,
      remoteUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_user_id'],
      ),
      authProvider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}auth_provider'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      avatarId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_id'],
      )!,
      totalXp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_xp'],
      )!,
      currentRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_rating'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String localUserId;
  final String? remoteUserId;
  final String? authProvider;
  final String name;
  final String avatarId;
  final int totalXp;
  final int currentRating;
  final DateTime createdAt;
  final DateTime updatedAt;
  const User({
    required this.localUserId,
    this.remoteUserId,
    this.authProvider,
    required this.name,
    required this.avatarId,
    required this.totalXp,
    required this.currentRating,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_user_id'] = Variable<String>(localUserId);
    if (!nullToAbsent || remoteUserId != null) {
      map['remote_user_id'] = Variable<String>(remoteUserId);
    }
    if (!nullToAbsent || authProvider != null) {
      map['auth_provider'] = Variable<String>(authProvider);
    }
    map['name'] = Variable<String>(name);
    map['avatar_id'] = Variable<String>(avatarId);
    map['total_xp'] = Variable<int>(totalXp);
    map['current_rating'] = Variable<int>(currentRating);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      localUserId: Value(localUserId),
      remoteUserId: remoteUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteUserId),
      authProvider: authProvider == null && nullToAbsent
          ? const Value.absent()
          : Value(authProvider),
      name: Value(name),
      avatarId: Value(avatarId),
      totalXp: Value(totalXp),
      currentRating: Value(currentRating),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      localUserId: serializer.fromJson<String>(json['localUserId']),
      remoteUserId: serializer.fromJson<String?>(json['remoteUserId']),
      authProvider: serializer.fromJson<String?>(json['authProvider']),
      name: serializer.fromJson<String>(json['name']),
      avatarId: serializer.fromJson<String>(json['avatarId']),
      totalXp: serializer.fromJson<int>(json['totalXp']),
      currentRating: serializer.fromJson<int>(json['currentRating']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localUserId': serializer.toJson<String>(localUserId),
      'remoteUserId': serializer.toJson<String?>(remoteUserId),
      'authProvider': serializer.toJson<String?>(authProvider),
      'name': serializer.toJson<String>(name),
      'avatarId': serializer.toJson<String>(avatarId),
      'totalXp': serializer.toJson<int>(totalXp),
      'currentRating': serializer.toJson<int>(currentRating),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  User copyWith({
    String? localUserId,
    Value<String?> remoteUserId = const Value.absent(),
    Value<String?> authProvider = const Value.absent(),
    String? name,
    String? avatarId,
    int? totalXp,
    int? currentRating,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => User(
    localUserId: localUserId ?? this.localUserId,
    remoteUserId: remoteUserId.present ? remoteUserId.value : this.remoteUserId,
    authProvider: authProvider.present ? authProvider.value : this.authProvider,
    name: name ?? this.name,
    avatarId: avatarId ?? this.avatarId,
    totalXp: totalXp ?? this.totalXp,
    currentRating: currentRating ?? this.currentRating,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      localUserId: data.localUserId.present
          ? data.localUserId.value
          : this.localUserId,
      remoteUserId: data.remoteUserId.present
          ? data.remoteUserId.value
          : this.remoteUserId,
      authProvider: data.authProvider.present
          ? data.authProvider.value
          : this.authProvider,
      name: data.name.present ? data.name.value : this.name,
      avatarId: data.avatarId.present ? data.avatarId.value : this.avatarId,
      totalXp: data.totalXp.present ? data.totalXp.value : this.totalXp,
      currentRating: data.currentRating.present
          ? data.currentRating.value
          : this.currentRating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('localUserId: $localUserId, ')
          ..write('remoteUserId: $remoteUserId, ')
          ..write('authProvider: $authProvider, ')
          ..write('name: $name, ')
          ..write('avatarId: $avatarId, ')
          ..write('totalXp: $totalXp, ')
          ..write('currentRating: $currentRating, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localUserId,
    remoteUserId,
    authProvider,
    name,
    avatarId,
    totalXp,
    currentRating,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.localUserId == this.localUserId &&
          other.remoteUserId == this.remoteUserId &&
          other.authProvider == this.authProvider &&
          other.name == this.name &&
          other.avatarId == this.avatarId &&
          other.totalXp == this.totalXp &&
          other.currentRating == this.currentRating &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> localUserId;
  final Value<String?> remoteUserId;
  final Value<String?> authProvider;
  final Value<String> name;
  final Value<String> avatarId;
  final Value<int> totalXp;
  final Value<int> currentRating;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.localUserId = const Value.absent(),
    this.remoteUserId = const Value.absent(),
    this.authProvider = const Value.absent(),
    this.name = const Value.absent(),
    this.avatarId = const Value.absent(),
    this.totalXp = const Value.absent(),
    this.currentRating = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String localUserId,
    this.remoteUserId = const Value.absent(),
    this.authProvider = const Value.absent(),
    this.name = const Value.absent(),
    this.avatarId = const Value.absent(),
    this.totalXp = const Value.absent(),
    this.currentRating = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : localUserId = Value(localUserId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<User> custom({
    Expression<String>? localUserId,
    Expression<String>? remoteUserId,
    Expression<String>? authProvider,
    Expression<String>? name,
    Expression<String>? avatarId,
    Expression<int>? totalXp,
    Expression<int>? currentRating,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localUserId != null) 'local_user_id': localUserId,
      if (remoteUserId != null) 'remote_user_id': remoteUserId,
      if (authProvider != null) 'auth_provider': authProvider,
      if (name != null) 'name': name,
      if (avatarId != null) 'avatar_id': avatarId,
      if (totalXp != null) 'total_xp': totalXp,
      if (currentRating != null) 'current_rating': currentRating,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? localUserId,
    Value<String?>? remoteUserId,
    Value<String?>? authProvider,
    Value<String>? name,
    Value<String>? avatarId,
    Value<int>? totalXp,
    Value<int>? currentRating,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      localUserId: localUserId ?? this.localUserId,
      remoteUserId: remoteUserId ?? this.remoteUserId,
      authProvider: authProvider ?? this.authProvider,
      name: name ?? this.name,
      avatarId: avatarId ?? this.avatarId,
      totalXp: totalXp ?? this.totalXp,
      currentRating: currentRating ?? this.currentRating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localUserId.present) {
      map['local_user_id'] = Variable<String>(localUserId.value);
    }
    if (remoteUserId.present) {
      map['remote_user_id'] = Variable<String>(remoteUserId.value);
    }
    if (authProvider.present) {
      map['auth_provider'] = Variable<String>(authProvider.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (avatarId.present) {
      map['avatar_id'] = Variable<String>(avatarId.value);
    }
    if (totalXp.present) {
      map['total_xp'] = Variable<int>(totalXp.value);
    }
    if (currentRating.present) {
      map['current_rating'] = Variable<int>(currentRating.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('localUserId: $localUserId, ')
          ..write('remoteUserId: $remoteUserId, ')
          ..write('authProvider: $authProvider, ')
          ..write('name: $name, ')
          ..write('avatarId: $avatarId, ')
          ..write('totalXp: $totalXp, ')
          ..write('currentRating: $currentRating, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LessonProgressesTable extends LessonProgresses
    with TableInfo<$LessonProgressesTable, LessonProgressesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonProgressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (local_user_id)',
    ),
  );
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<String> lessonId = GeneratedColumn<String>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentStepIndexMeta = const VerificationMeta(
    'currentStepIndex',
  );
  @override
  late final GeneratedColumn<int> currentStepIndex = GeneratedColumn<int>(
    'current_step_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _starsEarnedMeta = const VerificationMeta(
    'starsEarned',
  );
  @override
  late final GeneratedColumn<int> starsEarned = GeneratedColumn<int>(
    'stars_earned',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local_only'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    ownerUserId,
    lessonId,
    currentStepIndex,
    isCompleted,
    starsEarned,
    completedAt,
    attempts,
    updatedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lesson_progresses';
  @override
  VerificationContext validateIntegrity(
    Insertable<LessonProgressesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('current_step_index')) {
      context.handle(
        _currentStepIndexMeta,
        currentStepIndex.isAcceptableOrUnknown(
          data['current_step_index']!,
          _currentStepIndexMeta,
        ),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('stars_earned')) {
      context.handle(
        _starsEarnedMeta,
        starsEarned.isAcceptableOrUnknown(
          data['stars_earned']!,
          _starsEarnedMeta,
        ),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ownerUserId, lessonId};
  @override
  LessonProgressesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LessonProgressesData(
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson_id'],
      )!,
      currentStepIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_step_index'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      starsEarned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stars_earned'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      )!,
    );
  }

  @override
  $LessonProgressesTable createAlias(String alias) {
    return $LessonProgressesTable(attachedDatabase, alias);
  }
}

class LessonProgressesData extends DataClass
    implements Insertable<LessonProgressesData> {
  final String ownerUserId;
  final String lessonId;
  final int currentStepIndex;
  final bool isCompleted;
  final int starsEarned;
  final DateTime? completedAt;
  final int attempts;
  final DateTime updatedAt;
  final String syncState;
  const LessonProgressesData({
    required this.ownerUserId,
    required this.lessonId,
    required this.currentStepIndex,
    required this.isCompleted,
    required this.starsEarned,
    this.completedAt,
    required this.attempts,
    required this.updatedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['lesson_id'] = Variable<String>(lessonId);
    map['current_step_index'] = Variable<int>(currentStepIndex);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['stars_earned'] = Variable<int>(starsEarned);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['attempts'] = Variable<int>(attempts);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_state'] = Variable<String>(syncState);
    return map;
  }

  LessonProgressesCompanion toCompanion(bool nullToAbsent) {
    return LessonProgressesCompanion(
      ownerUserId: Value(ownerUserId),
      lessonId: Value(lessonId),
      currentStepIndex: Value(currentStepIndex),
      isCompleted: Value(isCompleted),
      starsEarned: Value(starsEarned),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      attempts: Value(attempts),
      updatedAt: Value(updatedAt),
      syncState: Value(syncState),
    );
  }

  factory LessonProgressesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LessonProgressesData(
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      lessonId: serializer.fromJson<String>(json['lessonId']),
      currentStepIndex: serializer.fromJson<int>(json['currentStepIndex']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      starsEarned: serializer.fromJson<int>(json['starsEarned']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      attempts: serializer.fromJson<int>(json['attempts']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncState: serializer.fromJson<String>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'lessonId': serializer.toJson<String>(lessonId),
      'currentStepIndex': serializer.toJson<int>(currentStepIndex),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'starsEarned': serializer.toJson<int>(starsEarned),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'attempts': serializer.toJson<int>(attempts),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncState': serializer.toJson<String>(syncState),
    };
  }

  LessonProgressesData copyWith({
    String? ownerUserId,
    String? lessonId,
    int? currentStepIndex,
    bool? isCompleted,
    int? starsEarned,
    Value<DateTime?> completedAt = const Value.absent(),
    int? attempts,
    DateTime? updatedAt,
    String? syncState,
  }) => LessonProgressesData(
    ownerUserId: ownerUserId ?? this.ownerUserId,
    lessonId: lessonId ?? this.lessonId,
    currentStepIndex: currentStepIndex ?? this.currentStepIndex,
    isCompleted: isCompleted ?? this.isCompleted,
    starsEarned: starsEarned ?? this.starsEarned,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    attempts: attempts ?? this.attempts,
    updatedAt: updatedAt ?? this.updatedAt,
    syncState: syncState ?? this.syncState,
  );
  LessonProgressesData copyWithCompanion(LessonProgressesCompanion data) {
    return LessonProgressesData(
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      currentStepIndex: data.currentStepIndex.present
          ? data.currentStepIndex.value
          : this.currentStepIndex,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      starsEarned: data.starsEarned.present
          ? data.starsEarned.value
          : this.starsEarned,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LessonProgressesData(')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('lessonId: $lessonId, ')
          ..write('currentStepIndex: $currentStepIndex, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('starsEarned: $starsEarned, ')
          ..write('completedAt: $completedAt, ')
          ..write('attempts: $attempts, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    ownerUserId,
    lessonId,
    currentStepIndex,
    isCompleted,
    starsEarned,
    completedAt,
    attempts,
    updatedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LessonProgressesData &&
          other.ownerUserId == this.ownerUserId &&
          other.lessonId == this.lessonId &&
          other.currentStepIndex == this.currentStepIndex &&
          other.isCompleted == this.isCompleted &&
          other.starsEarned == this.starsEarned &&
          other.completedAt == this.completedAt &&
          other.attempts == this.attempts &&
          other.updatedAt == this.updatedAt &&
          other.syncState == this.syncState);
}

class LessonProgressesCompanion extends UpdateCompanion<LessonProgressesData> {
  final Value<String> ownerUserId;
  final Value<String> lessonId;
  final Value<int> currentStepIndex;
  final Value<bool> isCompleted;
  final Value<int> starsEarned;
  final Value<DateTime?> completedAt;
  final Value<int> attempts;
  final Value<DateTime> updatedAt;
  final Value<String> syncState;
  final Value<int> rowid;
  const LessonProgressesCompanion({
    this.ownerUserId = const Value.absent(),
    this.lessonId = const Value.absent(),
    this.currentStepIndex = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.starsEarned = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.attempts = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LessonProgressesCompanion.insert({
    required String ownerUserId,
    required String lessonId,
    this.currentStepIndex = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.starsEarned = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.attempts = const Value.absent(),
    required DateTime updatedAt,
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : ownerUserId = Value(ownerUserId),
       lessonId = Value(lessonId),
       updatedAt = Value(updatedAt);
  static Insertable<LessonProgressesData> custom({
    Expression<String>? ownerUserId,
    Expression<String>? lessonId,
    Expression<int>? currentStepIndex,
    Expression<bool>? isCompleted,
    Expression<int>? starsEarned,
    Expression<DateTime>? completedAt,
    Expression<int>? attempts,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (lessonId != null) 'lesson_id': lessonId,
      if (currentStepIndex != null) 'current_step_index': currentStepIndex,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (starsEarned != null) 'stars_earned': starsEarned,
      if (completedAt != null) 'completed_at': completedAt,
      if (attempts != null) 'attempts': attempts,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LessonProgressesCompanion copyWith({
    Value<String>? ownerUserId,
    Value<String>? lessonId,
    Value<int>? currentStepIndex,
    Value<bool>? isCompleted,
    Value<int>? starsEarned,
    Value<DateTime?>? completedAt,
    Value<int>? attempts,
    Value<DateTime>? updatedAt,
    Value<String>? syncState,
    Value<int>? rowid,
  }) {
    return LessonProgressesCompanion(
      ownerUserId: ownerUserId ?? this.ownerUserId,
      lessonId: lessonId ?? this.lessonId,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      isCompleted: isCompleted ?? this.isCompleted,
      starsEarned: starsEarned ?? this.starsEarned,
      completedAt: completedAt ?? this.completedAt,
      attempts: attempts ?? this.attempts,
      updatedAt: updatedAt ?? this.updatedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (lessonId.present) {
      map['lesson_id'] = Variable<String>(lessonId.value);
    }
    if (currentStepIndex.present) {
      map['current_step_index'] = Variable<int>(currentStepIndex.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (starsEarned.present) {
      map['stars_earned'] = Variable<int>(starsEarned.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonProgressesCompanion(')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('lessonId: $lessonId, ')
          ..write('currentStepIndex: $currentStepIndex, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('starsEarned: $starsEarned, ')
          ..write('completedAt: $completedAt, ')
          ..write('attempts: $attempts, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PuzzleProgressesTable extends PuzzleProgresses
    with TableInfo<$PuzzleProgressesTable, PuzzleProgressesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PuzzleProgressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (local_user_id)',
    ),
  );
  static const VerificationMeta _puzzleIdMeta = const VerificationMeta(
    'puzzleId',
  );
  @override
  late final GeneratedColumn<String> puzzleId = GeneratedColumn<String>(
    'puzzle_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packIdMeta = const VerificationMeta('packId');
  @override
  late final GeneratedColumn<String> packId = GeneratedColumn<String>(
    'pack_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSolvedMeta = const VerificationMeta(
    'isSolved',
  );
  @override
  late final GeneratedColumn<bool> isSolved = GeneratedColumn<bool>(
    'is_solved',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_solved" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _bestTimeMsMeta = const VerificationMeta(
    'bestTimeMs',
  );
  @override
  late final GeneratedColumn<int> bestTimeMs = GeneratedColumn<int>(
    'best_time_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hintsUsedMeta = const VerificationMeta(
    'hintsUsed',
  );
  @override
  late final GeneratedColumn<int> hintsUsed = GeneratedColumn<int>(
    'hints_used',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _solvedAtMeta = const VerificationMeta(
    'solvedAt',
  );
  @override
  late final GeneratedColumn<DateTime> solvedAt = GeneratedColumn<DateTime>(
    'solved_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local_only'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    ownerUserId,
    puzzleId,
    packId,
    isSolved,
    bestTimeMs,
    hintsUsed,
    attempts,
    solvedAt,
    updatedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'puzzle_progresses';
  @override
  VerificationContext validateIntegrity(
    Insertable<PuzzleProgressesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('puzzle_id')) {
      context.handle(
        _puzzleIdMeta,
        puzzleId.isAcceptableOrUnknown(data['puzzle_id']!, _puzzleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_puzzleIdMeta);
    }
    if (data.containsKey('pack_id')) {
      context.handle(
        _packIdMeta,
        packId.isAcceptableOrUnknown(data['pack_id']!, _packIdMeta),
      );
    } else if (isInserting) {
      context.missing(_packIdMeta);
    }
    if (data.containsKey('is_solved')) {
      context.handle(
        _isSolvedMeta,
        isSolved.isAcceptableOrUnknown(data['is_solved']!, _isSolvedMeta),
      );
    }
    if (data.containsKey('best_time_ms')) {
      context.handle(
        _bestTimeMsMeta,
        bestTimeMs.isAcceptableOrUnknown(
          data['best_time_ms']!,
          _bestTimeMsMeta,
        ),
      );
    }
    if (data.containsKey('hints_used')) {
      context.handle(
        _hintsUsedMeta,
        hintsUsed.isAcceptableOrUnknown(data['hints_used']!, _hintsUsedMeta),
      );
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('solved_at')) {
      context.handle(
        _solvedAtMeta,
        solvedAt.isAcceptableOrUnknown(data['solved_at']!, _solvedAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ownerUserId, puzzleId};
  @override
  PuzzleProgressesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PuzzleProgressesData(
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      puzzleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}puzzle_id'],
      )!,
      packId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pack_id'],
      )!,
      isSolved: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_solved'],
      )!,
      bestTimeMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}best_time_ms'],
      ),
      hintsUsed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hints_used'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      solvedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}solved_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      )!,
    );
  }

  @override
  $PuzzleProgressesTable createAlias(String alias) {
    return $PuzzleProgressesTable(attachedDatabase, alias);
  }
}

class PuzzleProgressesData extends DataClass
    implements Insertable<PuzzleProgressesData> {
  final String ownerUserId;
  final String puzzleId;
  final String packId;
  final bool isSolved;
  final int? bestTimeMs;
  final int hintsUsed;
  final int attempts;
  final DateTime? solvedAt;
  final DateTime updatedAt;
  final String syncState;
  const PuzzleProgressesData({
    required this.ownerUserId,
    required this.puzzleId,
    required this.packId,
    required this.isSolved,
    this.bestTimeMs,
    required this.hintsUsed,
    required this.attempts,
    this.solvedAt,
    required this.updatedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['puzzle_id'] = Variable<String>(puzzleId);
    map['pack_id'] = Variable<String>(packId);
    map['is_solved'] = Variable<bool>(isSolved);
    if (!nullToAbsent || bestTimeMs != null) {
      map['best_time_ms'] = Variable<int>(bestTimeMs);
    }
    map['hints_used'] = Variable<int>(hintsUsed);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || solvedAt != null) {
      map['solved_at'] = Variable<DateTime>(solvedAt);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_state'] = Variable<String>(syncState);
    return map;
  }

  PuzzleProgressesCompanion toCompanion(bool nullToAbsent) {
    return PuzzleProgressesCompanion(
      ownerUserId: Value(ownerUserId),
      puzzleId: Value(puzzleId),
      packId: Value(packId),
      isSolved: Value(isSolved),
      bestTimeMs: bestTimeMs == null && nullToAbsent
          ? const Value.absent()
          : Value(bestTimeMs),
      hintsUsed: Value(hintsUsed),
      attempts: Value(attempts),
      solvedAt: solvedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(solvedAt),
      updatedAt: Value(updatedAt),
      syncState: Value(syncState),
    );
  }

  factory PuzzleProgressesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuzzleProgressesData(
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      puzzleId: serializer.fromJson<String>(json['puzzleId']),
      packId: serializer.fromJson<String>(json['packId']),
      isSolved: serializer.fromJson<bool>(json['isSolved']),
      bestTimeMs: serializer.fromJson<int?>(json['bestTimeMs']),
      hintsUsed: serializer.fromJson<int>(json['hintsUsed']),
      attempts: serializer.fromJson<int>(json['attempts']),
      solvedAt: serializer.fromJson<DateTime?>(json['solvedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncState: serializer.fromJson<String>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'puzzleId': serializer.toJson<String>(puzzleId),
      'packId': serializer.toJson<String>(packId),
      'isSolved': serializer.toJson<bool>(isSolved),
      'bestTimeMs': serializer.toJson<int?>(bestTimeMs),
      'hintsUsed': serializer.toJson<int>(hintsUsed),
      'attempts': serializer.toJson<int>(attempts),
      'solvedAt': serializer.toJson<DateTime?>(solvedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncState': serializer.toJson<String>(syncState),
    };
  }

  PuzzleProgressesData copyWith({
    String? ownerUserId,
    String? puzzleId,
    String? packId,
    bool? isSolved,
    Value<int?> bestTimeMs = const Value.absent(),
    int? hintsUsed,
    int? attempts,
    Value<DateTime?> solvedAt = const Value.absent(),
    DateTime? updatedAt,
    String? syncState,
  }) => PuzzleProgressesData(
    ownerUserId: ownerUserId ?? this.ownerUserId,
    puzzleId: puzzleId ?? this.puzzleId,
    packId: packId ?? this.packId,
    isSolved: isSolved ?? this.isSolved,
    bestTimeMs: bestTimeMs.present ? bestTimeMs.value : this.bestTimeMs,
    hintsUsed: hintsUsed ?? this.hintsUsed,
    attempts: attempts ?? this.attempts,
    solvedAt: solvedAt.present ? solvedAt.value : this.solvedAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncState: syncState ?? this.syncState,
  );
  PuzzleProgressesData copyWithCompanion(PuzzleProgressesCompanion data) {
    return PuzzleProgressesData(
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      puzzleId: data.puzzleId.present ? data.puzzleId.value : this.puzzleId,
      packId: data.packId.present ? data.packId.value : this.packId,
      isSolved: data.isSolved.present ? data.isSolved.value : this.isSolved,
      bestTimeMs: data.bestTimeMs.present
          ? data.bestTimeMs.value
          : this.bestTimeMs,
      hintsUsed: data.hintsUsed.present ? data.hintsUsed.value : this.hintsUsed,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      solvedAt: data.solvedAt.present ? data.solvedAt.value : this.solvedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PuzzleProgressesData(')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('puzzleId: $puzzleId, ')
          ..write('packId: $packId, ')
          ..write('isSolved: $isSolved, ')
          ..write('bestTimeMs: $bestTimeMs, ')
          ..write('hintsUsed: $hintsUsed, ')
          ..write('attempts: $attempts, ')
          ..write('solvedAt: $solvedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    ownerUserId,
    puzzleId,
    packId,
    isSolved,
    bestTimeMs,
    hintsUsed,
    attempts,
    solvedAt,
    updatedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuzzleProgressesData &&
          other.ownerUserId == this.ownerUserId &&
          other.puzzleId == this.puzzleId &&
          other.packId == this.packId &&
          other.isSolved == this.isSolved &&
          other.bestTimeMs == this.bestTimeMs &&
          other.hintsUsed == this.hintsUsed &&
          other.attempts == this.attempts &&
          other.solvedAt == this.solvedAt &&
          other.updatedAt == this.updatedAt &&
          other.syncState == this.syncState);
}

class PuzzleProgressesCompanion extends UpdateCompanion<PuzzleProgressesData> {
  final Value<String> ownerUserId;
  final Value<String> puzzleId;
  final Value<String> packId;
  final Value<bool> isSolved;
  final Value<int?> bestTimeMs;
  final Value<int> hintsUsed;
  final Value<int> attempts;
  final Value<DateTime?> solvedAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncState;
  final Value<int> rowid;
  const PuzzleProgressesCompanion({
    this.ownerUserId = const Value.absent(),
    this.puzzleId = const Value.absent(),
    this.packId = const Value.absent(),
    this.isSolved = const Value.absent(),
    this.bestTimeMs = const Value.absent(),
    this.hintsUsed = const Value.absent(),
    this.attempts = const Value.absent(),
    this.solvedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PuzzleProgressesCompanion.insert({
    required String ownerUserId,
    required String puzzleId,
    required String packId,
    this.isSolved = const Value.absent(),
    this.bestTimeMs = const Value.absent(),
    this.hintsUsed = const Value.absent(),
    this.attempts = const Value.absent(),
    this.solvedAt = const Value.absent(),
    required DateTime updatedAt,
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : ownerUserId = Value(ownerUserId),
       puzzleId = Value(puzzleId),
       packId = Value(packId),
       updatedAt = Value(updatedAt);
  static Insertable<PuzzleProgressesData> custom({
    Expression<String>? ownerUserId,
    Expression<String>? puzzleId,
    Expression<String>? packId,
    Expression<bool>? isSolved,
    Expression<int>? bestTimeMs,
    Expression<int>? hintsUsed,
    Expression<int>? attempts,
    Expression<DateTime>? solvedAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (puzzleId != null) 'puzzle_id': puzzleId,
      if (packId != null) 'pack_id': packId,
      if (isSolved != null) 'is_solved': isSolved,
      if (bestTimeMs != null) 'best_time_ms': bestTimeMs,
      if (hintsUsed != null) 'hints_used': hintsUsed,
      if (attempts != null) 'attempts': attempts,
      if (solvedAt != null) 'solved_at': solvedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PuzzleProgressesCompanion copyWith({
    Value<String>? ownerUserId,
    Value<String>? puzzleId,
    Value<String>? packId,
    Value<bool>? isSolved,
    Value<int?>? bestTimeMs,
    Value<int>? hintsUsed,
    Value<int>? attempts,
    Value<DateTime?>? solvedAt,
    Value<DateTime>? updatedAt,
    Value<String>? syncState,
    Value<int>? rowid,
  }) {
    return PuzzleProgressesCompanion(
      ownerUserId: ownerUserId ?? this.ownerUserId,
      puzzleId: puzzleId ?? this.puzzleId,
      packId: packId ?? this.packId,
      isSolved: isSolved ?? this.isSolved,
      bestTimeMs: bestTimeMs ?? this.bestTimeMs,
      hintsUsed: hintsUsed ?? this.hintsUsed,
      attempts: attempts ?? this.attempts,
      solvedAt: solvedAt ?? this.solvedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (puzzleId.present) {
      map['puzzle_id'] = Variable<String>(puzzleId.value);
    }
    if (packId.present) {
      map['pack_id'] = Variable<String>(packId.value);
    }
    if (isSolved.present) {
      map['is_solved'] = Variable<bool>(isSolved.value);
    }
    if (bestTimeMs.present) {
      map['best_time_ms'] = Variable<int>(bestTimeMs.value);
    }
    if (hintsUsed.present) {
      map['hints_used'] = Variable<int>(hintsUsed.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (solvedAt.present) {
      map['solved_at'] = Variable<DateTime>(solvedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuzzleProgressesCompanion(')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('puzzleId: $puzzleId, ')
          ..write('packId: $packId, ')
          ..write('isSolved: $isSolved, ')
          ..write('bestTimeMs: $bestTimeMs, ')
          ..write('hintsUsed: $hintsUsed, ')
          ..write('attempts: $attempts, ')
          ..write('solvedAt: $solvedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GameHistoriesTable extends GameHistories
    with TableInfo<$GameHistoriesTable, GameHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (local_user_id)',
    ),
  );
  static const VerificationMeta _pgnMeta = const VerificationMeta('pgn');
  @override
  late final GeneratedColumn<String> pgn = GeneratedColumn<String>(
    'pgn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _opponentTypeMeta = const VerificationMeta(
    'opponentType',
  );
  @override
  late final GeneratedColumn<String> opponentType = GeneratedColumn<String>(
    'opponent_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _opponentNameMeta = const VerificationMeta(
    'opponentName',
  );
  @override
  late final GeneratedColumn<String> opponentName = GeneratedColumn<String>(
    'opponent_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
    'result',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playedAtMeta = const VerificationMeta(
    'playedAt',
  );
  @override
  late final GeneratedColumn<DateTime> playedAt = GeneratedColumn<DateTime>(
    'played_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moveCountMeta = const VerificationMeta(
    'moveCount',
  );
  @override
  late final GeneratedColumn<int> moveCount = GeneratedColumn<int>(
    'move_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local_only'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    pgn,
    opponentType,
    opponentName,
    result,
    playedAt,
    durationSeconds,
    moveCount,
    updatedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameHistory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('pgn')) {
      context.handle(
        _pgnMeta,
        pgn.isAcceptableOrUnknown(data['pgn']!, _pgnMeta),
      );
    } else if (isInserting) {
      context.missing(_pgnMeta);
    }
    if (data.containsKey('opponent_type')) {
      context.handle(
        _opponentTypeMeta,
        opponentType.isAcceptableOrUnknown(
          data['opponent_type']!,
          _opponentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_opponentTypeMeta);
    }
    if (data.containsKey('opponent_name')) {
      context.handle(
        _opponentNameMeta,
        opponentName.isAcceptableOrUnknown(
          data['opponent_name']!,
          _opponentNameMeta,
        ),
      );
    }
    if (data.containsKey('result')) {
      context.handle(
        _resultMeta,
        result.isAcceptableOrUnknown(data['result']!, _resultMeta),
      );
    } else if (isInserting) {
      context.missing(_resultMeta);
    }
    if (data.containsKey('played_at')) {
      context.handle(
        _playedAtMeta,
        playedAt.isAcceptableOrUnknown(data['played_at']!, _playedAtMeta),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('move_count')) {
      context.handle(
        _moveCountMeta,
        moveCount.isAcceptableOrUnknown(data['move_count']!, _moveCountMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameHistory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      pgn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pgn'],
      )!,
      opponentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}opponent_type'],
      )!,
      opponentName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}opponent_name'],
      ),
      result: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result'],
      )!,
      playedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}played_at'],
      )!,
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      ),
      moveCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}move_count'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      )!,
    );
  }

  @override
  $GameHistoriesTable createAlias(String alias) {
    return $GameHistoriesTable(attachedDatabase, alias);
  }
}

class GameHistory extends DataClass implements Insertable<GameHistory> {
  final int id;
  final String ownerUserId;
  final String pgn;
  final String opponentType;
  final String? opponentName;
  final String result;
  final DateTime playedAt;
  final int? durationSeconds;
  final int? moveCount;
  final DateTime updatedAt;
  final String syncState;
  const GameHistory({
    required this.id,
    required this.ownerUserId,
    required this.pgn,
    required this.opponentType,
    this.opponentName,
    required this.result,
    required this.playedAt,
    this.durationSeconds,
    this.moveCount,
    required this.updatedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['pgn'] = Variable<String>(pgn);
    map['opponent_type'] = Variable<String>(opponentType);
    if (!nullToAbsent || opponentName != null) {
      map['opponent_name'] = Variable<String>(opponentName);
    }
    map['result'] = Variable<String>(result);
    map['played_at'] = Variable<DateTime>(playedAt);
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || moveCount != null) {
      map['move_count'] = Variable<int>(moveCount);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_state'] = Variable<String>(syncState);
    return map;
  }

  GameHistoriesCompanion toCompanion(bool nullToAbsent) {
    return GameHistoriesCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      pgn: Value(pgn),
      opponentType: Value(opponentType),
      opponentName: opponentName == null && nullToAbsent
          ? const Value.absent()
          : Value(opponentName),
      result: Value(result),
      playedAt: Value(playedAt),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      moveCount: moveCount == null && nullToAbsent
          ? const Value.absent()
          : Value(moveCount),
      updatedAt: Value(updatedAt),
      syncState: Value(syncState),
    );
  }

  factory GameHistory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameHistory(
      id: serializer.fromJson<int>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      pgn: serializer.fromJson<String>(json['pgn']),
      opponentType: serializer.fromJson<String>(json['opponentType']),
      opponentName: serializer.fromJson<String?>(json['opponentName']),
      result: serializer.fromJson<String>(json['result']),
      playedAt: serializer.fromJson<DateTime>(json['playedAt']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      moveCount: serializer.fromJson<int?>(json['moveCount']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncState: serializer.fromJson<String>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'pgn': serializer.toJson<String>(pgn),
      'opponentType': serializer.toJson<String>(opponentType),
      'opponentName': serializer.toJson<String?>(opponentName),
      'result': serializer.toJson<String>(result),
      'playedAt': serializer.toJson<DateTime>(playedAt),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'moveCount': serializer.toJson<int?>(moveCount),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncState': serializer.toJson<String>(syncState),
    };
  }

  GameHistory copyWith({
    int? id,
    String? ownerUserId,
    String? pgn,
    String? opponentType,
    Value<String?> opponentName = const Value.absent(),
    String? result,
    DateTime? playedAt,
    Value<int?> durationSeconds = const Value.absent(),
    Value<int?> moveCount = const Value.absent(),
    DateTime? updatedAt,
    String? syncState,
  }) => GameHistory(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    pgn: pgn ?? this.pgn,
    opponentType: opponentType ?? this.opponentType,
    opponentName: opponentName.present ? opponentName.value : this.opponentName,
    result: result ?? this.result,
    playedAt: playedAt ?? this.playedAt,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
    moveCount: moveCount.present ? moveCount.value : this.moveCount,
    updatedAt: updatedAt ?? this.updatedAt,
    syncState: syncState ?? this.syncState,
  );
  GameHistory copyWithCompanion(GameHistoriesCompanion data) {
    return GameHistory(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      pgn: data.pgn.present ? data.pgn.value : this.pgn,
      opponentType: data.opponentType.present
          ? data.opponentType.value
          : this.opponentType,
      opponentName: data.opponentName.present
          ? data.opponentName.value
          : this.opponentName,
      result: data.result.present ? data.result.value : this.result,
      playedAt: data.playedAt.present ? data.playedAt.value : this.playedAt,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      moveCount: data.moveCount.present ? data.moveCount.value : this.moveCount,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameHistory(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('pgn: $pgn, ')
          ..write('opponentType: $opponentType, ')
          ..write('opponentName: $opponentName, ')
          ..write('result: $result, ')
          ..write('playedAt: $playedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('moveCount: $moveCount, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerUserId,
    pgn,
    opponentType,
    opponentName,
    result,
    playedAt,
    durationSeconds,
    moveCount,
    updatedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameHistory &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.pgn == this.pgn &&
          other.opponentType == this.opponentType &&
          other.opponentName == this.opponentName &&
          other.result == this.result &&
          other.playedAt == this.playedAt &&
          other.durationSeconds == this.durationSeconds &&
          other.moveCount == this.moveCount &&
          other.updatedAt == this.updatedAt &&
          other.syncState == this.syncState);
}

class GameHistoriesCompanion extends UpdateCompanion<GameHistory> {
  final Value<int> id;
  final Value<String> ownerUserId;
  final Value<String> pgn;
  final Value<String> opponentType;
  final Value<String?> opponentName;
  final Value<String> result;
  final Value<DateTime> playedAt;
  final Value<int?> durationSeconds;
  final Value<int?> moveCount;
  final Value<DateTime> updatedAt;
  final Value<String> syncState;
  const GameHistoriesCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.pgn = const Value.absent(),
    this.opponentType = const Value.absent(),
    this.opponentName = const Value.absent(),
    this.result = const Value.absent(),
    this.playedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.moveCount = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
  });
  GameHistoriesCompanion.insert({
    this.id = const Value.absent(),
    required String ownerUserId,
    required String pgn,
    required String opponentType,
    this.opponentName = const Value.absent(),
    required String result,
    this.playedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.moveCount = const Value.absent(),
    required DateTime updatedAt,
    this.syncState = const Value.absent(),
  }) : ownerUserId = Value(ownerUserId),
       pgn = Value(pgn),
       opponentType = Value(opponentType),
       result = Value(result),
       updatedAt = Value(updatedAt);
  static Insertable<GameHistory> custom({
    Expression<int>? id,
    Expression<String>? ownerUserId,
    Expression<String>? pgn,
    Expression<String>? opponentType,
    Expression<String>? opponentName,
    Expression<String>? result,
    Expression<DateTime>? playedAt,
    Expression<int>? durationSeconds,
    Expression<int>? moveCount,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncState,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (pgn != null) 'pgn': pgn,
      if (opponentType != null) 'opponent_type': opponentType,
      if (opponentName != null) 'opponent_name': opponentName,
      if (result != null) 'result': result,
      if (playedAt != null) 'played_at': playedAt,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (moveCount != null) 'move_count': moveCount,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncState != null) 'sync_state': syncState,
    });
  }

  GameHistoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? ownerUserId,
    Value<String>? pgn,
    Value<String>? opponentType,
    Value<String?>? opponentName,
    Value<String>? result,
    Value<DateTime>? playedAt,
    Value<int?>? durationSeconds,
    Value<int?>? moveCount,
    Value<DateTime>? updatedAt,
    Value<String>? syncState,
  }) {
    return GameHistoriesCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      pgn: pgn ?? this.pgn,
      opponentType: opponentType ?? this.opponentType,
      opponentName: opponentName ?? this.opponentName,
      result: result ?? this.result,
      playedAt: playedAt ?? this.playedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      moveCount: moveCount ?? this.moveCount,
      updatedAt: updatedAt ?? this.updatedAt,
      syncState: syncState ?? this.syncState,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (pgn.present) {
      map['pgn'] = Variable<String>(pgn.value);
    }
    if (opponentType.present) {
      map['opponent_type'] = Variable<String>(opponentType.value);
    }
    if (opponentName.present) {
      map['opponent_name'] = Variable<String>(opponentName.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (playedAt.present) {
      map['played_at'] = Variable<DateTime>(playedAt.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (moveCount.present) {
      map['move_count'] = Variable<int>(moveCount.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameHistoriesCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('pgn: $pgn, ')
          ..write('opponentType: $opponentType, ')
          ..write('opponentName: $opponentName, ')
          ..write('result: $result, ')
          ..write('playedAt: $playedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('moveCount: $moveCount, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }
}

class $SavedAiGameSessionsTable extends SavedAiGameSessions
    with TableInfo<$SavedAiGameSessionsTable, SavedAiGameSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedAiGameSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (local_user_id)',
    ),
  );
  static const VerificationMeta _skillLevelMeta = const VerificationMeta(
    'skillLevel',
  );
  @override
  late final GeneratedColumn<int> skillLevel = GeneratedColumn<int>(
    'skill_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _movesUciJsonMeta = const VerificationMeta(
    'movesUciJson',
  );
  @override
  late final GeneratedColumn<String> movesUciJson = GeneratedColumn<String>(
    'moves_uci_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local_only'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    skillLevel,
    movesUciJson,
    createdAt,
    updatedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_ai_game_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavedAiGameSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('skill_level')) {
      context.handle(
        _skillLevelMeta,
        skillLevel.isAcceptableOrUnknown(data['skill_level']!, _skillLevelMeta),
      );
    } else if (isInserting) {
      context.missing(_skillLevelMeta);
    }
    if (data.containsKey('moves_uci_json')) {
      context.handle(
        _movesUciJsonMeta,
        movesUciJson.isAcceptableOrUnknown(
          data['moves_uci_json']!,
          _movesUciJsonMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavedAiGameSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedAiGameSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      skillLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}skill_level'],
      )!,
      movesUciJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}moves_uci_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      )!,
    );
  }

  @override
  $SavedAiGameSessionsTable createAlias(String alias) {
    return $SavedAiGameSessionsTable(attachedDatabase, alias);
  }
}

class SavedAiGameSession extends DataClass
    implements Insertable<SavedAiGameSession> {
  final int id;
  final String ownerUserId;
  final int skillLevel;
  final String movesUciJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncState;
  const SavedAiGameSession({
    required this.id,
    required this.ownerUserId,
    required this.skillLevel,
    required this.movesUciJson,
    required this.createdAt,
    required this.updatedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['skill_level'] = Variable<int>(skillLevel);
    map['moves_uci_json'] = Variable<String>(movesUciJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_state'] = Variable<String>(syncState);
    return map;
  }

  SavedAiGameSessionsCompanion toCompanion(bool nullToAbsent) {
    return SavedAiGameSessionsCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      skillLevel: Value(skillLevel),
      movesUciJson: Value(movesUciJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncState: Value(syncState),
    );
  }

  factory SavedAiGameSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedAiGameSession(
      id: serializer.fromJson<int>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      skillLevel: serializer.fromJson<int>(json['skillLevel']),
      movesUciJson: serializer.fromJson<String>(json['movesUciJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncState: serializer.fromJson<String>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'skillLevel': serializer.toJson<int>(skillLevel),
      'movesUciJson': serializer.toJson<String>(movesUciJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncState': serializer.toJson<String>(syncState),
    };
  }

  SavedAiGameSession copyWith({
    int? id,
    String? ownerUserId,
    int? skillLevel,
    String? movesUciJson,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? syncState,
  }) => SavedAiGameSession(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    skillLevel: skillLevel ?? this.skillLevel,
    movesUciJson: movesUciJson ?? this.movesUciJson,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncState: syncState ?? this.syncState,
  );
  SavedAiGameSession copyWithCompanion(SavedAiGameSessionsCompanion data) {
    return SavedAiGameSession(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      skillLevel: data.skillLevel.present
          ? data.skillLevel.value
          : this.skillLevel,
      movesUciJson: data.movesUciJson.present
          ? data.movesUciJson.value
          : this.movesUciJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedAiGameSession(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('skillLevel: $skillLevel, ')
          ..write('movesUciJson: $movesUciJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerUserId,
    skillLevel,
    movesUciJson,
    createdAt,
    updatedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedAiGameSession &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.skillLevel == this.skillLevel &&
          other.movesUciJson == this.movesUciJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncState == this.syncState);
}

class SavedAiGameSessionsCompanion extends UpdateCompanion<SavedAiGameSession> {
  final Value<int> id;
  final Value<String> ownerUserId;
  final Value<int> skillLevel;
  final Value<String> movesUciJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncState;
  const SavedAiGameSessionsCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.skillLevel = const Value.absent(),
    this.movesUciJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
  });
  SavedAiGameSessionsCompanion.insert({
    this.id = const Value.absent(),
    required String ownerUserId,
    required int skillLevel,
    this.movesUciJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    required DateTime updatedAt,
    this.syncState = const Value.absent(),
  }) : ownerUserId = Value(ownerUserId),
       skillLevel = Value(skillLevel),
       updatedAt = Value(updatedAt);
  static Insertable<SavedAiGameSession> custom({
    Expression<int>? id,
    Expression<String>? ownerUserId,
    Expression<int>? skillLevel,
    Expression<String>? movesUciJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncState,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (skillLevel != null) 'skill_level': skillLevel,
      if (movesUciJson != null) 'moves_uci_json': movesUciJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncState != null) 'sync_state': syncState,
    });
  }

  SavedAiGameSessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? ownerUserId,
    Value<int>? skillLevel,
    Value<String>? movesUciJson,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? syncState,
  }) {
    return SavedAiGameSessionsCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      skillLevel: skillLevel ?? this.skillLevel,
      movesUciJson: movesUciJson ?? this.movesUciJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncState: syncState ?? this.syncState,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (skillLevel.present) {
      map['skill_level'] = Variable<int>(skillLevel.value);
    }
    if (movesUciJson.present) {
      map['moves_uci_json'] = Variable<String>(movesUciJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedAiGameSessionsCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('skillLevel: $skillLevel, ')
          ..write('movesUciJson: $movesUciJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }
}

class $AchievementsTable extends Achievements
    with TableInfo<$AchievementsTable, Achievement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (local_user_id)',
    ),
  );
  static const VerificationMeta _unlockedAtMeta = const VerificationMeta(
    'unlockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
    'unlocked_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _targetMeta = const VerificationMeta('target');
  @override
  late final GeneratedColumn<int> target = GeneratedColumn<int>(
    'target',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local_only'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    unlockedAt,
    progress,
    target,
    updatedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Achievement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
        _unlockedAtMeta,
        unlockedAt.isAcceptableOrUnknown(data['unlocked_at']!, _unlockedAtMeta),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('target')) {
      context.handle(
        _targetMeta,
        target.isAcceptableOrUnknown(data['target']!, _targetMeta),
      );
    } else if (isInserting) {
      context.missing(_targetMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, ownerUserId};
  @override
  Achievement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Achievement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      unlockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}unlocked_at'],
      ),
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress'],
      )!,
      target: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      )!,
    );
  }

  @override
  $AchievementsTable createAlias(String alias) {
    return $AchievementsTable(attachedDatabase, alias);
  }
}

class Achievement extends DataClass implements Insertable<Achievement> {
  final String id;
  final String ownerUserId;
  final DateTime? unlockedAt;
  final int progress;
  final int target;
  final DateTime updatedAt;
  final String syncState;
  const Achievement({
    required this.id,
    required this.ownerUserId,
    this.unlockedAt,
    required this.progress,
    required this.target,
    required this.updatedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    if (!nullToAbsent || unlockedAt != null) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    }
    map['progress'] = Variable<int>(progress);
    map['target'] = Variable<int>(target);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_state'] = Variable<String>(syncState);
    return map;
  }

  AchievementsCompanion toCompanion(bool nullToAbsent) {
    return AchievementsCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      unlockedAt: unlockedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(unlockedAt),
      progress: Value(progress),
      target: Value(target),
      updatedAt: Value(updatedAt),
      syncState: Value(syncState),
    );
  }

  factory Achievement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Achievement(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      unlockedAt: serializer.fromJson<DateTime?>(json['unlockedAt']),
      progress: serializer.fromJson<int>(json['progress']),
      target: serializer.fromJson<int>(json['target']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncState: serializer.fromJson<String>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'unlockedAt': serializer.toJson<DateTime?>(unlockedAt),
      'progress': serializer.toJson<int>(progress),
      'target': serializer.toJson<int>(target),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncState': serializer.toJson<String>(syncState),
    };
  }

  Achievement copyWith({
    String? id,
    String? ownerUserId,
    Value<DateTime?> unlockedAt = const Value.absent(),
    int? progress,
    int? target,
    DateTime? updatedAt,
    String? syncState,
  }) => Achievement(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    unlockedAt: unlockedAt.present ? unlockedAt.value : this.unlockedAt,
    progress: progress ?? this.progress,
    target: target ?? this.target,
    updatedAt: updatedAt ?? this.updatedAt,
    syncState: syncState ?? this.syncState,
  );
  Achievement copyWithCompanion(AchievementsCompanion data) {
    return Achievement(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      unlockedAt: data.unlockedAt.present
          ? data.unlockedAt.value
          : this.unlockedAt,
      progress: data.progress.present ? data.progress.value : this.progress,
      target: data.target.present ? data.target.value : this.target,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Achievement(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('progress: $progress, ')
          ..write('target: $target, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerUserId,
    unlockedAt,
    progress,
    target,
    updatedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Achievement &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.unlockedAt == this.unlockedAt &&
          other.progress == this.progress &&
          other.target == this.target &&
          other.updatedAt == this.updatedAt &&
          other.syncState == this.syncState);
}

class AchievementsCompanion extends UpdateCompanion<Achievement> {
  final Value<String> id;
  final Value<String> ownerUserId;
  final Value<DateTime?> unlockedAt;
  final Value<int> progress;
  final Value<int> target;
  final Value<DateTime> updatedAt;
  final Value<String> syncState;
  final Value<int> rowid;
  const AchievementsCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.progress = const Value.absent(),
    this.target = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AchievementsCompanion.insert({
    required String id,
    required String ownerUserId,
    this.unlockedAt = const Value.absent(),
    this.progress = const Value.absent(),
    required int target,
    required DateTime updatedAt,
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerUserId = Value(ownerUserId),
       target = Value(target),
       updatedAt = Value(updatedAt);
  static Insertable<Achievement> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<DateTime>? unlockedAt,
    Expression<int>? progress,
    Expression<int>? target,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
      if (progress != null) 'progress': progress,
      if (target != null) 'target': target,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AchievementsCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerUserId,
    Value<DateTime?>? unlockedAt,
    Value<int>? progress,
    Value<int>? target,
    Value<DateTime>? updatedAt,
    Value<String>? syncState,
    Value<int>? rowid,
  }) {
    return AchievementsCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      progress: progress ?? this.progress,
      target: target ?? this.target,
      updatedAt: updatedAt ?? this.updatedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (target.present) {
      map['target'] = Variable<int>(target.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementsCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('progress: $progress, ')
          ..write('target: $target, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ContentVersionsTable extends ContentVersions
    with TableInfo<$ContentVersionsTable, ContentVersion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentVersionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _contentIdMeta = const VerificationMeta(
    'contentId',
  );
  @override
  late final GeneratedColumn<String> contentId = GeneratedColumn<String>(
    'content_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentTypeMeta = const VerificationMeta(
    'contentType',
  );
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
    'content_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _installedAtMeta = const VerificationMeta(
    'installedAt',
  );
  @override
  late final GeneratedColumn<DateTime> installedAt = GeneratedColumn<DateTime>(
    'installed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    contentId,
    contentType,
    version,
    installedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'content_versions';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContentVersion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('content_id')) {
      context.handle(
        _contentIdMeta,
        contentId.isAcceptableOrUnknown(data['content_id']!, _contentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_contentIdMeta);
    }
    if (data.containsKey('content_type')) {
      context.handle(
        _contentTypeMeta,
        contentType.isAcceptableOrUnknown(
          data['content_type']!,
          _contentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentTypeMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('installed_at')) {
      context.handle(
        _installedAtMeta,
        installedAt.isAcceptableOrUnknown(
          data['installed_at']!,
          _installedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {contentId};
  @override
  ContentVersion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContentVersion(
      contentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_id'],
      )!,
      contentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_type'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      installedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}installed_at'],
      )!,
    );
  }

  @override
  $ContentVersionsTable createAlias(String alias) {
    return $ContentVersionsTable(attachedDatabase, alias);
  }
}

class ContentVersion extends DataClass implements Insertable<ContentVersion> {
  final String contentId;
  final String contentType;
  final int version;
  final DateTime installedAt;
  const ContentVersion({
    required this.contentId,
    required this.contentType,
    required this.version,
    required this.installedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['content_id'] = Variable<String>(contentId);
    map['content_type'] = Variable<String>(contentType);
    map['version'] = Variable<int>(version);
    map['installed_at'] = Variable<DateTime>(installedAt);
    return map;
  }

  ContentVersionsCompanion toCompanion(bool nullToAbsent) {
    return ContentVersionsCompanion(
      contentId: Value(contentId),
      contentType: Value(contentType),
      version: Value(version),
      installedAt: Value(installedAt),
    );
  }

  factory ContentVersion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContentVersion(
      contentId: serializer.fromJson<String>(json['contentId']),
      contentType: serializer.fromJson<String>(json['contentType']),
      version: serializer.fromJson<int>(json['version']),
      installedAt: serializer.fromJson<DateTime>(json['installedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'contentId': serializer.toJson<String>(contentId),
      'contentType': serializer.toJson<String>(contentType),
      'version': serializer.toJson<int>(version),
      'installedAt': serializer.toJson<DateTime>(installedAt),
    };
  }

  ContentVersion copyWith({
    String? contentId,
    String? contentType,
    int? version,
    DateTime? installedAt,
  }) => ContentVersion(
    contentId: contentId ?? this.contentId,
    contentType: contentType ?? this.contentType,
    version: version ?? this.version,
    installedAt: installedAt ?? this.installedAt,
  );
  ContentVersion copyWithCompanion(ContentVersionsCompanion data) {
    return ContentVersion(
      contentId: data.contentId.present ? data.contentId.value : this.contentId,
      contentType: data.contentType.present
          ? data.contentType.value
          : this.contentType,
      version: data.version.present ? data.version.value : this.version,
      installedAt: data.installedAt.present
          ? data.installedAt.value
          : this.installedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContentVersion(')
          ..write('contentId: $contentId, ')
          ..write('contentType: $contentType, ')
          ..write('version: $version, ')
          ..write('installedAt: $installedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(contentId, contentType, version, installedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContentVersion &&
          other.contentId == this.contentId &&
          other.contentType == this.contentType &&
          other.version == this.version &&
          other.installedAt == this.installedAt);
}

class ContentVersionsCompanion extends UpdateCompanion<ContentVersion> {
  final Value<String> contentId;
  final Value<String> contentType;
  final Value<int> version;
  final Value<DateTime> installedAt;
  final Value<int> rowid;
  const ContentVersionsCompanion({
    this.contentId = const Value.absent(),
    this.contentType = const Value.absent(),
    this.version = const Value.absent(),
    this.installedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContentVersionsCompanion.insert({
    required String contentId,
    required String contentType,
    required int version,
    this.installedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : contentId = Value(contentId),
       contentType = Value(contentType),
       version = Value(version);
  static Insertable<ContentVersion> custom({
    Expression<String>? contentId,
    Expression<String>? contentType,
    Expression<int>? version,
    Expression<DateTime>? installedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (contentId != null) 'content_id': contentId,
      if (contentType != null) 'content_type': contentType,
      if (version != null) 'version': version,
      if (installedAt != null) 'installed_at': installedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContentVersionsCompanion copyWith({
    Value<String>? contentId,
    Value<String>? contentType,
    Value<int>? version,
    Value<DateTime>? installedAt,
    Value<int>? rowid,
  }) {
    return ContentVersionsCompanion(
      contentId: contentId ?? this.contentId,
      contentType: contentType ?? this.contentType,
      version: version ?? this.version,
      installedAt: installedAt ?? this.installedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (contentId.present) {
      map['content_id'] = Variable<String>(contentId.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (installedAt.present) {
      map['installed_at'] = Variable<DateTime>(installedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentVersionsCompanion(')
          ..write('contentId: $contentId, ')
          ..write('contentType: $contentType, ')
          ..write('version: $version, ')
          ..write('installedAt: $installedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $LessonProgressesTable lessonProgresses = $LessonProgressesTable(
    this,
  );
  late final $PuzzleProgressesTable puzzleProgresses = $PuzzleProgressesTable(
    this,
  );
  late final $GameHistoriesTable gameHistories = $GameHistoriesTable(this);
  late final $SavedAiGameSessionsTable savedAiGameSessions =
      $SavedAiGameSessionsTable(this);
  late final $AchievementsTable achievements = $AchievementsTable(this);
  late final $ContentVersionsTable contentVersions = $ContentVersionsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    lessonProgresses,
    puzzleProgresses,
    gameHistories,
    savedAiGameSessions,
    achievements,
    contentVersions,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String localUserId,
      Value<String?> remoteUserId,
      Value<String?> authProvider,
      Value<String> name,
      Value<String> avatarId,
      Value<int> totalXp,
      Value<int> currentRating,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> localUserId,
      Value<String?> remoteUserId,
      Value<String?> authProvider,
      Value<String> name,
      Value<String> avatarId,
      Value<int> totalXp,
      Value<int> currentRating,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LessonProgressesTable, List<LessonProgressesData>>
  _lessonProgressesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lessonProgresses,
    aliasName: $_aliasNameGenerator(
      db.users.localUserId,
      db.lessonProgresses.ownerUserId,
    ),
  );

  $$LessonProgressesTableProcessedTableManager get lessonProgressesRefs {
    final manager =
        $$LessonProgressesTableTableManager($_db, $_db.lessonProgresses).filter(
          (f) => f.ownerUserId.localUserId.sqlEquals(
            $_itemColumn<String>('local_user_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _lessonProgressesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PuzzleProgressesTable, List<PuzzleProgressesData>>
  _puzzleProgressesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.puzzleProgresses,
    aliasName: $_aliasNameGenerator(
      db.users.localUserId,
      db.puzzleProgresses.ownerUserId,
    ),
  );

  $$PuzzleProgressesTableProcessedTableManager get puzzleProgressesRefs {
    final manager =
        $$PuzzleProgressesTableTableManager($_db, $_db.puzzleProgresses).filter(
          (f) => f.ownerUserId.localUserId.sqlEquals(
            $_itemColumn<String>('local_user_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _puzzleProgressesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GameHistoriesTable, List<GameHistory>>
  _gameHistoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.gameHistories,
    aliasName: $_aliasNameGenerator(
      db.users.localUserId,
      db.gameHistories.ownerUserId,
    ),
  );

  $$GameHistoriesTableProcessedTableManager get gameHistoriesRefs {
    final manager = $$GameHistoriesTableTableManager($_db, $_db.gameHistories)
        .filter(
          (f) => f.ownerUserId.localUserId.sqlEquals(
            $_itemColumn<String>('local_user_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_gameHistoriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SavedAiGameSessionsTable,
    List<SavedAiGameSession>
  >
  _savedAiGameSessionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.savedAiGameSessions,
        aliasName: $_aliasNameGenerator(
          db.users.localUserId,
          db.savedAiGameSessions.ownerUserId,
        ),
      );

  $$SavedAiGameSessionsTableProcessedTableManager get savedAiGameSessionsRefs {
    final manager =
        $$SavedAiGameSessionsTableTableManager(
          $_db,
          $_db.savedAiGameSessions,
        ).filter(
          (f) => f.ownerUserId.localUserId.sqlEquals(
            $_itemColumn<String>('local_user_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _savedAiGameSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AchievementsTable, List<Achievement>>
  _achievementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.achievements,
    aliasName: $_aliasNameGenerator(
      db.users.localUserId,
      db.achievements.ownerUserId,
    ),
  );

  $$AchievementsTableProcessedTableManager get achievementsRefs {
    final manager = $$AchievementsTableTableManager($_db, $_db.achievements)
        .filter(
          (f) => f.ownerUserId.localUserId.sqlEquals(
            $_itemColumn<String>('local_user_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_achievementsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localUserId => $composableBuilder(
    column: $table.localUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteUserId => $composableBuilder(
    column: $table.remoteUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authProvider => $composableBuilder(
    column: $table.authProvider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarId => $composableBuilder(
    column: $table.avatarId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalXp => $composableBuilder(
    column: $table.totalXp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentRating => $composableBuilder(
    column: $table.currentRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> lessonProgressesRefs(
    Expression<bool> Function($$LessonProgressesTableFilterComposer f) f,
  ) {
    final $$LessonProgressesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localUserId,
      referencedTable: $db.lessonProgresses,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonProgressesTableFilterComposer(
            $db: $db,
            $table: $db.lessonProgresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> puzzleProgressesRefs(
    Expression<bool> Function($$PuzzleProgressesTableFilterComposer f) f,
  ) {
    final $$PuzzleProgressesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localUserId,
      referencedTable: $db.puzzleProgresses,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PuzzleProgressesTableFilterComposer(
            $db: $db,
            $table: $db.puzzleProgresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> gameHistoriesRefs(
    Expression<bool> Function($$GameHistoriesTableFilterComposer f) f,
  ) {
    final $$GameHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localUserId,
      referencedTable: $db.gameHistories,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.gameHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> savedAiGameSessionsRefs(
    Expression<bool> Function($$SavedAiGameSessionsTableFilterComposer f) f,
  ) {
    final $$SavedAiGameSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localUserId,
      referencedTable: $db.savedAiGameSessions,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavedAiGameSessionsTableFilterComposer(
            $db: $db,
            $table: $db.savedAiGameSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> achievementsRefs(
    Expression<bool> Function($$AchievementsTableFilterComposer f) f,
  ) {
    final $$AchievementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localUserId,
      referencedTable: $db.achievements,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AchievementsTableFilterComposer(
            $db: $db,
            $table: $db.achievements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localUserId => $composableBuilder(
    column: $table.localUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteUserId => $composableBuilder(
    column: $table.remoteUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authProvider => $composableBuilder(
    column: $table.authProvider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarId => $composableBuilder(
    column: $table.avatarId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalXp => $composableBuilder(
    column: $table.totalXp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentRating => $composableBuilder(
    column: $table.currentRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localUserId => $composableBuilder(
    column: $table.localUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remoteUserId => $composableBuilder(
    column: $table.remoteUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get authProvider => $composableBuilder(
    column: $table.authProvider,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get avatarId =>
      $composableBuilder(column: $table.avatarId, builder: (column) => column);

  GeneratedColumn<int> get totalXp =>
      $composableBuilder(column: $table.totalXp, builder: (column) => column);

  GeneratedColumn<int> get currentRating => $composableBuilder(
    column: $table.currentRating,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> lessonProgressesRefs<T extends Object>(
    Expression<T> Function($$LessonProgressesTableAnnotationComposer a) f,
  ) {
    final $$LessonProgressesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localUserId,
      referencedTable: $db.lessonProgresses,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonProgressesTableAnnotationComposer(
            $db: $db,
            $table: $db.lessonProgresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> puzzleProgressesRefs<T extends Object>(
    Expression<T> Function($$PuzzleProgressesTableAnnotationComposer a) f,
  ) {
    final $$PuzzleProgressesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localUserId,
      referencedTable: $db.puzzleProgresses,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PuzzleProgressesTableAnnotationComposer(
            $db: $db,
            $table: $db.puzzleProgresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> gameHistoriesRefs<T extends Object>(
    Expression<T> Function($$GameHistoriesTableAnnotationComposer a) f,
  ) {
    final $$GameHistoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localUserId,
      referencedTable: $db.gameHistories,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameHistoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.gameHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> savedAiGameSessionsRefs<T extends Object>(
    Expression<T> Function($$SavedAiGameSessionsTableAnnotationComposer a) f,
  ) {
    final $$SavedAiGameSessionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.localUserId,
          referencedTable: $db.savedAiGameSessions,
          getReferencedColumn: (t) => t.ownerUserId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SavedAiGameSessionsTableAnnotationComposer(
                $db: $db,
                $table: $db.savedAiGameSessions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> achievementsRefs<T extends Object>(
    Expression<T> Function($$AchievementsTableAnnotationComposer a) f,
  ) {
    final $$AchievementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.localUserId,
      referencedTable: $db.achievements,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AchievementsTableAnnotationComposer(
            $db: $db,
            $table: $db.achievements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool lessonProgressesRefs,
            bool puzzleProgressesRefs,
            bool gameHistoriesRefs,
            bool savedAiGameSessionsRefs,
            bool achievementsRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> localUserId = const Value.absent(),
                Value<String?> remoteUserId = const Value.absent(),
                Value<String?> authProvider = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> avatarId = const Value.absent(),
                Value<int> totalXp = const Value.absent(),
                Value<int> currentRating = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                localUserId: localUserId,
                remoteUserId: remoteUserId,
                authProvider: authProvider,
                name: name,
                avatarId: avatarId,
                totalXp: totalXp,
                currentRating: currentRating,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localUserId,
                Value<String?> remoteUserId = const Value.absent(),
                Value<String?> authProvider = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> avatarId = const Value.absent(),
                Value<int> totalXp = const Value.absent(),
                Value<int> currentRating = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                localUserId: localUserId,
                remoteUserId: remoteUserId,
                authProvider: authProvider,
                name: name,
                avatarId: avatarId,
                totalXp: totalXp,
                currentRating: currentRating,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                lessonProgressesRefs = false,
                puzzleProgressesRefs = false,
                gameHistoriesRefs = false,
                savedAiGameSessionsRefs = false,
                achievementsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (lessonProgressesRefs) db.lessonProgresses,
                    if (puzzleProgressesRefs) db.puzzleProgresses,
                    if (gameHistoriesRefs) db.gameHistories,
                    if (savedAiGameSessionsRefs) db.savedAiGameSessions,
                    if (achievementsRefs) db.achievements,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (lessonProgressesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          LessonProgressesData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._lessonProgressesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).lessonProgressesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.localUserId,
                              ),
                          typedResults: items,
                        ),
                      if (puzzleProgressesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          PuzzleProgressesData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._puzzleProgressesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).puzzleProgressesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.localUserId,
                              ),
                          typedResults: items,
                        ),
                      if (gameHistoriesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          GameHistory
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._gameHistoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).gameHistoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.localUserId,
                              ),
                          typedResults: items,
                        ),
                      if (savedAiGameSessionsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          SavedAiGameSession
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._savedAiGameSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).savedAiGameSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.localUserId,
                              ),
                          typedResults: items,
                        ),
                      if (achievementsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          Achievement
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._achievementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).achievementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.localUserId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool lessonProgressesRefs,
        bool puzzleProgressesRefs,
        bool gameHistoriesRefs,
        bool savedAiGameSessionsRefs,
        bool achievementsRefs,
      })
    >;
typedef $$LessonProgressesTableCreateCompanionBuilder =
    LessonProgressesCompanion Function({
      required String ownerUserId,
      required String lessonId,
      Value<int> currentStepIndex,
      Value<bool> isCompleted,
      Value<int> starsEarned,
      Value<DateTime?> completedAt,
      Value<int> attempts,
      required DateTime updatedAt,
      Value<String> syncState,
      Value<int> rowid,
    });
typedef $$LessonProgressesTableUpdateCompanionBuilder =
    LessonProgressesCompanion Function({
      Value<String> ownerUserId,
      Value<String> lessonId,
      Value<int> currentStepIndex,
      Value<bool> isCompleted,
      Value<int> starsEarned,
      Value<DateTime?> completedAt,
      Value<int> attempts,
      Value<DateTime> updatedAt,
      Value<String> syncState,
      Value<int> rowid,
    });

final class $$LessonProgressesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $LessonProgressesTable,
          LessonProgressesData
        > {
  $$LessonProgressesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(
          db.lessonProgresses.ownerUserId,
          db.users.localUserId,
        ),
      );

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.localUserId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LessonProgressesTableFilterComposer
    extends Composer<_$AppDatabase, $LessonProgressesTable> {
  $$LessonProgressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentStepIndex => $composableBuilder(
    column: $table.currentStepIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get starsEarned => $composableBuilder(
    column: $table.starsEarned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonProgressesTableOrderingComposer
    extends Composer<_$AppDatabase, $LessonProgressesTable> {
  $$LessonProgressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentStepIndex => $composableBuilder(
    column: $table.currentStepIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get starsEarned => $composableBuilder(
    column: $table.starsEarned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonProgressesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LessonProgressesTable> {
  $$LessonProgressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get lessonId =>
      $composableBuilder(column: $table.lessonId, builder: (column) => column);

  GeneratedColumn<int> get currentStepIndex => $composableBuilder(
    column: $table.currentStepIndex,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get starsEarned => $composableBuilder(
    column: $table.starsEarned,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonProgressesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LessonProgressesTable,
          LessonProgressesData,
          $$LessonProgressesTableFilterComposer,
          $$LessonProgressesTableOrderingComposer,
          $$LessonProgressesTableAnnotationComposer,
          $$LessonProgressesTableCreateCompanionBuilder,
          $$LessonProgressesTableUpdateCompanionBuilder,
          (LessonProgressesData, $$LessonProgressesTableReferences),
          LessonProgressesData,
          PrefetchHooks Function({bool ownerUserId})
        > {
  $$LessonProgressesTableTableManager(
    _$AppDatabase db,
    $LessonProgressesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonProgressesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonProgressesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LessonProgressesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> ownerUserId = const Value.absent(),
                Value<String> lessonId = const Value.absent(),
                Value<int> currentStepIndex = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<int> starsEarned = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonProgressesCompanion(
                ownerUserId: ownerUserId,
                lessonId: lessonId,
                currentStepIndex: currentStepIndex,
                isCompleted: isCompleted,
                starsEarned: starsEarned,
                completedAt: completedAt,
                attempts: attempts,
                updatedAt: updatedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String ownerUserId,
                required String lessonId,
                Value<int> currentStepIndex = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<int> starsEarned = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                required DateTime updatedAt,
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonProgressesCompanion.insert(
                ownerUserId: ownerUserId,
                lessonId: lessonId,
                currentStepIndex: currentStepIndex,
                isCompleted: isCompleted,
                starsEarned: starsEarned,
                completedAt: completedAt,
                attempts: attempts,
                updatedAt: updatedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LessonProgressesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ownerUserId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ownerUserId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ownerUserId,
                                referencedTable:
                                    $$LessonProgressesTableReferences
                                        ._ownerUserIdTable(db),
                                referencedColumn:
                                    $$LessonProgressesTableReferences
                                        ._ownerUserIdTable(db)
                                        .localUserId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LessonProgressesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LessonProgressesTable,
      LessonProgressesData,
      $$LessonProgressesTableFilterComposer,
      $$LessonProgressesTableOrderingComposer,
      $$LessonProgressesTableAnnotationComposer,
      $$LessonProgressesTableCreateCompanionBuilder,
      $$LessonProgressesTableUpdateCompanionBuilder,
      (LessonProgressesData, $$LessonProgressesTableReferences),
      LessonProgressesData,
      PrefetchHooks Function({bool ownerUserId})
    >;
typedef $$PuzzleProgressesTableCreateCompanionBuilder =
    PuzzleProgressesCompanion Function({
      required String ownerUserId,
      required String puzzleId,
      required String packId,
      Value<bool> isSolved,
      Value<int?> bestTimeMs,
      Value<int> hintsUsed,
      Value<int> attempts,
      Value<DateTime?> solvedAt,
      required DateTime updatedAt,
      Value<String> syncState,
      Value<int> rowid,
    });
typedef $$PuzzleProgressesTableUpdateCompanionBuilder =
    PuzzleProgressesCompanion Function({
      Value<String> ownerUserId,
      Value<String> puzzleId,
      Value<String> packId,
      Value<bool> isSolved,
      Value<int?> bestTimeMs,
      Value<int> hintsUsed,
      Value<int> attempts,
      Value<DateTime?> solvedAt,
      Value<DateTime> updatedAt,
      Value<String> syncState,
      Value<int> rowid,
    });

final class $$PuzzleProgressesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PuzzleProgressesTable,
          PuzzleProgressesData
        > {
  $$PuzzleProgressesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(
          db.puzzleProgresses.ownerUserId,
          db.users.localUserId,
        ),
      );

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.localUserId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PuzzleProgressesTableFilterComposer
    extends Composer<_$AppDatabase, $PuzzleProgressesTable> {
  $$PuzzleProgressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get puzzleId => $composableBuilder(
    column: $table.puzzleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get packId => $composableBuilder(
    column: $table.packId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSolved => $composableBuilder(
    column: $table.isSolved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bestTimeMs => $composableBuilder(
    column: $table.bestTimeMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hintsUsed => $composableBuilder(
    column: $table.hintsUsed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get solvedAt => $composableBuilder(
    column: $table.solvedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuzzleProgressesTableOrderingComposer
    extends Composer<_$AppDatabase, $PuzzleProgressesTable> {
  $$PuzzleProgressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get puzzleId => $composableBuilder(
    column: $table.puzzleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get packId => $composableBuilder(
    column: $table.packId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSolved => $composableBuilder(
    column: $table.isSolved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bestTimeMs => $composableBuilder(
    column: $table.bestTimeMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hintsUsed => $composableBuilder(
    column: $table.hintsUsed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get solvedAt => $composableBuilder(
    column: $table.solvedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuzzleProgressesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PuzzleProgressesTable> {
  $$PuzzleProgressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get puzzleId =>
      $composableBuilder(column: $table.puzzleId, builder: (column) => column);

  GeneratedColumn<String> get packId =>
      $composableBuilder(column: $table.packId, builder: (column) => column);

  GeneratedColumn<bool> get isSolved =>
      $composableBuilder(column: $table.isSolved, builder: (column) => column);

  GeneratedColumn<int> get bestTimeMs => $composableBuilder(
    column: $table.bestTimeMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hintsUsed =>
      $composableBuilder(column: $table.hintsUsed, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<DateTime> get solvedAt =>
      $composableBuilder(column: $table.solvedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuzzleProgressesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PuzzleProgressesTable,
          PuzzleProgressesData,
          $$PuzzleProgressesTableFilterComposer,
          $$PuzzleProgressesTableOrderingComposer,
          $$PuzzleProgressesTableAnnotationComposer,
          $$PuzzleProgressesTableCreateCompanionBuilder,
          $$PuzzleProgressesTableUpdateCompanionBuilder,
          (PuzzleProgressesData, $$PuzzleProgressesTableReferences),
          PuzzleProgressesData,
          PrefetchHooks Function({bool ownerUserId})
        > {
  $$PuzzleProgressesTableTableManager(
    _$AppDatabase db,
    $PuzzleProgressesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PuzzleProgressesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PuzzleProgressesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PuzzleProgressesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> ownerUserId = const Value.absent(),
                Value<String> puzzleId = const Value.absent(),
                Value<String> packId = const Value.absent(),
                Value<bool> isSolved = const Value.absent(),
                Value<int?> bestTimeMs = const Value.absent(),
                Value<int> hintsUsed = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime?> solvedAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PuzzleProgressesCompanion(
                ownerUserId: ownerUserId,
                puzzleId: puzzleId,
                packId: packId,
                isSolved: isSolved,
                bestTimeMs: bestTimeMs,
                hintsUsed: hintsUsed,
                attempts: attempts,
                solvedAt: solvedAt,
                updatedAt: updatedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String ownerUserId,
                required String puzzleId,
                required String packId,
                Value<bool> isSolved = const Value.absent(),
                Value<int?> bestTimeMs = const Value.absent(),
                Value<int> hintsUsed = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime?> solvedAt = const Value.absent(),
                required DateTime updatedAt,
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PuzzleProgressesCompanion.insert(
                ownerUserId: ownerUserId,
                puzzleId: puzzleId,
                packId: packId,
                isSolved: isSolved,
                bestTimeMs: bestTimeMs,
                hintsUsed: hintsUsed,
                attempts: attempts,
                solvedAt: solvedAt,
                updatedAt: updatedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PuzzleProgressesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ownerUserId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ownerUserId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ownerUserId,
                                referencedTable:
                                    $$PuzzleProgressesTableReferences
                                        ._ownerUserIdTable(db),
                                referencedColumn:
                                    $$PuzzleProgressesTableReferences
                                        ._ownerUserIdTable(db)
                                        .localUserId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PuzzleProgressesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PuzzleProgressesTable,
      PuzzleProgressesData,
      $$PuzzleProgressesTableFilterComposer,
      $$PuzzleProgressesTableOrderingComposer,
      $$PuzzleProgressesTableAnnotationComposer,
      $$PuzzleProgressesTableCreateCompanionBuilder,
      $$PuzzleProgressesTableUpdateCompanionBuilder,
      (PuzzleProgressesData, $$PuzzleProgressesTableReferences),
      PuzzleProgressesData,
      PrefetchHooks Function({bool ownerUserId})
    >;
typedef $$GameHistoriesTableCreateCompanionBuilder =
    GameHistoriesCompanion Function({
      Value<int> id,
      required String ownerUserId,
      required String pgn,
      required String opponentType,
      Value<String?> opponentName,
      required String result,
      Value<DateTime> playedAt,
      Value<int?> durationSeconds,
      Value<int?> moveCount,
      required DateTime updatedAt,
      Value<String> syncState,
    });
typedef $$GameHistoriesTableUpdateCompanionBuilder =
    GameHistoriesCompanion Function({
      Value<int> id,
      Value<String> ownerUserId,
      Value<String> pgn,
      Value<String> opponentType,
      Value<String?> opponentName,
      Value<String> result,
      Value<DateTime> playedAt,
      Value<int?> durationSeconds,
      Value<int?> moveCount,
      Value<DateTime> updatedAt,
      Value<String> syncState,
    });

final class $$GameHistoriesTableReferences
    extends BaseReferences<_$AppDatabase, $GameHistoriesTable, GameHistory> {
  $$GameHistoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(
          db.gameHistories.ownerUserId,
          db.users.localUserId,
        ),
      );

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.localUserId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GameHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $GameHistoriesTable> {
  $$GameHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pgn => $composableBuilder(
    column: $table.pgn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get opponentType => $composableBuilder(
    column: $table.opponentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get opponentName => $composableBuilder(
    column: $table.opponentName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get playedAt => $composableBuilder(
    column: $table.playedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get moveCount => $composableBuilder(
    column: $table.moveCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $GameHistoriesTable> {
  $$GameHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pgn => $composableBuilder(
    column: $table.pgn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get opponentType => $composableBuilder(
    column: $table.opponentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get opponentName => $composableBuilder(
    column: $table.opponentName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get playedAt => $composableBuilder(
    column: $table.playedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moveCount => $composableBuilder(
    column: $table.moveCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameHistoriesTable> {
  $$GameHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pgn =>
      $composableBuilder(column: $table.pgn, builder: (column) => column);

  GeneratedColumn<String> get opponentType => $composableBuilder(
    column: $table.opponentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get opponentName => $composableBuilder(
    column: $table.opponentName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<DateTime> get playedAt =>
      $composableBuilder(column: $table.playedAt, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get moveCount =>
      $composableBuilder(column: $table.moveCount, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameHistoriesTable,
          GameHistory,
          $$GameHistoriesTableFilterComposer,
          $$GameHistoriesTableOrderingComposer,
          $$GameHistoriesTableAnnotationComposer,
          $$GameHistoriesTableCreateCompanionBuilder,
          $$GameHistoriesTableUpdateCompanionBuilder,
          (GameHistory, $$GameHistoriesTableReferences),
          GameHistory,
          PrefetchHooks Function({bool ownerUserId})
        > {
  $$GameHistoriesTableTableManager(_$AppDatabase db, $GameHistoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameHistoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameHistoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<String> pgn = const Value.absent(),
                Value<String> opponentType = const Value.absent(),
                Value<String?> opponentName = const Value.absent(),
                Value<String> result = const Value.absent(),
                Value<DateTime> playedAt = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<int?> moveCount = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncState = const Value.absent(),
              }) => GameHistoriesCompanion(
                id: id,
                ownerUserId: ownerUserId,
                pgn: pgn,
                opponentType: opponentType,
                opponentName: opponentName,
                result: result,
                playedAt: playedAt,
                durationSeconds: durationSeconds,
                moveCount: moveCount,
                updatedAt: updatedAt,
                syncState: syncState,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String ownerUserId,
                required String pgn,
                required String opponentType,
                Value<String?> opponentName = const Value.absent(),
                required String result,
                Value<DateTime> playedAt = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<int?> moveCount = const Value.absent(),
                required DateTime updatedAt,
                Value<String> syncState = const Value.absent(),
              }) => GameHistoriesCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                pgn: pgn,
                opponentType: opponentType,
                opponentName: opponentName,
                result: result,
                playedAt: playedAt,
                durationSeconds: durationSeconds,
                moveCount: moveCount,
                updatedAt: updatedAt,
                syncState: syncState,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GameHistoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ownerUserId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ownerUserId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ownerUserId,
                                referencedTable: $$GameHistoriesTableReferences
                                    ._ownerUserIdTable(db),
                                referencedColumn: $$GameHistoriesTableReferences
                                    ._ownerUserIdTable(db)
                                    .localUserId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GameHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameHistoriesTable,
      GameHistory,
      $$GameHistoriesTableFilterComposer,
      $$GameHistoriesTableOrderingComposer,
      $$GameHistoriesTableAnnotationComposer,
      $$GameHistoriesTableCreateCompanionBuilder,
      $$GameHistoriesTableUpdateCompanionBuilder,
      (GameHistory, $$GameHistoriesTableReferences),
      GameHistory,
      PrefetchHooks Function({bool ownerUserId})
    >;
typedef $$SavedAiGameSessionsTableCreateCompanionBuilder =
    SavedAiGameSessionsCompanion Function({
      Value<int> id,
      required String ownerUserId,
      required int skillLevel,
      Value<String> movesUciJson,
      Value<DateTime> createdAt,
      required DateTime updatedAt,
      Value<String> syncState,
    });
typedef $$SavedAiGameSessionsTableUpdateCompanionBuilder =
    SavedAiGameSessionsCompanion Function({
      Value<int> id,
      Value<String> ownerUserId,
      Value<int> skillLevel,
      Value<String> movesUciJson,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> syncState,
    });

final class $$SavedAiGameSessionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SavedAiGameSessionsTable,
          SavedAiGameSession
        > {
  $$SavedAiGameSessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(
          db.savedAiGameSessions.ownerUserId,
          db.users.localUserId,
        ),
      );

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.localUserId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SavedAiGameSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SavedAiGameSessionsTable> {
  $$SavedAiGameSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get skillLevel => $composableBuilder(
    column: $table.skillLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get movesUciJson => $composableBuilder(
    column: $table.movesUciJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavedAiGameSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavedAiGameSessionsTable> {
  $$SavedAiGameSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get skillLevel => $composableBuilder(
    column: $table.skillLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get movesUciJson => $composableBuilder(
    column: $table.movesUciJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavedAiGameSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavedAiGameSessionsTable> {
  $$SavedAiGameSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get skillLevel => $composableBuilder(
    column: $table.skillLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get movesUciJson => $composableBuilder(
    column: $table.movesUciJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavedAiGameSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavedAiGameSessionsTable,
          SavedAiGameSession,
          $$SavedAiGameSessionsTableFilterComposer,
          $$SavedAiGameSessionsTableOrderingComposer,
          $$SavedAiGameSessionsTableAnnotationComposer,
          $$SavedAiGameSessionsTableCreateCompanionBuilder,
          $$SavedAiGameSessionsTableUpdateCompanionBuilder,
          (SavedAiGameSession, $$SavedAiGameSessionsTableReferences),
          SavedAiGameSession,
          PrefetchHooks Function({bool ownerUserId})
        > {
  $$SavedAiGameSessionsTableTableManager(
    _$AppDatabase db,
    $SavedAiGameSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedAiGameSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedAiGameSessionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SavedAiGameSessionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<int> skillLevel = const Value.absent(),
                Value<String> movesUciJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncState = const Value.absent(),
              }) => SavedAiGameSessionsCompanion(
                id: id,
                ownerUserId: ownerUserId,
                skillLevel: skillLevel,
                movesUciJson: movesUciJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncState: syncState,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String ownerUserId,
                required int skillLevel,
                Value<String> movesUciJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required DateTime updatedAt,
                Value<String> syncState = const Value.absent(),
              }) => SavedAiGameSessionsCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                skillLevel: skillLevel,
                movesUciJson: movesUciJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncState: syncState,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SavedAiGameSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ownerUserId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ownerUserId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ownerUserId,
                                referencedTable:
                                    $$SavedAiGameSessionsTableReferences
                                        ._ownerUserIdTable(db),
                                referencedColumn:
                                    $$SavedAiGameSessionsTableReferences
                                        ._ownerUserIdTable(db)
                                        .localUserId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SavedAiGameSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavedAiGameSessionsTable,
      SavedAiGameSession,
      $$SavedAiGameSessionsTableFilterComposer,
      $$SavedAiGameSessionsTableOrderingComposer,
      $$SavedAiGameSessionsTableAnnotationComposer,
      $$SavedAiGameSessionsTableCreateCompanionBuilder,
      $$SavedAiGameSessionsTableUpdateCompanionBuilder,
      (SavedAiGameSession, $$SavedAiGameSessionsTableReferences),
      SavedAiGameSession,
      PrefetchHooks Function({bool ownerUserId})
    >;
typedef $$AchievementsTableCreateCompanionBuilder =
    AchievementsCompanion Function({
      required String id,
      required String ownerUserId,
      Value<DateTime?> unlockedAt,
      Value<int> progress,
      required int target,
      required DateTime updatedAt,
      Value<String> syncState,
      Value<int> rowid,
    });
typedef $$AchievementsTableUpdateCompanionBuilder =
    AchievementsCompanion Function({
      Value<String> id,
      Value<String> ownerUserId,
      Value<DateTime?> unlockedAt,
      Value<int> progress,
      Value<int> target,
      Value<DateTime> updatedAt,
      Value<String> syncState,
      Value<int> rowid,
    });

final class $$AchievementsTableReferences
    extends BaseReferences<_$AppDatabase, $AchievementsTable, Achievement> {
  $$AchievementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(db.achievements.ownerUserId, db.users.localUserId),
      );

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.localUserId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AchievementsTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AchievementsTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AchievementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<int> get target =>
      $composableBuilder(column: $table.target, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.localUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AchievementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AchievementsTable,
          Achievement,
          $$AchievementsTableFilterComposer,
          $$AchievementsTableOrderingComposer,
          $$AchievementsTableAnnotationComposer,
          $$AchievementsTableCreateCompanionBuilder,
          $$AchievementsTableUpdateCompanionBuilder,
          (Achievement, $$AchievementsTableReferences),
          Achievement,
          PrefetchHooks Function({bool ownerUserId})
        > {
  $$AchievementsTableTableManager(_$AppDatabase db, $AchievementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<DateTime?> unlockedAt = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<int> target = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AchievementsCompanion(
                id: id,
                ownerUserId: ownerUserId,
                unlockedAt: unlockedAt,
                progress: progress,
                target: target,
                updatedAt: updatedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerUserId,
                Value<DateTime?> unlockedAt = const Value.absent(),
                Value<int> progress = const Value.absent(),
                required int target,
                required DateTime updatedAt,
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AchievementsCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                unlockedAt: unlockedAt,
                progress: progress,
                target: target,
                updatedAt: updatedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AchievementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ownerUserId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ownerUserId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ownerUserId,
                                referencedTable: $$AchievementsTableReferences
                                    ._ownerUserIdTable(db),
                                referencedColumn: $$AchievementsTableReferences
                                    ._ownerUserIdTable(db)
                                    .localUserId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AchievementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AchievementsTable,
      Achievement,
      $$AchievementsTableFilterComposer,
      $$AchievementsTableOrderingComposer,
      $$AchievementsTableAnnotationComposer,
      $$AchievementsTableCreateCompanionBuilder,
      $$AchievementsTableUpdateCompanionBuilder,
      (Achievement, $$AchievementsTableReferences),
      Achievement,
      PrefetchHooks Function({bool ownerUserId})
    >;
typedef $$ContentVersionsTableCreateCompanionBuilder =
    ContentVersionsCompanion Function({
      required String contentId,
      required String contentType,
      required int version,
      Value<DateTime> installedAt,
      Value<int> rowid,
    });
typedef $$ContentVersionsTableUpdateCompanionBuilder =
    ContentVersionsCompanion Function({
      Value<String> contentId,
      Value<String> contentType,
      Value<int> version,
      Value<DateTime> installedAt,
      Value<int> rowid,
    });

class $$ContentVersionsTableFilterComposer
    extends Composer<_$AppDatabase, $ContentVersionsTable> {
  $$ContentVersionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get contentId => $composableBuilder(
    column: $table.contentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ContentVersionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ContentVersionsTable> {
  $$ContentVersionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get contentId => $composableBuilder(
    column: $table.contentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContentVersionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContentVersionsTable> {
  $$ContentVersionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get contentId =>
      $composableBuilder(column: $table.contentId, builder: (column) => column);

  GeneratedColumn<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => column,
  );
}

class $$ContentVersionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContentVersionsTable,
          ContentVersion,
          $$ContentVersionsTableFilterComposer,
          $$ContentVersionsTableOrderingComposer,
          $$ContentVersionsTableAnnotationComposer,
          $$ContentVersionsTableCreateCompanionBuilder,
          $$ContentVersionsTableUpdateCompanionBuilder,
          (
            ContentVersion,
            BaseReferences<
              _$AppDatabase,
              $ContentVersionsTable,
              ContentVersion
            >,
          ),
          ContentVersion,
          PrefetchHooks Function()
        > {
  $$ContentVersionsTableTableManager(
    _$AppDatabase db,
    $ContentVersionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContentVersionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContentVersionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContentVersionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> contentId = const Value.absent(),
                Value<String> contentType = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<DateTime> installedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContentVersionsCompanion(
                contentId: contentId,
                contentType: contentType,
                version: version,
                installedAt: installedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String contentId,
                required String contentType,
                required int version,
                Value<DateTime> installedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContentVersionsCompanion.insert(
                contentId: contentId,
                contentType: contentType,
                version: version,
                installedAt: installedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ContentVersionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContentVersionsTable,
      ContentVersion,
      $$ContentVersionsTableFilterComposer,
      $$ContentVersionsTableOrderingComposer,
      $$ContentVersionsTableAnnotationComposer,
      $$ContentVersionsTableCreateCompanionBuilder,
      $$ContentVersionsTableUpdateCompanionBuilder,
      (
        ContentVersion,
        BaseReferences<_$AppDatabase, $ContentVersionsTable, ContentVersion>,
      ),
      ContentVersion,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$LessonProgressesTableTableManager get lessonProgresses =>
      $$LessonProgressesTableTableManager(_db, _db.lessonProgresses);
  $$PuzzleProgressesTableTableManager get puzzleProgresses =>
      $$PuzzleProgressesTableTableManager(_db, _db.puzzleProgresses);
  $$GameHistoriesTableTableManager get gameHistories =>
      $$GameHistoriesTableTableManager(_db, _db.gameHistories);
  $$SavedAiGameSessionsTableTableManager get savedAiGameSessions =>
      $$SavedAiGameSessionsTableTableManager(_db, _db.savedAiGameSessions);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db, _db.achievements);
  $$ContentVersionsTableTableManager get contentVersions =>
      $$ContentVersionsTableTableManager(_db, _db.contentVersions);
}
