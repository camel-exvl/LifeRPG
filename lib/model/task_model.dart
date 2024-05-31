import 'package:drift/drift.dart';
import 'package:liferpg/model/common_model.dart';

@DataClassName("TaskModel")
class TaskTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get order => integer()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  IntColumn get difficulty => intEnum<Difficulty>()();

  IntColumn get category => intEnum<Category>()();

  IntColumn get finishedCount => integer()();

  DateTimeColumn get lastFinishedAt => dateTime()();

  DateTimeColumn get createdAt => dateTime()();
}