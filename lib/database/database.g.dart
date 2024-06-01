// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $HabitTableTable extends HabitTable
    with TableInfo<$HabitTableTable, HabitModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $HabitTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumnWithTypeConverter<Difficulty, int> difficulty =
      GeneratedColumn<int>('difficulty', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Difficulty>($HabitTableTable.$converterdifficulty);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<Category, int> category =
      GeneratedColumn<int>('category', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Category>($HabitTableTable.$convertercategory);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<HabitType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<HabitType>($HabitTableTable.$convertertype);
  static const VerificationMeta _finishedCountMeta =
      const VerificationMeta('finishedCount');
  @override
  late final GeneratedColumn<int> finishedCount = GeneratedColumn<int>(
      'finished_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastFinishedAtMeta =
      const VerificationMeta('lastFinishedAt');
  @override
  late final GeneratedColumn<DateTime> lastFinishedAt =
      GeneratedColumn<DateTime>('last_finished_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [
        id,
        order,
        title,
        description,
        difficulty,
        category,
        type,
        finishedCount,
        lastFinishedAt,
        createdAt
      ];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'habit_table';

  @override
  VerificationContext validateIntegrity(Insertable<HabitModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_difficultyMeta, const VerificationResult.success());
    context.handle(_categoryMeta, const VerificationResult.success());
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('finished_count')) {
      context.handle(
          _finishedCountMeta,
          finishedCount.isAcceptableOrUnknown(
              data['finished_count']!, _finishedCountMeta));
    } else if (isInserting) {
      context.missing(_finishedCountMeta);
    }
    if (data.containsKey('last_finished_at')) {
      context.handle(
          _lastFinishedAtMeta,
          lastFinishedAt.isAcceptableOrUnknown(
              data['last_finished_at']!, _lastFinishedAtMeta));
    } else if (isInserting) {
      context.missing(_lastFinishedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  HabitModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      difficulty: $HabitTableTable.$converterdifficulty.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}difficulty'])!),
      category: $HabitTableTable.$convertercategory.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!),
      type: $HabitTableTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      finishedCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}finished_count'])!,
      lastFinishedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_finished_at'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $HabitTableTable createAlias(String alias) {
    return $HabitTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Difficulty, int, int> $converterdifficulty =
      const EnumIndexConverter<Difficulty>(Difficulty.values);
  static JsonTypeConverter2<Category, int, int> $convertercategory =
      const EnumIndexConverter<Category>(Category.values);
  static JsonTypeConverter2<HabitType, int, int> $convertertype =
      const EnumIndexConverter<HabitType>(HabitType.values);
}

class HabitModel extends DataClass implements Insertable<HabitModel> {
  final int id;
  final int order;
  final String title;
  final String description;
  final Difficulty difficulty;
  final Category category;
  final HabitType type;
  final int finishedCount;
  final DateTime lastFinishedAt;
  final DateTime createdAt;

  const HabitModel(
      {required this.id,
      required this.order,
      required this.title,
      required this.description,
      required this.difficulty,
      required this.category,
      required this.type,
      required this.finishedCount,
      required this.lastFinishedAt,
      required this.createdAt});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order'] = Variable<int>(order);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    {
      map['difficulty'] = Variable<int>(
          $HabitTableTable.$converterdifficulty.toSql(difficulty));
    }
    {
      map['category'] =
          Variable<int>($HabitTableTable.$convertercategory.toSql(category));
    }
    {
      map['type'] = Variable<int>($HabitTableTable.$convertertype.toSql(type));
    }
    map['finished_count'] = Variable<int>(finishedCount);
    map['last_finished_at'] = Variable<DateTime>(lastFinishedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HabitTableCompanion toCompanion(bool nullToAbsent) {
    return HabitTableCompanion(
      id: Value(id),
      order: Value(order),
      title: Value(title),
      description: Value(description),
      difficulty: Value(difficulty),
      category: Value(category),
      type: Value(type),
      finishedCount: Value(finishedCount),
      lastFinishedAt: Value(lastFinishedAt),
      createdAt: Value(createdAt),
    );
  }

  factory HabitModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitModel(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<int>(json['order']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      difficulty: $HabitTableTable.$converterdifficulty
          .fromJson(serializer.fromJson<int>(json['difficulty'])),
      category: $HabitTableTable.$convertercategory
          .fromJson(serializer.fromJson<int>(json['category'])),
      type: $HabitTableTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      finishedCount: serializer.fromJson<int>(json['finishedCount']),
      lastFinishedAt: serializer.fromJson<DateTime>(json['lastFinishedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<int>(order),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'difficulty': serializer.toJson<int>(
          $HabitTableTable.$converterdifficulty.toJson(difficulty)),
      'category': serializer
          .toJson<int>($HabitTableTable.$convertercategory.toJson(category)),
      'type':
          serializer.toJson<int>($HabitTableTable.$convertertype.toJson(type)),
      'finishedCount': serializer.toJson<int>(finishedCount),
      'lastFinishedAt': serializer.toJson<DateTime>(lastFinishedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HabitModel copyWith(
          {int? id,
          int? order,
          String? title,
          String? description,
          Difficulty? difficulty,
          Category? category,
          HabitType? type,
          int? finishedCount,
          DateTime? lastFinishedAt,
          DateTime? createdAt}) =>
      HabitModel(
        id: id ?? this.id,
        order: order ?? this.order,
        title: title ?? this.title,
        description: description ?? this.description,
        difficulty: difficulty ?? this.difficulty,
        category: category ?? this.category,
        type: type ?? this.type,
        finishedCount: finishedCount ?? this.finishedCount,
        lastFinishedAt: lastFinishedAt ?? this.lastFinishedAt,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  String toString() {
    return (StringBuffer('HabitModel(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('difficulty: $difficulty, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('finishedCount: $finishedCount, ')
          ..write('lastFinishedAt: $lastFinishedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, order, title, description, difficulty,
      category, type, finishedCount, lastFinishedAt, createdAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitModel &&
          other.id == this.id &&
          other.order == this.order &&
          other.title == this.title &&
          other.description == this.description &&
          other.difficulty == this.difficulty &&
          other.category == this.category &&
          other.type == this.type &&
          other.finishedCount == this.finishedCount &&
          other.lastFinishedAt == this.lastFinishedAt &&
          other.createdAt == this.createdAt);
}

class HabitTableCompanion extends UpdateCompanion<HabitModel> {
  final Value<int> id;
  final Value<int> order;
  final Value<String> title;
  final Value<String> description;
  final Value<Difficulty> difficulty;
  final Value<Category> category;
  final Value<HabitType> type;
  final Value<int> finishedCount;
  final Value<DateTime> lastFinishedAt;
  final Value<DateTime> createdAt;

  const HabitTableCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.category = const Value.absent(),
    this.type = const Value.absent(),
    this.finishedCount = const Value.absent(),
    this.lastFinishedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });

  HabitTableCompanion.insert({
    this.id = const Value.absent(),
    required int order,
    required String title,
    required String description,
    required Difficulty difficulty,
    required Category category,
    required HabitType type,
    required int finishedCount,
    required DateTime lastFinishedAt,
    required DateTime createdAt,
  })  : order = Value(order),
        title = Value(title),
        description = Value(description),
        difficulty = Value(difficulty),
        category = Value(category),
        type = Value(type),
        finishedCount = Value(finishedCount),
        lastFinishedAt = Value(lastFinishedAt),
        createdAt = Value(createdAt);

  static Insertable<HabitModel> custom({
    Expression<int>? id,
    Expression<int>? order,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? difficulty,
    Expression<int>? category,
    Expression<int>? type,
    Expression<int>? finishedCount,
    Expression<DateTime>? lastFinishedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (difficulty != null) 'difficulty': difficulty,
      if (category != null) 'category': category,
      if (type != null) 'type': type,
      if (finishedCount != null) 'finished_count': finishedCount,
      if (lastFinishedAt != null) 'last_finished_at': lastFinishedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HabitTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? order,
      Value<String>? title,
      Value<String>? description,
      Value<Difficulty>? difficulty,
      Value<Category>? category,
      Value<HabitType>? type,
      Value<int>? finishedCount,
      Value<DateTime>? lastFinishedAt,
      Value<DateTime>? createdAt}) {
    return HabitTableCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
      title: title ?? this.title,
      description: description ?? this.description,
      difficulty: difficulty ?? this.difficulty,
      category: category ?? this.category,
      type: type ?? this.type,
      finishedCount: finishedCount ?? this.finishedCount,
      lastFinishedAt: lastFinishedAt ?? this.lastFinishedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<int>(
          $HabitTableTable.$converterdifficulty.toSql(difficulty.value));
    }
    if (category.present) {
      map['category'] = Variable<int>(
          $HabitTableTable.$convertercategory.toSql(category.value));
    }
    if (type.present) {
      map['type'] =
          Variable<int>($HabitTableTable.$convertertype.toSql(type.value));
    }
    if (finishedCount.present) {
      map['finished_count'] = Variable<int>(finishedCount.value);
    }
    if (lastFinishedAt.present) {
      map['last_finished_at'] = Variable<DateTime>(lastFinishedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitTableCompanion(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('difficulty: $difficulty, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('finishedCount: $finishedCount, ')
          ..write('lastFinishedAt: $lastFinishedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $TaskTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumnWithTypeConverter<Difficulty, int> difficulty =
      GeneratedColumn<int>('difficulty', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Difficulty>($TaskTableTable.$converterdifficulty);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<Category, int> category =
      GeneratedColumn<int>('category', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Category>($TaskTableTable.$convertercategory);
  static const VerificationMeta _repeatTypeMeta =
      const VerificationMeta('repeatType');
  @override
  late final GeneratedColumnWithTypeConverter<RepeatType, int> repeatType =
      GeneratedColumn<int>('repeat_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<RepeatType>($TaskTableTable.$converterrepeatType);
  static const VerificationMeta _repeatValueMeta =
      const VerificationMeta('repeatValue');
  @override
  late final GeneratedColumn<int> repeatValue = GeneratedColumn<int>(
      'repeat_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repeatDaysMeta =
      const VerificationMeta('repeatDays');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String> repeatDays =
      GeneratedColumn<String>('repeat_days', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<int>>($TaskTableTable.$converterrepeatDays);
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _finishedCountMeta =
      const VerificationMeta('finishedCount');
  @override
  late final GeneratedColumn<int> finishedCount = GeneratedColumn<int>(
      'finished_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastFinishedAtMeta =
      const VerificationMeta('lastFinishedAt');
  @override
  late final GeneratedColumn<DateTime> lastFinishedAt =
      GeneratedColumn<DateTime>('last_finished_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [
        id,
        order,
        title,
        description,
        difficulty,
        category,
        repeatType,
        repeatValue,
        repeatDays,
        deadline,
        finishedCount,
        lastFinishedAt,
        createdAt
      ];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'task_table';

  @override
  VerificationContext validateIntegrity(Insertable<TaskModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_difficultyMeta, const VerificationResult.success());
    context.handle(_categoryMeta, const VerificationResult.success());
    context.handle(_repeatTypeMeta, const VerificationResult.success());
    if (data.containsKey('repeat_value')) {
      context.handle(
          _repeatValueMeta,
          repeatValue.isAcceptableOrUnknown(
              data['repeat_value']!, _repeatValueMeta));
    } else if (isInserting) {
      context.missing(_repeatValueMeta);
    }
    context.handle(_repeatDaysMeta, const VerificationResult.success());
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('finished_count')) {
      context.handle(
          _finishedCountMeta,
          finishedCount.isAcceptableOrUnknown(
              data['finished_count']!, _finishedCountMeta));
    } else if (isInserting) {
      context.missing(_finishedCountMeta);
    }
    if (data.containsKey('last_finished_at')) {
      context.handle(
          _lastFinishedAtMeta,
          lastFinishedAt.isAcceptableOrUnknown(
              data['last_finished_at']!, _lastFinishedAtMeta));
    } else if (isInserting) {
      context.missing(_lastFinishedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  TaskModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      difficulty: $TaskTableTable.$converterdifficulty.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}difficulty'])!),
      category: $TaskTableTable.$convertercategory.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!),
      repeatType: $TaskTableTable.$converterrepeatType.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repeat_type'])!),
      repeatValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repeat_value'])!,
      repeatDays: $TaskTableTable.$converterrepeatDays.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}repeat_days'])!),
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline']),
      finishedCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}finished_count'])!,
      lastFinishedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_finished_at'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Difficulty, int, int> $converterdifficulty =
      const EnumIndexConverter<Difficulty>(Difficulty.values);
  static JsonTypeConverter2<Category, int, int> $convertercategory =
      const EnumIndexConverter<Category>(Category.values);
  static JsonTypeConverter2<RepeatType, int, int> $converterrepeatType =
      const EnumIndexConverter<RepeatType>(RepeatType.values);
  static TypeConverter<List<int>, String> $converterrepeatDays =
      repeatDaysConverter;
}

class TaskModel extends DataClass implements Insertable<TaskModel> {
  final int id;
  final int order;
  final String title;
  final String description;
  final Difficulty difficulty;
  final Category category;
  final RepeatType repeatType;
  final int repeatValue;
  final List<int> repeatDays;
  final DateTime? deadline;
  final int finishedCount;
  final DateTime lastFinishedAt;
  final DateTime createdAt;

  const TaskModel(
      {required this.id,
      required this.order,
      required this.title,
      required this.description,
      required this.difficulty,
      required this.category,
      required this.repeatType,
      required this.repeatValue,
      required this.repeatDays,
      this.deadline,
      required this.finishedCount,
      required this.lastFinishedAt,
      required this.createdAt});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order'] = Variable<int>(order);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    {
      map['difficulty'] =
          Variable<int>($TaskTableTable.$converterdifficulty.toSql(difficulty));
    }
    {
      map['category'] =
          Variable<int>($TaskTableTable.$convertercategory.toSql(category));
    }
    {
      map['repeat_type'] =
          Variable<int>($TaskTableTable.$converterrepeatType.toSql(repeatType));
    }
    map['repeat_value'] = Variable<int>(repeatValue);
    {
      map['repeat_days'] = Variable<String>(
          $TaskTableTable.$converterrepeatDays.toSql(repeatDays));
    }
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    map['finished_count'] = Variable<int>(finishedCount);
    map['last_finished_at'] = Variable<DateTime>(lastFinishedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      order: Value(order),
      title: Value(title),
      description: Value(description),
      difficulty: Value(difficulty),
      category: Value(category),
      repeatType: Value(repeatType),
      repeatValue: Value(repeatValue),
      repeatDays: Value(repeatDays),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      finishedCount: Value(finishedCount),
      lastFinishedAt: Value(lastFinishedAt),
      createdAt: Value(createdAt),
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskModel(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<int>(json['order']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      difficulty: $TaskTableTable.$converterdifficulty
          .fromJson(serializer.fromJson<int>(json['difficulty'])),
      category: $TaskTableTable.$convertercategory
          .fromJson(serializer.fromJson<int>(json['category'])),
      repeatType: $TaskTableTable.$converterrepeatType
          .fromJson(serializer.fromJson<int>(json['repeatType'])),
      repeatValue: serializer.fromJson<int>(json['repeatValue']),
      repeatDays: serializer.fromJson<List<int>>(json['repeatDays']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      finishedCount: serializer.fromJson<int>(json['finishedCount']),
      lastFinishedAt: serializer.fromJson<DateTime>(json['lastFinishedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<int>(order),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'difficulty': serializer
          .toJson<int>($TaskTableTable.$converterdifficulty.toJson(difficulty)),
      'category': serializer
          .toJson<int>($TaskTableTable.$convertercategory.toJson(category)),
      'repeatType': serializer
          .toJson<int>($TaskTableTable.$converterrepeatType.toJson(repeatType)),
      'repeatValue': serializer.toJson<int>(repeatValue),
      'repeatDays': serializer.toJson<List<int>>(repeatDays),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'finishedCount': serializer.toJson<int>(finishedCount),
      'lastFinishedAt': serializer.toJson<DateTime>(lastFinishedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TaskModel copyWith(
          {int? id,
          int? order,
          String? title,
          String? description,
          Difficulty? difficulty,
          Category? category,
          RepeatType? repeatType,
          int? repeatValue,
          List<int>? repeatDays,
          Value<DateTime?> deadline = const Value.absent(),
          int? finishedCount,
          DateTime? lastFinishedAt,
          DateTime? createdAt}) =>
      TaskModel(
        id: id ?? this.id,
        order: order ?? this.order,
        title: title ?? this.title,
        description: description ?? this.description,
        difficulty: difficulty ?? this.difficulty,
        category: category ?? this.category,
        repeatType: repeatType ?? this.repeatType,
        repeatValue: repeatValue ?? this.repeatValue,
        repeatDays: repeatDays ?? this.repeatDays,
        deadline: deadline.present ? deadline.value : this.deadline,
        finishedCount: finishedCount ?? this.finishedCount,
        lastFinishedAt: lastFinishedAt ?? this.lastFinishedAt,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  String toString() {
    return (StringBuffer('TaskModel(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('title: $title, ')
          ..write('description: $description, ')..write(
          'difficulty: $difficulty, ')..write('category: $category, ')..write(
          'repeatType: $repeatType, ')..write(
          'repeatValue: $repeatValue, ')..write(
          'repeatDays: $repeatDays, ')..write('deadline: $deadline, ')
          ..write('finishedCount: $finishedCount, ')
          ..write('lastFinishedAt: $lastFinishedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      order,
      title,
      description,
      difficulty,
      category,
      repeatType,
      repeatValue,
      repeatDays,
      deadline,
      finishedCount,
      lastFinishedAt,
      createdAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskModel &&
          other.id == this.id &&
          other.order == this.order &&
          other.title == this.title &&
          other.description == this.description &&
          other.difficulty == this.difficulty &&
          other.category == this.category &&
          other.repeatType == this.repeatType &&
          other.repeatValue == this.repeatValue &&
          other.repeatDays == this.repeatDays &&
          other.deadline == this.deadline &&
          other.finishedCount == this.finishedCount &&
          other.lastFinishedAt == this.lastFinishedAt &&
          other.createdAt == this.createdAt);
}

class TaskTableCompanion extends UpdateCompanion<TaskModel> {
  final Value<int> id;
  final Value<int> order;
  final Value<String> title;
  final Value<String> description;
  final Value<Difficulty> difficulty;
  final Value<Category> category;
  final Value<RepeatType> repeatType;
  final Value<int> repeatValue;
  final Value<List<int>> repeatDays;
  final Value<DateTime?> deadline;
  final Value<int> finishedCount;
  final Value<DateTime> lastFinishedAt;
  final Value<DateTime> createdAt;

  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.category = const Value.absent(),
    this.repeatType = const Value.absent(),
    this.repeatValue = const Value.absent(),
    this.repeatDays = const Value.absent(),
    this.deadline = const Value.absent(),
    this.finishedCount = const Value.absent(),
    this.lastFinishedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });

  TaskTableCompanion.insert({
    this.id = const Value.absent(),
    required int order,
    required String title,
    required String description,
    required Difficulty difficulty,
    required Category category,
    required RepeatType repeatType,
    required int repeatValue,
    required List<int> repeatDays,
    this.deadline = const Value.absent(),
    required int finishedCount,
    required DateTime lastFinishedAt,
    required DateTime createdAt,
  })  : order = Value(order),
        title = Value(title),
        description = Value(description),
        difficulty = Value(difficulty),
        category = Value(category),
        repeatType = Value(repeatType),
        repeatValue = Value(repeatValue),
        repeatDays = Value(repeatDays),
        finishedCount = Value(finishedCount),
        lastFinishedAt = Value(lastFinishedAt),
        createdAt = Value(createdAt);

  static Insertable<TaskModel> custom({
    Expression<int>? id,
    Expression<int>? order,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? difficulty,
    Expression<int>? category,
    Expression<int>? repeatType,
    Expression<int>? repeatValue,
    Expression<String>? repeatDays,
    Expression<DateTime>? deadline,
    Expression<int>? finishedCount,
    Expression<DateTime>? lastFinishedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (difficulty != null) 'difficulty': difficulty,
      if (category != null) 'category': category,
      if (repeatType != null) 'repeat_type': repeatType,
      if (repeatValue != null) 'repeat_value': repeatValue,
      if (repeatDays != null) 'repeat_days': repeatDays,
      if (deadline != null) 'deadline': deadline,
      if (finishedCount != null) 'finished_count': finishedCount,
      if (lastFinishedAt != null) 'last_finished_at': lastFinishedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TaskTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? order,
      Value<String>? title,
      Value<String>? description,
      Value<Difficulty>? difficulty,
      Value<Category>? category,
      Value<RepeatType>? repeatType,
      Value<int>? repeatValue,
      Value<List<int>>? repeatDays,
      Value<DateTime?>? deadline,
      Value<int>? finishedCount,
      Value<DateTime>? lastFinishedAt,
      Value<DateTime>? createdAt}) {
    return TaskTableCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
      title: title ?? this.title,
      description: description ?? this.description,
      difficulty: difficulty ?? this.difficulty,
      category: category ?? this.category,
      repeatType: repeatType ?? this.repeatType,
      repeatValue: repeatValue ?? this.repeatValue,
      repeatDays: repeatDays ?? this.repeatDays,
      deadline: deadline ?? this.deadline,
      finishedCount: finishedCount ?? this.finishedCount,
      lastFinishedAt: lastFinishedAt ?? this.lastFinishedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<int>(
          $TaskTableTable.$converterdifficulty.toSql(difficulty.value));
    }
    if (category.present) {
      map['category'] = Variable<int>(
          $TaskTableTable.$convertercategory.toSql(category.value));
    }
    if (repeatType.present) {
      map['repeat_type'] = Variable<int>(
          $TaskTableTable.$converterrepeatType.toSql(repeatType.value));
    }
    if (repeatValue.present) {
      map['repeat_value'] = Variable<int>(repeatValue.value);
    }
    if (repeatDays.present) {
      map['repeat_days'] = Variable<String>(
          $TaskTableTable.$converterrepeatDays.toSql(repeatDays.value));
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (finishedCount.present) {
      map['finished_count'] = Variable<int>(finishedCount.value);
    }
    if (lastFinishedAt.present) {
      map['last_finished_at'] = Variable<DateTime>(lastFinishedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('title: $title, ')
          ..write('description: $description, ')..write(
          'difficulty: $difficulty, ')..write('category: $category, ')..write(
          'repeatType: $repeatType, ')..write(
          'repeatValue: $repeatValue, ')..write(
          'repeatDays: $repeatDays, ')..write('deadline: $deadline, ')
          ..write('finishedCount: $finishedCount, ')
          ..write('lastFinishedAt: $lastFinishedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $StatusTableTable extends StatusTable
    with TableInfo<$StatusTableTable, StatusModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $StatusTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expMeta = const VerificationMeta('exp');
  @override
  late final GeneratedColumn<int> exp = GeneratedColumn<int>(
      'exp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [id, level, exp];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'status_table';

  @override
  VerificationContext validateIntegrity(Insertable<StatusModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('exp')) {
      context.handle(
          _expMeta, exp.isAcceptableOrUnknown(data['exp']!, _expMeta));
    } else if (isInserting) {
      context.missing(_expMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  StatusModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatusModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      exp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exp'])!,
    );
  }

  @override
  $StatusTableTable createAlias(String alias) {
    return $StatusTableTable(attachedDatabase, alias);
  }
}

class StatusModel extends DataClass implements Insertable<StatusModel> {
  final int id;
  final int level;
  final int exp;

  const StatusModel({required this.id, required this.level, required this.exp});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['level'] = Variable<int>(level);
    map['exp'] = Variable<int>(exp);
    return map;
  }

  StatusTableCompanion toCompanion(bool nullToAbsent) {
    return StatusTableCompanion(
      id: Value(id),
      level: Value(level),
      exp: Value(exp),
    );
  }

  factory StatusModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatusModel(
      id: serializer.fromJson<int>(json['id']),
      level: serializer.fromJson<int>(json['level']),
      exp: serializer.fromJson<int>(json['exp']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'level': serializer.toJson<int>(level),
      'exp': serializer.toJson<int>(exp),
    };
  }

  StatusModel copyWith({int? id, int? level, int? exp}) => StatusModel(
        id: id ?? this.id,
        level: level ?? this.level,
        exp: exp ?? this.exp,
      );

  @override
  String toString() {
    return (StringBuffer('StatusModel(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('exp: $exp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, level, exp);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatusModel &&
          other.id == this.id &&
          other.level == this.level &&
          other.exp == this.exp);
}

class StatusTableCompanion extends UpdateCompanion<StatusModel> {
  final Value<int> id;
  final Value<int> level;
  final Value<int> exp;

  const StatusTableCompanion({
    this.id = const Value.absent(),
    this.level = const Value.absent(),
    this.exp = const Value.absent(),
  });

  StatusTableCompanion.insert({
    this.id = const Value.absent(),
    required int level,
    required int exp,
  })  : level = Value(level),
        exp = Value(exp);

  static Insertable<StatusModel> custom({
    Expression<int>? id,
    Expression<int>? level,
    Expression<int>? exp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (level != null) 'level': level,
      if (exp != null) 'exp': exp,
    });
  }

  StatusTableCompanion copyWith(
      {Value<int>? id, Value<int>? level, Value<int>? exp}) {
    return StatusTableCompanion(
      id: id ?? this.id,
      level: level ?? this.level,
      exp: exp ?? this.exp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (exp.present) {
      map['exp'] = Variable<int>(exp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatusTableCompanion(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('exp: $exp')
          ..write(')'))
        .toString();
  }
}

class $AttributeTableTable extends AttributeTable
    with TableInfo<$AttributeTableTable, AttributeModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $AttributeTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _iconPathMeta =
      const VerificationMeta('iconPath');
  @override
  late final GeneratedColumn<String> iconPath = GeneratedColumn<String>(
      'icon_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expMeta = const VerificationMeta('exp');
  @override
  late final GeneratedColumn<int> exp = GeneratedColumn<int>(
      'exp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusIdMeta =
      const VerificationMeta('statusId');
  @override
  late final GeneratedColumn<int> statusId = GeneratedColumn<int>(
      'status_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES StatusTable(id)');

  @override
  List<GeneratedColumn> get $columns =>
      [id, iconPath, name, level, exp, statusId];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'attribute_table';

  @override
  VerificationContext validateIntegrity(Insertable<AttributeModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('icon_path')) {
      context.handle(_iconPathMeta,
          iconPath.isAcceptableOrUnknown(data['icon_path']!, _iconPathMeta));
    } else if (isInserting) {
      context.missing(_iconPathMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('exp')) {
      context.handle(
          _expMeta, exp.isAcceptableOrUnknown(data['exp']!, _expMeta));
    } else if (isInserting) {
      context.missing(_expMeta);
    }
    if (data.containsKey('status_id')) {
      context.handle(_statusIdMeta,
          statusId.isAcceptableOrUnknown(data['status_id']!, _statusIdMeta));
    } else if (isInserting) {
      context.missing(_statusIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  AttributeModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttributeModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      iconPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_path'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      exp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exp'])!,
      statusId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status_id'])!,
    );
  }

  @override
  $AttributeTableTable createAlias(String alias) {
    return $AttributeTableTable(attachedDatabase, alias);
  }
}

class AttributeModel extends DataClass implements Insertable<AttributeModel> {
  final int id;
  final String iconPath;
  final String name;
  final int level;
  final int exp;
  final int statusId;

  const AttributeModel(
      {required this.id,
      required this.iconPath,
      required this.name,
      required this.level,
      required this.exp,
      required this.statusId});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['icon_path'] = Variable<String>(iconPath);
    map['name'] = Variable<String>(name);
    map['level'] = Variable<int>(level);
    map['exp'] = Variable<int>(exp);
    map['status_id'] = Variable<int>(statusId);
    return map;
  }

  AttributeTableCompanion toCompanion(bool nullToAbsent) {
    return AttributeTableCompanion(
      id: Value(id),
      iconPath: Value(iconPath),
      name: Value(name),
      level: Value(level),
      exp: Value(exp),
      statusId: Value(statusId),
    );
  }

  factory AttributeModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttributeModel(
      id: serializer.fromJson<int>(json['id']),
      iconPath: serializer.fromJson<String>(json['iconPath']),
      name: serializer.fromJson<String>(json['name']),
      level: serializer.fromJson<int>(json['level']),
      exp: serializer.fromJson<int>(json['exp']),
      statusId: serializer.fromJson<int>(json['statusId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'iconPath': serializer.toJson<String>(iconPath),
      'name': serializer.toJson<String>(name),
      'level': serializer.toJson<int>(level),
      'exp': serializer.toJson<int>(exp),
      'statusId': serializer.toJson<int>(statusId),
    };
  }

  AttributeModel copyWith(
          {int? id,
          String? iconPath,
          String? name,
          int? level,
          int? exp,
          int? statusId}) =>
      AttributeModel(
        id: id ?? this.id,
        iconPath: iconPath ?? this.iconPath,
        name: name ?? this.name,
        level: level ?? this.level,
        exp: exp ?? this.exp,
        statusId: statusId ?? this.statusId,
      );

  @override
  String toString() {
    return (StringBuffer('AttributeModel(')
          ..write('id: $id, ')
          ..write('iconPath: $iconPath, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('exp: $exp, ')
          ..write('statusId: $statusId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, iconPath, name, level, exp, statusId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttributeModel &&
          other.id == this.id &&
          other.iconPath == this.iconPath &&
          other.name == this.name &&
          other.level == this.level &&
          other.exp == this.exp &&
          other.statusId == this.statusId);
}

class AttributeTableCompanion extends UpdateCompanion<AttributeModel> {
  final Value<int> id;
  final Value<String> iconPath;
  final Value<String> name;
  final Value<int> level;
  final Value<int> exp;
  final Value<int> statusId;

  const AttributeTableCompanion({
    this.id = const Value.absent(),
    this.iconPath = const Value.absent(),
    this.name = const Value.absent(),
    this.level = const Value.absent(),
    this.exp = const Value.absent(),
    this.statusId = const Value.absent(),
  });

  AttributeTableCompanion.insert({
    this.id = const Value.absent(),
    required String iconPath,
    required String name,
    required int level,
    required int exp,
    required int statusId,
  })  : iconPath = Value(iconPath),
        name = Value(name),
        level = Value(level),
        exp = Value(exp),
        statusId = Value(statusId);

  static Insertable<AttributeModel> custom({
    Expression<int>? id,
    Expression<String>? iconPath,
    Expression<String>? name,
    Expression<int>? level,
    Expression<int>? exp,
    Expression<int>? statusId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (iconPath != null) 'icon_path': iconPath,
      if (name != null) 'name': name,
      if (level != null) 'level': level,
      if (exp != null) 'exp': exp,
      if (statusId != null) 'status_id': statusId,
    });
  }

  AttributeTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? iconPath,
      Value<String>? name,
      Value<int>? level,
      Value<int>? exp,
      Value<int>? statusId}) {
    return AttributeTableCompanion(
      id: id ?? this.id,
      iconPath: iconPath ?? this.iconPath,
      name: name ?? this.name,
      level: level ?? this.level,
      exp: exp ?? this.exp,
      statusId: statusId ?? this.statusId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (iconPath.present) {
      map['icon_path'] = Variable<String>(iconPath.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (exp.present) {
      map['exp'] = Variable<int>(exp.value);
    }
    if (statusId.present) {
      map['status_id'] = Variable<int>(statusId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttributeTableCompanion(')
          ..write('id: $id, ')
          ..write('iconPath: $iconPath, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('exp: $exp, ')
          ..write('statusId: $statusId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);

  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $HabitTableTable habitTable = $HabitTableTable(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final $StatusTableTable statusTable = $StatusTableTable(this);
  late final $AttributeTableTable attributeTable = $AttributeTableTable(this);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [habitTable, taskTable, statusTable, attributeTable];
}

typedef $$HabitTableTableInsertCompanionBuilder = HabitTableCompanion Function({
  Value<int> id,
  required int order,
  required String title,
  required String description,
  required Difficulty difficulty,
  required Category category,
  required HabitType type,
  required int finishedCount,
  required DateTime lastFinishedAt,
  required DateTime createdAt,
});
typedef $$HabitTableTableUpdateCompanionBuilder = HabitTableCompanion Function({
  Value<int> id,
  Value<int> order,
  Value<String> title,
  Value<String> description,
  Value<Difficulty> difficulty,
  Value<Category> category,
  Value<HabitType> type,
  Value<int> finishedCount,
  Value<DateTime> lastFinishedAt,
  Value<DateTime> createdAt,
});

class $$HabitTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabitTableTable,
    HabitModel,
    $$HabitTableTableFilterComposer,
    $$HabitTableTableOrderingComposer,
    $$HabitTableTableProcessedTableManager,
    $$HabitTableTableInsertCompanionBuilder,
    $$HabitTableTableUpdateCompanionBuilder> {
  $$HabitTableTableTableManager(_$AppDatabase db, $HabitTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HabitTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$HabitTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$HabitTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<Difficulty> difficulty = const Value.absent(),
            Value<Category> category = const Value.absent(),
            Value<HabitType> type = const Value.absent(),
            Value<int> finishedCount = const Value.absent(),
            Value<DateTime> lastFinishedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              HabitTableCompanion(
            id: id,
            order: order,
            title: title,
            description: description,
            difficulty: difficulty,
            category: category,
            type: type,
            finishedCount: finishedCount,
            lastFinishedAt: lastFinishedAt,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int order,
            required String title,
            required String description,
            required Difficulty difficulty,
            required Category category,
            required HabitType type,
            required int finishedCount,
            required DateTime lastFinishedAt,
            required DateTime createdAt,
          }) =>
              HabitTableCompanion.insert(
            id: id,
            order: order,
            title: title,
            description: description,
            difficulty: difficulty,
            category: category,
            type: type,
            finishedCount: finishedCount,
            lastFinishedAt: lastFinishedAt,
            createdAt: createdAt,
          ),
        ));
}

class $$HabitTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $HabitTableTable,
    HabitModel,
    $$HabitTableTableFilterComposer,
    $$HabitTableTableOrderingComposer,
    $$HabitTableTableProcessedTableManager,
    $$HabitTableTableInsertCompanionBuilder,
    $$HabitTableTableUpdateCompanionBuilder> {
  $$HabitTableTableProcessedTableManager(super.$state);
}

class $$HabitTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HabitTableTable> {
  $$HabitTableTableFilterComposer(super.$state);

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Difficulty, Difficulty, int> get difficulty =>
      $state.composableBuilder(
          column: $state.table.difficulty,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Category, Category, int> get category =>
      $state.composableBuilder(
          column: $state.table.category,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<HabitType, HabitType, int> get type =>
      $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get finishedCount => $state.composableBuilder(
      column: $state.table.finishedCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastFinishedAt => $state.composableBuilder(
      column: $state.table.lastFinishedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$HabitTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HabitTableTable> {
  $$HabitTableTableOrderingComposer(super.$state);

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get difficulty => $state.composableBuilder(
      column: $state.table.difficulty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get finishedCount => $state.composableBuilder(
      column: $state.table.finishedCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastFinishedAt => $state.composableBuilder(
      column: $state.table.lastFinishedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TaskTableTableInsertCompanionBuilder = TaskTableCompanion Function({
  Value<int> id,
  required int order,
  required String title,
  required String description,
  required Difficulty difficulty,
  required Category category,
  required RepeatType repeatType,
  required int repeatValue,
  required List<int> repeatDays,
  Value<DateTime?> deadline,
  required int finishedCount,
  required DateTime lastFinishedAt,
  required DateTime createdAt,
});
typedef $$TaskTableTableUpdateCompanionBuilder = TaskTableCompanion Function({
  Value<int> id,
  Value<int> order,
  Value<String> title,
  Value<String> description,
  Value<Difficulty> difficulty,
  Value<Category> category,
  Value<RepeatType> repeatType,
  Value<int> repeatValue,
  Value<List<int>> repeatDays,
  Value<DateTime?> deadline,
  Value<int> finishedCount,
  Value<DateTime> lastFinishedAt,
  Value<DateTime> createdAt,
});

class $$TaskTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskTableTable,
    TaskModel,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableProcessedTableManager,
    $$TaskTableTableInsertCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder> {
  $$TaskTableTableTableManager(_$AppDatabase db, $TaskTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TaskTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TaskTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TaskTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<Difficulty> difficulty = const Value.absent(),
            Value<Category> category = const Value.absent(),
            Value<RepeatType> repeatType = const Value.absent(),
            Value<int> repeatValue = const Value.absent(),
            Value<List<int>> repeatDays = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<int> finishedCount = const Value.absent(),
            Value<DateTime> lastFinishedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TaskTableCompanion(
            id: id,
            order: order,
            title: title,
            description: description,
            difficulty: difficulty,
            category: category,
            repeatType: repeatType,
            repeatValue: repeatValue,
            repeatDays: repeatDays,
            deadline: deadline,
            finishedCount: finishedCount,
            lastFinishedAt: lastFinishedAt,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int order,
            required String title,
            required String description,
            required Difficulty difficulty,
            required Category category,
            required RepeatType repeatType,
            required int repeatValue,
            required List<int> repeatDays,
            Value<DateTime?> deadline = const Value.absent(),
            required int finishedCount,
            required DateTime lastFinishedAt,
            required DateTime createdAt,
          }) =>
              TaskTableCompanion.insert(
            id: id,
            order: order,
            title: title,
            description: description,
            difficulty: difficulty,
            category: category,
            repeatType: repeatType,
            repeatValue: repeatValue,
            repeatDays: repeatDays,
            deadline: deadline,
            finishedCount: finishedCount,
            lastFinishedAt: lastFinishedAt,
            createdAt: createdAt,
          ),
        ));
}

class $$TaskTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TaskTableTable,
    TaskModel,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableProcessedTableManager,
    $$TaskTableTableInsertCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder> {
  $$TaskTableTableProcessedTableManager(super.$state);
}

class $$TaskTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableFilterComposer(super.$state);

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Difficulty, Difficulty, int> get difficulty =>
      $state.composableBuilder(
          column: $state.table.difficulty,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Category, Category, int> get category =>
      $state.composableBuilder(
          column: $state.table.category,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<RepeatType, RepeatType, int> get repeatType =>
      $state.composableBuilder(
          column: $state.table.repeatType,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get repeatValue => $state.composableBuilder(
      column: $state.table.repeatValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<int>, List<int>, String> get repeatDays =>
      $state.composableBuilder(
          column: $state.table.repeatDays,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get deadline => $state.composableBuilder(
      column: $state.table.deadline,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get finishedCount => $state.composableBuilder(
      column: $state.table.finishedCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastFinishedAt => $state.composableBuilder(
      column: $state.table.lastFinishedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TaskTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableOrderingComposer(super.$state);

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get difficulty => $state.composableBuilder(
      column: $state.table.difficulty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get repeatType => $state.composableBuilder(
      column: $state.table.repeatType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get repeatValue => $state.composableBuilder(
      column: $state.table.repeatValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get repeatDays => $state.composableBuilder(
      column: $state.table.repeatDays,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get deadline => $state.composableBuilder(
      column: $state.table.deadline,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get finishedCount => $state.composableBuilder(
      column: $state.table.finishedCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastFinishedAt => $state.composableBuilder(
      column: $state.table.lastFinishedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$StatusTableTableInsertCompanionBuilder = StatusTableCompanion
    Function({
  Value<int> id,
  required int level,
  required int exp,
});
typedef $$StatusTableTableUpdateCompanionBuilder = StatusTableCompanion
    Function({
  Value<int> id,
  Value<int> level,
  Value<int> exp,
});

class $$StatusTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StatusTableTable,
    StatusModel,
    $$StatusTableTableFilterComposer,
    $$StatusTableTableOrderingComposer,
    $$StatusTableTableProcessedTableManager,
    $$StatusTableTableInsertCompanionBuilder,
    $$StatusTableTableUpdateCompanionBuilder> {
  $$StatusTableTableTableManager(_$AppDatabase db, $StatusTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$StatusTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$StatusTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$StatusTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<int> exp = const Value.absent(),
          }) =>
              StatusTableCompanion(
            id: id,
            level: level,
            exp: exp,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int level,
            required int exp,
          }) =>
              StatusTableCompanion.insert(
            id: id,
            level: level,
            exp: exp,
          ),
        ));
}

class $$StatusTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $StatusTableTable,
    StatusModel,
    $$StatusTableTableFilterComposer,
    $$StatusTableTableOrderingComposer,
    $$StatusTableTableProcessedTableManager,
    $$StatusTableTableInsertCompanionBuilder,
    $$StatusTableTableUpdateCompanionBuilder> {
  $$StatusTableTableProcessedTableManager(super.$state);
}

class $$StatusTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $StatusTableTable> {
  $$StatusTableTableFilterComposer(super.$state);

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get level => $state.composableBuilder(
      column: $state.table.level,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get exp => $state.composableBuilder(
      column: $state.table.exp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$StatusTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $StatusTableTable> {
  $$StatusTableTableOrderingComposer(super.$state);

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get level => $state.composableBuilder(
      column: $state.table.level,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get exp => $state.composableBuilder(
      column: $state.table.exp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AttributeTableTableInsertCompanionBuilder = AttributeTableCompanion
    Function({
  Value<int> id,
  required String iconPath,
  required String name,
  required int level,
  required int exp,
  required int statusId,
});
typedef $$AttributeTableTableUpdateCompanionBuilder = AttributeTableCompanion
    Function({
  Value<int> id,
  Value<String> iconPath,
  Value<String> name,
  Value<int> level,
  Value<int> exp,
  Value<int> statusId,
});

class $$AttributeTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttributeTableTable,
    AttributeModel,
    $$AttributeTableTableFilterComposer,
    $$AttributeTableTableOrderingComposer,
    $$AttributeTableTableProcessedTableManager,
    $$AttributeTableTableInsertCompanionBuilder,
    $$AttributeTableTableUpdateCompanionBuilder> {
  $$AttributeTableTableTableManager(
      _$AppDatabase db, $AttributeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AttributeTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AttributeTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$AttributeTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> iconPath = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<int> exp = const Value.absent(),
            Value<int> statusId = const Value.absent(),
          }) =>
              AttributeTableCompanion(
            id: id,
            iconPath: iconPath,
            name: name,
            level: level,
            exp: exp,
            statusId: statusId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String iconPath,
            required String name,
            required int level,
            required int exp,
            required int statusId,
          }) =>
              AttributeTableCompanion.insert(
            id: id,
            iconPath: iconPath,
            name: name,
            level: level,
            exp: exp,
            statusId: statusId,
          ),
        ));
}

class $$AttributeTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $AttributeTableTable,
    AttributeModel,
    $$AttributeTableTableFilterComposer,
    $$AttributeTableTableOrderingComposer,
    $$AttributeTableTableProcessedTableManager,
    $$AttributeTableTableInsertCompanionBuilder,
    $$AttributeTableTableUpdateCompanionBuilder> {
  $$AttributeTableTableProcessedTableManager(super.$state);
}

class $$AttributeTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AttributeTableTable> {
  $$AttributeTableTableFilterComposer(super.$state);

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get iconPath => $state.composableBuilder(
      column: $state.table.iconPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get level => $state.composableBuilder(
      column: $state.table.level,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get exp => $state.composableBuilder(
      column: $state.table.exp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get statusId => $state.composableBuilder(
      column: $state.table.statusId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AttributeTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AttributeTableTable> {
  $$AttributeTableTableOrderingComposer(super.$state);

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get iconPath => $state.composableBuilder(
      column: $state.table.iconPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get level => $state.composableBuilder(
      column: $state.table.level,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get exp => $state.composableBuilder(
      column: $state.table.exp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get statusId => $state.composableBuilder(
      column: $state.table.statusId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;

  _$AppDatabaseManager(this._db);

  $$HabitTableTableTableManager get habitTable =>
      $$HabitTableTableTableManager(_db, _db.habitTable);

  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);

  $$StatusTableTableTableManager get statusTable =>
      $$StatusTableTableTableManager(_db, _db.statusTable);

  $$AttributeTableTableTableManager get attributeTable =>
      $$AttributeTableTableTableManager(_db, _db.attributeTable);
}
