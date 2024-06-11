import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';

// the challenge that user has bought
@DataClassName("ChallengeModel")
class ChallengeTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  TextColumn get imagePath => text()();

  TextColumn get bossName => text()();

  IntColumn get totalHp => integer()();

  IntColumn get curHp => integer()();

  IntColumn get attack => integer()();

  IntColumn get defense => integer()();

  IntColumn get rewardGold => integer()();

  TextColumn get log => text().map(const JsonArrayConverter()).nullable()();
}

class JsonArrayConverter
    extends TypeConverter<List<Map<String, dynamic>>, String> {
  const JsonArrayConverter();

  @override
  List<Map<String, dynamic>> fromSql(String fromDb) {
    return (json.decode(fromDb) as List)
        .map((item) => item as Map<String, dynamic>)
        .toList();
  }

  @override
  String toSql(List<Map<String, dynamic>> value) {
    return json.encode(value);
  }
}

ChallengeModel getChallengeLocalizedString(
    BuildContext context, ChallengeModel challenge) {
  Map<String, ChallengeTableCompanion> map = {
    "dragonLair": ChallengeTableCompanion(
      name: Value(AppLocalizations.of(context)!.dragonLair),
      description: Value(AppLocalizations.of(context)!.dragonLairDescription),
      bossName: Value(AppLocalizations.of(context)!.dragonLairBoss),
    )
  };
  assert(map[challenge.name] != null,
      'Challenge name not found in localization map');
  return challenge.copyWith(
      name: map[challenge.name]!.name.value,
      description: map[challenge.name]!.description.value,
      bossName: map[challenge.name]!.bossName.value);
}
