import 'package:drift/drift.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/common_model.dart';

enum HabitType { good, bad }

@DataClassName("HabitModel")
class HabitTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get order => integer()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  IntColumn get difficulty => intEnum<Difficulty>()();

  IntColumn get category => intEnum<Category>()();

  IntColumn get type => intEnum<HabitType>()();

  IntColumn get finishedCount => integer()();

  DateTimeColumn get lastFinishedAt => dateTime()();

  DateTimeColumn get createdAt => dateTime()();
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
