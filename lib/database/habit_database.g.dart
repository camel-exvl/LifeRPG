// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_database.dart';

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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $HabitTableTable habitTable = $HabitTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [habitTable];
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

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$HabitTableTableTableManager get habitTable =>
      $$HabitTableTableTableManager(_db, _db.habitTable);
}
