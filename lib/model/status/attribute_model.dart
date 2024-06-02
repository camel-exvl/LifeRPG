import 'package:drift/drift.dart';
import 'package:liferpg/model/status/status_model.dart';

/// 代表一个属性状态信息
@DataClassName("AttributeModel")
class AttributeTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get iconPath => text()();

  TextColumn get name => text()();

  IntColumn get level => integer()();

  IntColumn get exp => integer()();

  IntColumn get statusId => integer()();
}
