import 'package:drift/drift.dart';

enum InstanceDungeonType { castle }

@DataClassName("InstanceDungeonModel")
class InstanceDungeonTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get instanceDungeonType => intEnum<InstanceDungeonType>()();
}
