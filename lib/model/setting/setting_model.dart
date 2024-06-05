import 'package:drift/drift.dart';

/// 记录系统设置
@DataClassName("SettingModel")
class SettingTable extends Table {
  IntColumn get languageType => integer()();

  IntColumn get brightnessType => integer()();
}