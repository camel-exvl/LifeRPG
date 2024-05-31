import 'package:drift/drift.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/common_model.dart';

enum RepeatType { none, daily, weekly, monthly, yearly }

enum DayOfWeek {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday
}

TypeConverter<List<int>, String> repeatDaysConverter = TypeConverter.json(
  fromJson: (json) => (json as List).cast<int>(),
  toJson: (list) => list,
);

@DataClassName("TaskModel")
class TaskTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get order => integer()(); // order of the task in the list

  TextColumn get title => text()();

  TextColumn get description => text()();

  IntColumn get difficulty => intEnum<Difficulty>()();

  IntColumn get category => intEnum<Category>()();

  // repeat every {repeatValue} {repeatType} on {repeatDays}
  IntColumn get repeatType => intEnum<RepeatType>()();

  IntColumn get repeatValue => integer()();

  TextColumn get repeatDays => text().map(repeatDaysConverter)();

  IntColumn get finishedCount =>
      integer()(); // how many times the task has been finished

  DateTimeColumn get lastFinishedAt => dateTime()();

  DateTimeColumn get createdAt => dateTime()();
}

extension RepeatTypeExtension on RepeatType {
  String localizedString(context) {
    switch (this) {
      case RepeatType.none:
        return AppLocalizations.of(context)!.noRepeat;
      case RepeatType.daily:
        return AppLocalizations.of(context)!.day;
      case RepeatType.weekly:
        return AppLocalizations.of(context)!.week;
      case RepeatType.monthly:
        return AppLocalizations.of(context)!.month;
      case RepeatType.yearly:
        return AppLocalizations.of(context)!.year;
    }
  }
}

extension DayOfWeekExtension on DayOfWeek {
  String localizedString(context) {
    switch (this) {
      case DayOfWeek.sunday:
        return AppLocalizations.of(context)!.sunday;
      case DayOfWeek.monday:
        return AppLocalizations.of(context)!.monday;
      case DayOfWeek.tuesday:
        return AppLocalizations.of(context)!.tuesday;
      case DayOfWeek.wednesday:
        return AppLocalizations.of(context)!.wednesday;
      case DayOfWeek.thursday:
        return AppLocalizations.of(context)!.thursday;
      case DayOfWeek.friday:
        return AppLocalizations.of(context)!.friday;
      case DayOfWeek.saturday:
        return AppLocalizations.of(context)!.saturday;
    }
  }

  String localizedSingleString(context) {
    switch (this) {
      case DayOfWeek.sunday:
        return AppLocalizations.of(context)!.sundaySingle;
      case DayOfWeek.monday:
        return AppLocalizations.of(context)!.mondaySingle;
      case DayOfWeek.tuesday:
        return AppLocalizations.of(context)!.tuesdaySingle;
      case DayOfWeek.wednesday:
        return AppLocalizations.of(context)!.wednesdaySingle;
      case DayOfWeek.thursday:
        return AppLocalizations.of(context)!.thursdaySingle;
      case DayOfWeek.friday:
        return AppLocalizations.of(context)!.fridaySingle;
      case DayOfWeek.saturday:
        return AppLocalizations.of(context)!.saturdaySingle;
    }
  }
}