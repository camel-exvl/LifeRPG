import 'package:drift/drift.dart';

/// 代表一个人生状态信息
@DataClassName("StatusModel")
class StatusTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get level => integer()();

  IntColumn get exp => integer()();
}
