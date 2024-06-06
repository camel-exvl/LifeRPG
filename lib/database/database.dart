import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:liferpg/model/store/property_model.dart';
import 'package:liferpg/model/store/equipment_model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../model/common_model.dart';
import '../model/status/attribute_model.dart';
import '../model/status/status_model.dart';
import '../model/target/habit_model.dart';
import '../model/target/task_model.dart';
import '../model/setting/setting_model.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  AttributeTable,
  HabitTable,
  TaskTable,
  StatusTable,
  SettingTable,
  EquipmentTable,
  PropertyTable
])
class AppDatabase extends _$AppDatabase {
  static final AppDatabase instance = AppDatabase._internal();

  AppDatabase._internal() : super(_openConnection());

  factory AppDatabase() => instance;

  @override
  int get schemaVersion => 1;

  // Habit
  Future<List<HabitModel>> getAllHabits() async {
    return (select(habitTable)
          ..orderBy([(t) => OrderingTerm(expression: t.order)]))
        .get();
  }

  Future<int> insertHabit(HabitTableCompanion habit) =>
      into(habitTable).insert(habit);

  Future<void> updateHabit(HabitModel habit) =>
      update(habitTable).replace(habit);

  Future<void> deleteHabit(HabitModel habit) =>
      delete(habitTable).delete(habit);

  Future<void> reorderHabits(
      List<HabitModel> habits, int oldIndex, int newIndex) async {
    transaction(() async {
      for (var i = min(oldIndex, newIndex); i <= max(oldIndex, newIndex); i++) {
        await update(habitTable).replace(habits[i].copyWith(order: i));
      }
    });
  }

  // Task
  Future<List<TaskModel>> getAllTasks() async {
    return (select(taskTable)
          ..orderBy([(t) => OrderingTerm(expression: t.order)]))
        .get();
  }

  Future<int> insertTask(TaskTableCompanion task) =>
      into(taskTable).insert(task);

  Future<void> updateTask(TaskModel task) => update(taskTable).replace(task);

  Future<void> deleteTask(TaskModel task) => delete(taskTable).delete(task);

  Future<void> reorderTasks(
      List<TaskModel> tasks, int oldIndex, int newIndex) async {
    transaction(() async {
      for (var i = min(oldIndex, newIndex); i <= max(oldIndex, newIndex); i++) {
        await update(taskTable).replace(tasks[i].copyWith(order: i));
      }
    });
  }

  // Status
  Future<StatusModel> getStatus(int statusId) async {
    return (select(statusTable)..where((t) => t.id.equals(statusId)))
        .getSingle();
  }

  Future<void> insertStatus(StatusTableCompanion status) =>
      into(statusTable).insert(status);

  Future<void> updateStatus(StatusModel status) =>
      update(statusTable).replace(status);

  Future<void> deleteStatus(StatusModel status) =>
      delete(statusTable).delete(status);

  // Attribute
  Future<List<AttributeModel>> getAllAttributes(int statusId) async {
    return (select(attributeTable)
          ..where((t) => t.statusId.equals(statusId))
          ..orderBy([(t) => OrderingTerm(expression: t.id)]))
        .get();
  }

  Future<void> insertAttribute(AttributeTableCompanion attribute) =>
      into(attributeTable).insert(attribute);

  Future<void> updateAttribute(AttributeModel attribute) =>
      update(attributeTable).replace(attribute);

  Future<void> deleteAttribute(AttributeModel attribute) =>
      delete(attributeTable).delete(attribute);

  // Store
  Future<List<EquipmentModel>> getAllEquipments() async {
    return (select(equipmentTable)
          ..orderBy([(t) => OrderingTerm(expression: t.id)]))
        .get();
  }

  Future<void> insertEquipment(EquipmentTableCompanion equipment) =>
      into(equipmentTable).insert(equipment);

  Future<void> updateEquipment(EquipmentModel equipment) =>
      update(equipmentTable).replace(equipment);

  Future<void> deleteEquipment(EquipmentModel equipment) =>
      delete(equipmentTable).delete(equipment);

  Future<List<PropertyModel>> getAllProperties() async {
    return (select(propertyTable)
          ..orderBy([(t) => OrderingTerm(expression: t.id)]))
        .get();
  }

  Future<void> insertProperty(PropertyTableCompanion property) =>
      into(propertyTable).insert(property);

  Future<void> updateProperty(PropertyModel property) =>
      update(propertyTable).replace(property);

  Future<void> deleteProperty(PropertyModel property) =>
      delete(propertyTable).delete(property);

  // Setting
  Future<SettingModel> getSetting() async {
    return (select(settingTable)..limit(1)).getSingle();
  }

  Future<void> insertSetting(SettingTableCompanion setting) =>
      into(settingTable).insert(setting);

  Future<void> updateSetting(SettingModel setting) =>
      update(settingTable).replace(setting);

  Future<void> deleteSetting(SettingModel setting) =>
      delete(settingTable).delete(setting);
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the one from the system may be inaccessible due to sandboxing.
    final cacheBase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cacheBase;

    return NativeDatabase.createInBackground(file);
  });
}
