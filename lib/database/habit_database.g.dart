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

  @override
  List<GeneratedColumn> get $columns =>
      [id, order, title, description, difficulty, category];

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
}

class HabitModel extends DataClass implements Insertable<HabitModel> {
  final int id;
  final int order;
  final String title;
  final String description;
  final Difficulty difficulty;
  final Category category;

  const HabitModel(
      {required this.id,
      required this.order,
      required this.title,
      required this.description,
      required this.difficulty,
      required this.category});

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
    };
  }

  HabitModel copyWith(
          {int? id,
          int? order,
          String? title,
          String? description,
          Difficulty? difficulty,
          Category? category}) =>
      HabitModel(
        id: id ?? this.id,
        order: order ?? this.order,
        title: title ?? this.title,
        description: description ?? this.description,
        difficulty: difficulty ?? this.difficulty,
        category: category ?? this.category,
      );

  @override
  String toString() {
    return (StringBuffer('HabitModel(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('difficulty: $difficulty, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, order, title, description, difficulty, category);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitModel &&
          other.id == this.id &&
          other.order == this.order &&
          other.title == this.title &&
          other.description == this.description &&
          other.difficulty == this.difficulty &&
          other.category == this.category);
}

class HabitTableCompanion extends UpdateCompanion<HabitModel> {
  final Value<int> id;
  final Value<int> order;
  final Value<String> title;
  final Value<String> description;
  final Value<Difficulty> difficulty;
  final Value<Category> category;

  const HabitTableCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.category = const Value.absent(),
  });

  HabitTableCompanion.insert({
    this.id = const Value.absent(),
    required int order,
    required String title,
    required String description,
    required Difficulty difficulty,
    required Category category,
  })  : order = Value(order),
        title = Value(title),
        description = Value(description),
        difficulty = Value(difficulty),
        category = Value(category);

  static Insertable<HabitModel> custom({
    Expression<int>? id,
    Expression<int>? order,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? difficulty,
    Expression<int>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (difficulty != null) 'difficulty': difficulty,
      if (category != null) 'category': category,
    });
  }

  HabitTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? order,
      Value<String>? title,
      Value<String>? description,
      Value<Difficulty>? difficulty,
      Value<Category>? category}) {
    return HabitTableCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
      title: title ?? this.title,
      description: description ?? this.description,
      difficulty: difficulty ?? this.difficulty,
      category: category ?? this.category,
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
          ..write('category: $category')
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
});
typedef $$HabitTableTableUpdateCompanionBuilder = HabitTableCompanion Function({
  Value<int> id,
  Value<int> order,
  Value<String> title,
  Value<String> description,
  Value<Difficulty> difficulty,
  Value<Category> category,
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
          }) =>
              HabitTableCompanion(
            id: id,
            order: order,
            title: title,
            description: description,
            difficulty: difficulty,
            category: category,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int order,
            required String title,
            required String description,
            required Difficulty difficulty,
            required Category category,
          }) =>
              HabitTableCompanion.insert(
            id: id,
            order: order,
            title: title,
            description: description,
            difficulty: difficulty,
            category: category,
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
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;

  _$AppDatabaseManager(this._db);

  $$HabitTableTableTableManager get habitTable =>
      $$HabitTableTableTableManager(_db, _db.habitTable);
}
