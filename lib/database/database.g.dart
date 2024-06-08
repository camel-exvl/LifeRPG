// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  static const VerificationMeta _rewardCoefficientMeta =
      const VerificationMeta('rewardCoefficient');
  @override
  late final GeneratedColumn<double> rewardCoefficient =
      GeneratedColumn<double>('reward_coefficient', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
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
        rewardCoefficient,
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
    if (data.containsKey('reward_coefficient')) {
      context.handle(
          _rewardCoefficientMeta,
          rewardCoefficient.isAcceptableOrUnknown(
              data['reward_coefficient']!, _rewardCoefficientMeta));
    } else if (isInserting) {
      context.missing(_rewardCoefficientMeta);
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
      rewardCoefficient: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}reward_coefficient'])!,
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
  final double rewardCoefficient;
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
      required this.rewardCoefficient,
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
    map['reward_coefficient'] = Variable<double>(rewardCoefficient);
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
      rewardCoefficient: Value(rewardCoefficient),
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
      rewardCoefficient: serializer.fromJson<double>(json['rewardCoefficient']),
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
      'rewardCoefficient': serializer.toJson<double>(rewardCoefficient),
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
          double? rewardCoefficient,
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
        rewardCoefficient: rewardCoefficient ?? this.rewardCoefficient,
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
          ..write('rewardCoefficient: $rewardCoefficient, ')
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
      type,
      finishedCount,
      rewardCoefficient,
      lastFinishedAt,
      createdAt);
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
          other.rewardCoefficient == this.rewardCoefficient &&
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
  final Value<double> rewardCoefficient;
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
    this.rewardCoefficient = const Value.absent(),
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
    required double rewardCoefficient,
    required DateTime lastFinishedAt,
    required DateTime createdAt,
  })  : order = Value(order),
        title = Value(title),
        description = Value(description),
        difficulty = Value(difficulty),
        category = Value(category),
        type = Value(type),
        finishedCount = Value(finishedCount),
        rewardCoefficient = Value(rewardCoefficient),
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
    Expression<double>? rewardCoefficient,
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
      if (rewardCoefficient != null) 'reward_coefficient': rewardCoefficient,
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
      Value<double>? rewardCoefficient,
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
      rewardCoefficient: rewardCoefficient ?? this.rewardCoefficient,
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
    if (rewardCoefficient.present) {
      map['reward_coefficient'] = Variable<double>(rewardCoefficient.value);
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
          ..write('rewardCoefficient: $rewardCoefficient, ')
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
  static const VerificationMeta _rewardCoefficientMeta =
      const VerificationMeta('rewardCoefficient');
  @override
  late final GeneratedColumn<double> rewardCoefficient =
      GeneratedColumn<double>('reward_coefficient', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _nextScheduledAtMeta =
      const VerificationMeta('nextScheduledAt');
  @override
  late final GeneratedColumn<DateTime> nextScheduledAt =
      GeneratedColumn<DateTime>('next_scheduled_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
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
        rewardCoefficient,
        nextScheduledAt,
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
    if (data.containsKey('reward_coefficient')) {
      context.handle(
          _rewardCoefficientMeta,
          rewardCoefficient.isAcceptableOrUnknown(
              data['reward_coefficient']!, _rewardCoefficientMeta));
    } else if (isInserting) {
      context.missing(_rewardCoefficientMeta);
    }
    if (data.containsKey('next_scheduled_at')) {
      context.handle(
          _nextScheduledAtMeta,
          nextScheduledAt.isAcceptableOrUnknown(
              data['next_scheduled_at']!, _nextScheduledAtMeta));
    } else if (isInserting) {
      context.missing(_nextScheduledAtMeta);
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
      rewardCoefficient: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}reward_coefficient'])!,
      nextScheduledAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_scheduled_at'])!,
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
  final double rewardCoefficient;
  final DateTime nextScheduledAt;
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
      required this.rewardCoefficient,
      required this.nextScheduledAt,
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
    map['reward_coefficient'] = Variable<double>(rewardCoefficient);
    map['next_scheduled_at'] = Variable<DateTime>(nextScheduledAt);
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
      rewardCoefficient: Value(rewardCoefficient),
      nextScheduledAt: Value(nextScheduledAt),
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
      rewardCoefficient: serializer.fromJson<double>(json['rewardCoefficient']),
      nextScheduledAt: serializer.fromJson<DateTime>(json['nextScheduledAt']),
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
      'rewardCoefficient': serializer.toJson<double>(rewardCoefficient),
      'nextScheduledAt': serializer.toJson<DateTime>(nextScheduledAt),
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
          double? rewardCoefficient,
          DateTime? nextScheduledAt,
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
        rewardCoefficient: rewardCoefficient ?? this.rewardCoefficient,
        nextScheduledAt: nextScheduledAt ?? this.nextScheduledAt,
        lastFinishedAt: lastFinishedAt ?? this.lastFinishedAt,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('TaskModel(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('difficulty: $difficulty, ')
          ..write('category: $category, ')
          ..write('repeatType: $repeatType, ')
          ..write('repeatValue: $repeatValue, ')
          ..write('repeatDays: $repeatDays, ')
          ..write('deadline: $deadline, ')
          ..write('finishedCount: $finishedCount, ')
          ..write('rewardCoefficient: $rewardCoefficient, ')
          ..write('nextScheduledAt: $nextScheduledAt, ')
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
      rewardCoefficient,
      nextScheduledAt,
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
          other.rewardCoefficient == this.rewardCoefficient &&
          other.nextScheduledAt == this.nextScheduledAt &&
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
  final Value<double> rewardCoefficient;
  final Value<DateTime> nextScheduledAt;
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
    this.rewardCoefficient = const Value.absent(),
    this.nextScheduledAt = const Value.absent(),
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
    required double rewardCoefficient,
    required DateTime nextScheduledAt,
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
        rewardCoefficient = Value(rewardCoefficient),
        nextScheduledAt = Value(nextScheduledAt),
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
    Expression<double>? rewardCoefficient,
    Expression<DateTime>? nextScheduledAt,
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
      if (rewardCoefficient != null) 'reward_coefficient': rewardCoefficient,
      if (nextScheduledAt != null) 'next_scheduled_at': nextScheduledAt,
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
      Value<double>? rewardCoefficient,
      Value<DateTime>? nextScheduledAt,
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
      rewardCoefficient: rewardCoefficient ?? this.rewardCoefficient,
      nextScheduledAt: nextScheduledAt ?? this.nextScheduledAt,
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
    if (rewardCoefficient.present) {
      map['reward_coefficient'] = Variable<double>(rewardCoefficient.value);
    }
    if (nextScheduledAt.present) {
      map['next_scheduled_at'] = Variable<DateTime>(nextScheduledAt.value);
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
          ..write('description: $description, ')
          ..write('difficulty: $difficulty, ')
          ..write('category: $category, ')
          ..write('repeatType: $repeatType, ')
          ..write('repeatValue: $repeatValue, ')
          ..write('repeatDays: $repeatDays, ')
          ..write('deadline: $deadline, ')
          ..write('finishedCount: $finishedCount, ')
          ..write('rewardCoefficient: $rewardCoefficient, ')
          ..write('nextScheduledAt: $nextScheduledAt, ')
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
  static const VerificationMeta _goldMeta = const VerificationMeta('gold');
  @override
  late final GeneratedColumn<int> gold = GeneratedColumn<int>(
      'gold', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _diamondMeta =
      const VerificationMeta('diamond');
  @override
  late final GeneratedColumn<int> diamond = GeneratedColumn<int>(
      'diamond', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hpMeta = const VerificationMeta('hp');
  @override
  late final GeneratedColumn<int> hp = GeneratedColumn<int>(
      'hp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weaponIdsMeta =
      const VerificationMeta('weaponIds');
  @override
  late final GeneratedColumn<String> weaponIds = GeneratedColumn<String>(
      'weapon_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _armorIdsMeta =
      const VerificationMeta('armorIds');
  @override
  late final GeneratedColumn<String> armorIds = GeneratedColumn<String>(
      'armor_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _weaponIndexMeta =
      const VerificationMeta('weaponIndex');
  @override
  late final GeneratedColumn<int> weaponIndex = GeneratedColumn<int>(
      'weapon_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _armorIndexMeta =
      const VerificationMeta('armorIndex');
  @override
  late final GeneratedColumn<int> armorIndex = GeneratedColumn<int>(
      'armor_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        level,
        exp,
        gold,
        diamond,
        hp,
        weaponIds,
        armorIds,
        weaponIndex,
        armorIndex
      ];
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
    if (data.containsKey('gold')) {
      context.handle(
          _goldMeta, gold.isAcceptableOrUnknown(data['gold']!, _goldMeta));
    } else if (isInserting) {
      context.missing(_goldMeta);
    }
    if (data.containsKey('diamond')) {
      context.handle(_diamondMeta,
          diamond.isAcceptableOrUnknown(data['diamond']!, _diamondMeta));
    } else if (isInserting) {
      context.missing(_diamondMeta);
    }
    if (data.containsKey('hp')) {
      context.handle(_hpMeta, hp.isAcceptableOrUnknown(data['hp']!, _hpMeta));
    } else if (isInserting) {
      context.missing(_hpMeta);
    }
    if (data.containsKey('weapon_ids')) {
      context.handle(_weaponIdsMeta,
          weaponIds.isAcceptableOrUnknown(data['weapon_ids']!, _weaponIdsMeta));
    }
    if (data.containsKey('armor_ids')) {
      context.handle(_armorIdsMeta,
          armorIds.isAcceptableOrUnknown(data['armor_ids']!, _armorIdsMeta));
    }
    if (data.containsKey('weapon_index')) {
      context.handle(
          _weaponIndexMeta,
          weaponIndex.isAcceptableOrUnknown(
              data['weapon_index']!, _weaponIndexMeta));
    }
    if (data.containsKey('armor_index')) {
      context.handle(
          _armorIndexMeta,
          armorIndex.isAcceptableOrUnknown(
              data['armor_index']!, _armorIndexMeta));
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
      gold: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gold'])!,
      diamond: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}diamond'])!,
      hp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hp'])!,
      weaponIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weapon_ids'])!,
      armorIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}armor_ids'])!,
      weaponIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weapon_index']),
      armorIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}armor_index']),
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
  final int gold;
  final int diamond;
  final int hp;
  final String weaponIds;
  final String armorIds;
  final int? weaponIndex;
  final int? armorIndex;
  const StatusModel(
      {required this.id,
      required this.level,
      required this.exp,
      required this.gold,
      required this.diamond,
      required this.hp,
      required this.weaponIds,
      required this.armorIds,
      this.weaponIndex,
      this.armorIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['level'] = Variable<int>(level);
    map['exp'] = Variable<int>(exp);
    map['gold'] = Variable<int>(gold);
    map['diamond'] = Variable<int>(diamond);
    map['hp'] = Variable<int>(hp);
    map['weapon_ids'] = Variable<String>(weaponIds);
    map['armor_ids'] = Variable<String>(armorIds);
    if (!nullToAbsent || weaponIndex != null) {
      map['weapon_index'] = Variable<int>(weaponIndex);
    }
    if (!nullToAbsent || armorIndex != null) {
      map['armor_index'] = Variable<int>(armorIndex);
    }
    return map;
  }

  StatusTableCompanion toCompanion(bool nullToAbsent) {
    return StatusTableCompanion(
      id: Value(id),
      level: Value(level),
      exp: Value(exp),
      gold: Value(gold),
      diamond: Value(diamond),
      hp: Value(hp),
      weaponIds: Value(weaponIds),
      armorIds: Value(armorIds),
      weaponIndex: weaponIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(weaponIndex),
      armorIndex: armorIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(armorIndex),
    );
  }

  factory StatusModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatusModel(
      id: serializer.fromJson<int>(json['id']),
      level: serializer.fromJson<int>(json['level']),
      exp: serializer.fromJson<int>(json['exp']),
      gold: serializer.fromJson<int>(json['gold']),
      diamond: serializer.fromJson<int>(json['diamond']),
      hp: serializer.fromJson<int>(json['hp']),
      weaponIds: serializer.fromJson<String>(json['weaponIds']),
      armorIds: serializer.fromJson<String>(json['armorIds']),
      weaponIndex: serializer.fromJson<int?>(json['weaponIndex']),
      armorIndex: serializer.fromJson<int?>(json['armorIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'level': serializer.toJson<int>(level),
      'exp': serializer.toJson<int>(exp),
      'gold': serializer.toJson<int>(gold),
      'diamond': serializer.toJson<int>(diamond),
      'hp': serializer.toJson<int>(hp),
      'weaponIds': serializer.toJson<String>(weaponIds),
      'armorIds': serializer.toJson<String>(armorIds),
      'weaponIndex': serializer.toJson<int?>(weaponIndex),
      'armorIndex': serializer.toJson<int?>(armorIndex),
    };
  }

  StatusModel copyWith(
          {int? id,
          int? level,
          int? exp,
          int? gold,
          int? diamond,
          int? hp,
          String? weaponIds,
          String? armorIds,
          Value<int?> weaponIndex = const Value.absent(),
          Value<int?> armorIndex = const Value.absent()}) =>
      StatusModel(
        id: id ?? this.id,
        level: level ?? this.level,
        exp: exp ?? this.exp,
        gold: gold ?? this.gold,
        diamond: diamond ?? this.diamond,
        hp: hp ?? this.hp,
        weaponIds: weaponIds ?? this.weaponIds,
        armorIds: armorIds ?? this.armorIds,
        weaponIndex: weaponIndex.present ? weaponIndex.value : this.weaponIndex,
        armorIndex: armorIndex.present ? armorIndex.value : this.armorIndex,
      );
  @override
  String toString() {
    return (StringBuffer('StatusModel(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('exp: $exp, ')
          ..write('gold: $gold, ')
          ..write('diamond: $diamond, ')
          ..write('hp: $hp, ')
          ..write('weaponIds: $weaponIds, ')
          ..write('armorIds: $armorIds, ')
          ..write('weaponIndex: $weaponIndex, ')
          ..write('armorIndex: $armorIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, level, exp, gold, diamond, hp, weaponIds,
      armorIds, weaponIndex, armorIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatusModel &&
          other.id == this.id &&
          other.level == this.level &&
          other.exp == this.exp &&
          other.gold == this.gold &&
          other.diamond == this.diamond &&
          other.hp == this.hp &&
          other.weaponIds == this.weaponIds &&
          other.armorIds == this.armorIds &&
          other.weaponIndex == this.weaponIndex &&
          other.armorIndex == this.armorIndex);
}

class StatusTableCompanion extends UpdateCompanion<StatusModel> {
  final Value<int> id;
  final Value<int> level;
  final Value<int> exp;
  final Value<int> gold;
  final Value<int> diamond;
  final Value<int> hp;
  final Value<String> weaponIds;
  final Value<String> armorIds;
  final Value<int?> weaponIndex;
  final Value<int?> armorIndex;
  const StatusTableCompanion({
    this.id = const Value.absent(),
    this.level = const Value.absent(),
    this.exp = const Value.absent(),
    this.gold = const Value.absent(),
    this.diamond = const Value.absent(),
    this.hp = const Value.absent(),
    this.weaponIds = const Value.absent(),
    this.armorIds = const Value.absent(),
    this.weaponIndex = const Value.absent(),
    this.armorIndex = const Value.absent(),
  });
  StatusTableCompanion.insert({
    this.id = const Value.absent(),
    required int level,
    required int exp,
    required int gold,
    required int diamond,
    required int hp,
    this.weaponIds = const Value.absent(),
    this.armorIds = const Value.absent(),
    this.weaponIndex = const Value.absent(),
    this.armorIndex = const Value.absent(),
  })  : level = Value(level),
        exp = Value(exp),
        gold = Value(gold),
        diamond = Value(diamond),
        hp = Value(hp);
  static Insertable<StatusModel> custom({
    Expression<int>? id,
    Expression<int>? level,
    Expression<int>? exp,
    Expression<int>? gold,
    Expression<int>? diamond,
    Expression<int>? hp,
    Expression<String>? weaponIds,
    Expression<String>? armorIds,
    Expression<int>? weaponIndex,
    Expression<int>? armorIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (level != null) 'level': level,
      if (exp != null) 'exp': exp,
      if (gold != null) 'gold': gold,
      if (diamond != null) 'diamond': diamond,
      if (hp != null) 'hp': hp,
      if (weaponIds != null) 'weapon_ids': weaponIds,
      if (armorIds != null) 'armor_ids': armorIds,
      if (weaponIndex != null) 'weapon_index': weaponIndex,
      if (armorIndex != null) 'armor_index': armorIndex,
    });
  }

  StatusTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? level,
      Value<int>? exp,
      Value<int>? gold,
      Value<int>? diamond,
      Value<int>? hp,
      Value<String>? weaponIds,
      Value<String>? armorIds,
      Value<int?>? weaponIndex,
      Value<int?>? armorIndex}) {
    return StatusTableCompanion(
      id: id ?? this.id,
      level: level ?? this.level,
      exp: exp ?? this.exp,
      gold: gold ?? this.gold,
      diamond: diamond ?? this.diamond,
      hp: hp ?? this.hp,
      weaponIds: weaponIds ?? this.weaponIds,
      armorIds: armorIds ?? this.armorIds,
      weaponIndex: weaponIndex ?? this.weaponIndex,
      armorIndex: armorIndex ?? this.armorIndex,
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
    if (gold.present) {
      map['gold'] = Variable<int>(gold.value);
    }
    if (diamond.present) {
      map['diamond'] = Variable<int>(diamond.value);
    }
    if (hp.present) {
      map['hp'] = Variable<int>(hp.value);
    }
    if (weaponIds.present) {
      map['weapon_ids'] = Variable<String>(weaponIds.value);
    }
    if (armorIds.present) {
      map['armor_ids'] = Variable<String>(armorIds.value);
    }
    if (weaponIndex.present) {
      map['weapon_index'] = Variable<int>(weaponIndex.value);
    }
    if (armorIndex.present) {
      map['armor_index'] = Variable<int>(armorIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatusTableCompanion(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('exp: $exp, ')
          ..write('gold: $gold, ')
          ..write('diamond: $diamond, ')
          ..write('hp: $hp, ')
          ..write('weaponIds: $weaponIds, ')
          ..write('armorIds: $armorIds, ')
          ..write('weaponIndex: $weaponIndex, ')
          ..write('armorIndex: $armorIndex')
          ..write(')'))
        .toString();
  }
}

class $SettingTableTable extends SettingTable
    with TableInfo<$SettingTableTable, SettingModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _languageTypeMeta =
      const VerificationMeta('languageType');
  @override
  late final GeneratedColumn<int> languageType = GeneratedColumn<int>(
      'language_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _brightnessTypeMeta =
      const VerificationMeta('brightnessType');
  @override
  late final GeneratedColumn<int> brightnessType = GeneratedColumn<int>(
      'brightness_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, languageType, brightnessType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'setting_table';
  @override
  VerificationContext validateIntegrity(Insertable<SettingModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language_type')) {
      context.handle(
          _languageTypeMeta,
          languageType.isAcceptableOrUnknown(
              data['language_type']!, _languageTypeMeta));
    } else if (isInserting) {
      context.missing(_languageTypeMeta);
    }
    if (data.containsKey('brightness_type')) {
      context.handle(
          _brightnessTypeMeta,
          brightnessType.isAcceptableOrUnknown(
              data['brightness_type']!, _brightnessTypeMeta));
    } else if (isInserting) {
      context.missing(_brightnessTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      languageType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}language_type'])!,
      brightnessType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}brightness_type'])!,
    );
  }

  @override
  $SettingTableTable createAlias(String alias) {
    return $SettingTableTable(attachedDatabase, alias);
  }
}

class SettingModel extends DataClass implements Insertable<SettingModel> {
  final int id;
  final int languageType;
  final int brightnessType;
  const SettingModel(
      {required this.id,
      required this.languageType,
      required this.brightnessType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['language_type'] = Variable<int>(languageType);
    map['brightness_type'] = Variable<int>(brightnessType);
    return map;
  }

  SettingTableCompanion toCompanion(bool nullToAbsent) {
    return SettingTableCompanion(
      id: Value(id),
      languageType: Value(languageType),
      brightnessType: Value(brightnessType),
    );
  }

  factory SettingModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingModel(
      id: serializer.fromJson<int>(json['id']),
      languageType: serializer.fromJson<int>(json['languageType']),
      brightnessType: serializer.fromJson<int>(json['brightnessType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'languageType': serializer.toJson<int>(languageType),
      'brightnessType': serializer.toJson<int>(brightnessType),
    };
  }

  SettingModel copyWith({int? id, int? languageType, int? brightnessType}) =>
      SettingModel(
        id: id ?? this.id,
        languageType: languageType ?? this.languageType,
        brightnessType: brightnessType ?? this.brightnessType,
      );
  @override
  String toString() {
    return (StringBuffer('SettingModel(')
          ..write('id: $id, ')
          ..write('languageType: $languageType, ')
          ..write('brightnessType: $brightnessType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, languageType, brightnessType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingModel &&
          other.id == this.id &&
          other.languageType == this.languageType &&
          other.brightnessType == this.brightnessType);
}

class SettingTableCompanion extends UpdateCompanion<SettingModel> {
  final Value<int> id;
  final Value<int> languageType;
  final Value<int> brightnessType;
  const SettingTableCompanion({
    this.id = const Value.absent(),
    this.languageType = const Value.absent(),
    this.brightnessType = const Value.absent(),
  });
  SettingTableCompanion.insert({
    this.id = const Value.absent(),
    required int languageType,
    required int brightnessType,
  })  : languageType = Value(languageType),
        brightnessType = Value(brightnessType);
  static Insertable<SettingModel> custom({
    Expression<int>? id,
    Expression<int>? languageType,
    Expression<int>? brightnessType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageType != null) 'language_type': languageType,
      if (brightnessType != null) 'brightness_type': brightnessType,
    });
  }

  SettingTableCompanion copyWith(
      {Value<int>? id, Value<int>? languageType, Value<int>? brightnessType}) {
    return SettingTableCompanion(
      id: id ?? this.id,
      languageType: languageType ?? this.languageType,
      brightnessType: brightnessType ?? this.brightnessType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (languageType.present) {
      map['language_type'] = Variable<int>(languageType.value);
    }
    if (brightnessType.present) {
      map['brightness_type'] = Variable<int>(brightnessType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingTableCompanion(')
          ..write('id: $id, ')
          ..write('languageType: $languageType, ')
          ..write('brightnessType: $brightnessType')
          ..write(')'))
        .toString();
  }
}

class $EquipmentTableTable extends EquipmentTable
    with TableInfo<$EquipmentTableTable, EquipmentModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _equipmentTypeMeta =
      const VerificationMeta('equipmentType');
  @override
  late final GeneratedColumnWithTypeConverter<EquipmentType, int>
      equipmentType = GeneratedColumn<int>('equipment_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<EquipmentType>(
              $EquipmentTableTable.$converterequipmentType);
  static const VerificationMeta _moneyTypeMeta =
      const VerificationMeta('moneyType');
  @override
  late final GeneratedColumnWithTypeConverter<MoneyType, int> moneyType =
      GeneratedColumn<int>('money_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<MoneyType>($EquipmentTableTable.$convertermoneyType);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
      'stock', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, equipmentType, moneyType, price, stock];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_table';
  @override
  VerificationContext validateIntegrity(Insertable<EquipmentModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_equipmentTypeMeta, const VerificationResult.success());
    context.handle(_moneyTypeMeta, const VerificationResult.success());
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      equipmentType: $EquipmentTableTable.$converterequipmentType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}equipment_type'])!),
      moneyType: $EquipmentTableTable.$convertermoneyType.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}money_type'])!),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock'])!,
    );
  }

  @override
  $EquipmentTableTable createAlias(String alias) {
    return $EquipmentTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EquipmentType, int, int> $converterequipmentType =
      const EnumIndexConverter<EquipmentType>(EquipmentType.values);
  static JsonTypeConverter2<MoneyType, int, int> $convertermoneyType =
      const EnumIndexConverter<MoneyType>(MoneyType.values);
}

class EquipmentModel extends DataClass implements Insertable<EquipmentModel> {
  final int id;
  final EquipmentType equipmentType;
  final MoneyType moneyType;
  final int price;
  final int stock;
  const EquipmentModel(
      {required this.id,
      required this.equipmentType,
      required this.moneyType,
      required this.price,
      required this.stock});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['equipment_type'] = Variable<int>(
          $EquipmentTableTable.$converterequipmentType.toSql(equipmentType));
    }
    {
      map['money_type'] = Variable<int>(
          $EquipmentTableTable.$convertermoneyType.toSql(moneyType));
    }
    map['price'] = Variable<int>(price);
    map['stock'] = Variable<int>(stock);
    return map;
  }

  EquipmentTableCompanion toCompanion(bool nullToAbsent) {
    return EquipmentTableCompanion(
      id: Value(id),
      equipmentType: Value(equipmentType),
      moneyType: Value(moneyType),
      price: Value(price),
      stock: Value(stock),
    );
  }

  factory EquipmentModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentModel(
      id: serializer.fromJson<int>(json['id']),
      equipmentType: $EquipmentTableTable.$converterequipmentType
          .fromJson(serializer.fromJson<int>(json['equipmentType'])),
      moneyType: $EquipmentTableTable.$convertermoneyType
          .fromJson(serializer.fromJson<int>(json['moneyType'])),
      price: serializer.fromJson<int>(json['price']),
      stock: serializer.fromJson<int>(json['stock']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'equipmentType': serializer.toJson<int>(
          $EquipmentTableTable.$converterequipmentType.toJson(equipmentType)),
      'moneyType': serializer.toJson<int>(
          $EquipmentTableTable.$convertermoneyType.toJson(moneyType)),
      'price': serializer.toJson<int>(price),
      'stock': serializer.toJson<int>(stock),
    };
  }

  EquipmentModel copyWith(
          {int? id,
          EquipmentType? equipmentType,
          MoneyType? moneyType,
          int? price,
          int? stock}) =>
      EquipmentModel(
        id: id ?? this.id,
        equipmentType: equipmentType ?? this.equipmentType,
        moneyType: moneyType ?? this.moneyType,
        price: price ?? this.price,
        stock: stock ?? this.stock,
      );
  @override
  String toString() {
    return (StringBuffer('EquipmentModel(')
          ..write('id: $id, ')
          ..write('equipmentType: $equipmentType, ')
          ..write('moneyType: $moneyType, ')
          ..write('price: $price, ')
          ..write('stock: $stock')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, equipmentType, moneyType, price, stock);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentModel &&
          other.id == this.id &&
          other.equipmentType == this.equipmentType &&
          other.moneyType == this.moneyType &&
          other.price == this.price &&
          other.stock == this.stock);
}

class EquipmentTableCompanion extends UpdateCompanion<EquipmentModel> {
  final Value<int> id;
  final Value<EquipmentType> equipmentType;
  final Value<MoneyType> moneyType;
  final Value<int> price;
  final Value<int> stock;
  const EquipmentTableCompanion({
    this.id = const Value.absent(),
    this.equipmentType = const Value.absent(),
    this.moneyType = const Value.absent(),
    this.price = const Value.absent(),
    this.stock = const Value.absent(),
  });
  EquipmentTableCompanion.insert({
    this.id = const Value.absent(),
    required EquipmentType equipmentType,
    required MoneyType moneyType,
    required int price,
    required int stock,
  })  : equipmentType = Value(equipmentType),
        moneyType = Value(moneyType),
        price = Value(price),
        stock = Value(stock);
  static Insertable<EquipmentModel> custom({
    Expression<int>? id,
    Expression<int>? equipmentType,
    Expression<int>? moneyType,
    Expression<int>? price,
    Expression<int>? stock,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (equipmentType != null) 'equipment_type': equipmentType,
      if (moneyType != null) 'money_type': moneyType,
      if (price != null) 'price': price,
      if (stock != null) 'stock': stock,
    });
  }

  EquipmentTableCompanion copyWith(
      {Value<int>? id,
      Value<EquipmentType>? equipmentType,
      Value<MoneyType>? moneyType,
      Value<int>? price,
      Value<int>? stock}) {
    return EquipmentTableCompanion(
      id: id ?? this.id,
      equipmentType: equipmentType ?? this.equipmentType,
      moneyType: moneyType ?? this.moneyType,
      price: price ?? this.price,
      stock: stock ?? this.stock,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (equipmentType.present) {
      map['equipment_type'] = Variable<int>($EquipmentTableTable
          .$converterequipmentType
          .toSql(equipmentType.value));
    }
    if (moneyType.present) {
      map['money_type'] = Variable<int>(
          $EquipmentTableTable.$convertermoneyType.toSql(moneyType.value));
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentTableCompanion(')
          ..write('id: $id, ')
          ..write('equipmentType: $equipmentType, ')
          ..write('moneyType: $moneyType, ')
          ..write('price: $price, ')
          ..write('stock: $stock')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $AttributeTableTable attributeTable = $AttributeTableTable(this);
  late final $HabitTableTable habitTable = $HabitTableTable(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final $StatusTableTable statusTable = $StatusTableTable(this);
  late final $SettingTableTable settingTable = $SettingTableTable(this);
  late final $EquipmentTableTable equipmentTable = $EquipmentTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        attributeTable,
        habitTable,
        taskTable,
        statusTable,
        settingTable,
        equipmentTable
      ];
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

typedef $$HabitTableTableInsertCompanionBuilder = HabitTableCompanion Function({
  Value<int> id,
  required int order,
  required String title,
  required String description,
  required Difficulty difficulty,
  required Category category,
  required HabitType type,
  required int finishedCount,
  required double rewardCoefficient,
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
  Value<double> rewardCoefficient,
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
            Value<double> rewardCoefficient = const Value.absent(),
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
            rewardCoefficient: rewardCoefficient,
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
            required double rewardCoefficient,
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
            rewardCoefficient: rewardCoefficient,
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

  ColumnFilters<double> get rewardCoefficient => $state.composableBuilder(
      column: $state.table.rewardCoefficient,
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

  ColumnOrderings<double> get rewardCoefficient => $state.composableBuilder(
      column: $state.table.rewardCoefficient,
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
  required double rewardCoefficient,
  required DateTime nextScheduledAt,
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
  Value<double> rewardCoefficient,
  Value<DateTime> nextScheduledAt,
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
            Value<double> rewardCoefficient = const Value.absent(),
            Value<DateTime> nextScheduledAt = const Value.absent(),
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
            rewardCoefficient: rewardCoefficient,
            nextScheduledAt: nextScheduledAt,
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
            required double rewardCoefficient,
            required DateTime nextScheduledAt,
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
            rewardCoefficient: rewardCoefficient,
            nextScheduledAt: nextScheduledAt,
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

  ColumnFilters<double> get rewardCoefficient => $state.composableBuilder(
      column: $state.table.rewardCoefficient,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get nextScheduledAt => $state.composableBuilder(
      column: $state.table.nextScheduledAt,
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

  ColumnOrderings<double> get rewardCoefficient => $state.composableBuilder(
      column: $state.table.rewardCoefficient,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get nextScheduledAt => $state.composableBuilder(
      column: $state.table.nextScheduledAt,
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
  required int gold,
  required int diamond,
  required int hp,
  Value<String> weaponIds,
  Value<String> armorIds,
  Value<int?> weaponIndex,
  Value<int?> armorIndex,
});
typedef $$StatusTableTableUpdateCompanionBuilder = StatusTableCompanion
    Function({
  Value<int> id,
  Value<int> level,
  Value<int> exp,
  Value<int> gold,
  Value<int> diamond,
  Value<int> hp,
  Value<String> weaponIds,
  Value<String> armorIds,
  Value<int?> weaponIndex,
  Value<int?> armorIndex,
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
            Value<int> gold = const Value.absent(),
            Value<int> diamond = const Value.absent(),
            Value<int> hp = const Value.absent(),
            Value<String> weaponIds = const Value.absent(),
            Value<String> armorIds = const Value.absent(),
            Value<int?> weaponIndex = const Value.absent(),
            Value<int?> armorIndex = const Value.absent(),
          }) =>
              StatusTableCompanion(
            id: id,
            level: level,
            exp: exp,
            gold: gold,
            diamond: diamond,
            hp: hp,
            weaponIds: weaponIds,
            armorIds: armorIds,
            weaponIndex: weaponIndex,
            armorIndex: armorIndex,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int level,
            required int exp,
            required int gold,
            required int diamond,
            required int hp,
            Value<String> weaponIds = const Value.absent(),
            Value<String> armorIds = const Value.absent(),
            Value<int?> weaponIndex = const Value.absent(),
            Value<int?> armorIndex = const Value.absent(),
          }) =>
              StatusTableCompanion.insert(
            id: id,
            level: level,
            exp: exp,
            gold: gold,
            diamond: diamond,
            hp: hp,
            weaponIds: weaponIds,
            armorIds: armorIds,
            weaponIndex: weaponIndex,
            armorIndex: armorIndex,
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

  ColumnFilters<int> get gold => $state.composableBuilder(
      column: $state.table.gold,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get diamond => $state.composableBuilder(
      column: $state.table.diamond,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get hp => $state.composableBuilder(
      column: $state.table.hp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get weaponIds => $state.composableBuilder(
      column: $state.table.weaponIds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get armorIds => $state.composableBuilder(
      column: $state.table.armorIds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get weaponIndex => $state.composableBuilder(
      column: $state.table.weaponIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get armorIndex => $state.composableBuilder(
      column: $state.table.armorIndex,
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

  ColumnOrderings<int> get gold => $state.composableBuilder(
      column: $state.table.gold,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get diamond => $state.composableBuilder(
      column: $state.table.diamond,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get hp => $state.composableBuilder(
      column: $state.table.hp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get weaponIds => $state.composableBuilder(
      column: $state.table.weaponIds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get armorIds => $state.composableBuilder(
      column: $state.table.armorIds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get weaponIndex => $state.composableBuilder(
      column: $state.table.weaponIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get armorIndex => $state.composableBuilder(
      column: $state.table.armorIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SettingTableTableInsertCompanionBuilder = SettingTableCompanion
    Function({
  Value<int> id,
  required int languageType,
  required int brightnessType,
});
typedef $$SettingTableTableUpdateCompanionBuilder = SettingTableCompanion
    Function({
  Value<int> id,
  Value<int> languageType,
  Value<int> brightnessType,
});

class $$SettingTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingTableTable,
    SettingModel,
    $$SettingTableTableFilterComposer,
    $$SettingTableTableOrderingComposer,
    $$SettingTableTableProcessedTableManager,
    $$SettingTableTableInsertCompanionBuilder,
    $$SettingTableTableUpdateCompanionBuilder> {
  $$SettingTableTableTableManager(_$AppDatabase db, $SettingTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SettingTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SettingTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$SettingTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> languageType = const Value.absent(),
            Value<int> brightnessType = const Value.absent(),
          }) =>
              SettingTableCompanion(
            id: id,
            languageType: languageType,
            brightnessType: brightnessType,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int languageType,
            required int brightnessType,
          }) =>
              SettingTableCompanion.insert(
            id: id,
            languageType: languageType,
            brightnessType: brightnessType,
          ),
        ));
}

class $$SettingTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $SettingTableTable,
    SettingModel,
    $$SettingTableTableFilterComposer,
    $$SettingTableTableOrderingComposer,
    $$SettingTableTableProcessedTableManager,
    $$SettingTableTableInsertCompanionBuilder,
    $$SettingTableTableUpdateCompanionBuilder> {
  $$SettingTableTableProcessedTableManager(super.$state);
}

class $$SettingTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SettingTableTable> {
  $$SettingTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get languageType => $state.composableBuilder(
      column: $state.table.languageType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get brightnessType => $state.composableBuilder(
      column: $state.table.brightnessType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SettingTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SettingTableTable> {
  $$SettingTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get languageType => $state.composableBuilder(
      column: $state.table.languageType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get brightnessType => $state.composableBuilder(
      column: $state.table.brightnessType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$EquipmentTableTableInsertCompanionBuilder = EquipmentTableCompanion
    Function({
  Value<int> id,
  required EquipmentType equipmentType,
  required MoneyType moneyType,
  required int price,
  required int stock,
});
typedef $$EquipmentTableTableUpdateCompanionBuilder = EquipmentTableCompanion
    Function({
  Value<int> id,
  Value<EquipmentType> equipmentType,
  Value<MoneyType> moneyType,
  Value<int> price,
  Value<int> stock,
});

class $$EquipmentTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EquipmentTableTable,
    EquipmentModel,
    $$EquipmentTableTableFilterComposer,
    $$EquipmentTableTableOrderingComposer,
    $$EquipmentTableTableProcessedTableManager,
    $$EquipmentTableTableInsertCompanionBuilder,
    $$EquipmentTableTableUpdateCompanionBuilder> {
  $$EquipmentTableTableTableManager(
      _$AppDatabase db, $EquipmentTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EquipmentTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EquipmentTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$EquipmentTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<EquipmentType> equipmentType = const Value.absent(),
            Value<MoneyType> moneyType = const Value.absent(),
            Value<int> price = const Value.absent(),
            Value<int> stock = const Value.absent(),
          }) =>
              EquipmentTableCompanion(
            id: id,
            equipmentType: equipmentType,
            moneyType: moneyType,
            price: price,
            stock: stock,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required EquipmentType equipmentType,
            required MoneyType moneyType,
            required int price,
            required int stock,
          }) =>
              EquipmentTableCompanion.insert(
            id: id,
            equipmentType: equipmentType,
            moneyType: moneyType,
            price: price,
            stock: stock,
          ),
        ));
}

class $$EquipmentTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $EquipmentTableTable,
    EquipmentModel,
    $$EquipmentTableTableFilterComposer,
    $$EquipmentTableTableOrderingComposer,
    $$EquipmentTableTableProcessedTableManager,
    $$EquipmentTableTableInsertCompanionBuilder,
    $$EquipmentTableTableUpdateCompanionBuilder> {
  $$EquipmentTableTableProcessedTableManager(super.$state);
}

class $$EquipmentTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EquipmentTableTable> {
  $$EquipmentTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<EquipmentType, EquipmentType, int>
      get equipmentType => $state.composableBuilder(
          column: $state.table.equipmentType,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<MoneyType, MoneyType, int> get moneyType =>
      $state.composableBuilder(
          column: $state.table.moneyType,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get stock => $state.composableBuilder(
      column: $state.table.stock,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$EquipmentTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EquipmentTableTable> {
  $$EquipmentTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get equipmentType => $state.composableBuilder(
      column: $state.table.equipmentType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get moneyType => $state.composableBuilder(
      column: $state.table.moneyType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get stock => $state.composableBuilder(
      column: $state.table.stock,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$AttributeTableTableTableManager get attributeTable =>
      $$AttributeTableTableTableManager(_db, _db.attributeTable);
  $$HabitTableTableTableManager get habitTable =>
      $$HabitTableTableTableManager(_db, _db.habitTable);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);
  $$StatusTableTableTableManager get statusTable =>
      $$StatusTableTableTableManager(_db, _db.statusTable);
  $$SettingTableTableTableManager get settingTable =>
      $$SettingTableTableTableManager(_db, _db.settingTable);
  $$EquipmentTableTableTableManager get equipmentTable =>
      $$EquipmentTableTableTableManager(_db, _db.equipmentTable);
}
