import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../model/common_model.dart';
import '../model/habit_model.dart';
import '../model/task_model.dart';

part 'database.g.dart';

@DriftDatabase(tables: [HabitTable, TaskTable])
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

  // Task
  Future<List<TaskModel>> getAllTasks() async {
    return (select(taskTable)
          ..orderBy([(t) => OrderingTerm(expression: t.order)]))
        .get();
  }

  Future<int> insertTask(TaskTableCompanion task) =>
      into(taskTable).insert(task);

  Future<void> updateTask(TaskModel task) =>
      update(taskTable).replace(task);

  Future<void> deleteTask(TaskModel task) =>
      delete(taskTable).delete(task);
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
