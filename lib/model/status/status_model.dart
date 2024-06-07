import 'package:drift/drift.dart';

/// 代表一个人生状态信息
@DataClassName("StatusModel")
class StatusTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get level => integer()();

  IntColumn get exp => integer()();

  IntColumn get gold => integer()();

  IntColumn get hp => integer()();

  TextColumn get weaponIds => text().withDefault(const Constant(''))();

  TextColumn get armorIds => text().withDefault(const Constant(''))();

  IntColumn get weaponIndex => integer().nullable()();

  IntColumn get armorIndex => integer().nullable()();
}
