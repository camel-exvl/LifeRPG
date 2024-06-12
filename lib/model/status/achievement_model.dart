import 'package:drift/drift.dart';

/// 代表一个成就信息
@DataClassName("AchievementModel")
class AchievementTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get nameZH => text()();

  TextColumn get nameEN => text()();

  TextColumn get descriptionZH => text()();

  TextColumn get descriptionEN => text()();
}