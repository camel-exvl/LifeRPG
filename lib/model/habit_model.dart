import 'package:drift/drift.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/common_model.dart';

import '../database/database.dart';

enum HabitType { good, bad }

@DataClassName("HabitModel")
class HabitTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get order => integer()(); // order of the habit in the list

  TextColumn get title => text()();

  TextColumn get description => text()();

  IntColumn get difficulty => intEnum<Difficulty>()();

  IntColumn get category => intEnum<Category>()();

  IntColumn get type => intEnum<HabitType>()(); // good or bad habit

  IntColumn get finishedCount =>
      integer()(); // how many times the habit has been finished

  RealColumn get rewardCoefficient => real().withDefault(const Constant(1.0))();

  DateTimeColumn get lastFinishedAt => dateTime()();

  DateTimeColumn get createdAt => dateTime()();
}

extension HabitModelExtension on HabitModel {
  bool isEqual(HabitModel other) {
    return title == other.title &&
        description == other.description &&
        difficulty == other.difficulty &&
        category == other.category &&
        type == other.type;
  }
}

extension HabitTypeExtension on HabitType {
  String localizedString(context) {
    switch (this) {
      case HabitType.good:
        return AppLocalizations.of(context)!.good;
      case HabitType.bad:
        return AppLocalizations.of(context)!.bad;
    }
  }
}
