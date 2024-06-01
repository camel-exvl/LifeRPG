import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';

class StatusViewModel extends ChangeNotifier {
  static final StatusViewModel _instance = StatusViewModel._internal();

  factory StatusViewModel() => _instance;

  StatusViewModel._internal();

  final int statusId = 1;
  final int lifeLevelMaxExp = 500;
  final int attributeMaxExp = 100;
  final database = AppDatabase();
  late StatusModel _status;
  List<AttributeModel> _attributes = [];

  StatusModel get status => _status;

  UnmodifiableListView<AttributeModel> get attributes =>
      UnmodifiableListView(_attributes);

  Future<void> initOnFirstRun() async {
    _status = StatusModel(
      id: statusId,
      level: 1,
      exp: 0,
    );
    notifyListeners();

    await database.insertStatus(StatusTableCompanion(
      id: Value(statusId),
      level: const Value(1),
      exp: const Value(0),
    ));


    List<AttributeTableCompanion> defaultAttributes = [
      const AttributeTableCompanion(
        statusId: Value(1),
        iconPath: Value("res/icons/attribute_strength.png"),
        name: Value("Strength"),
        level: Value(1),
        exp: Value(0),
      ),
      const AttributeTableCompanion(
        statusId: Value(1),
        iconPath: Value("res/icons/attribute_talent.png"),
        name: Value("Talent"),
        level: Value(1),
        exp: Value(0),
      ),
      const AttributeTableCompanion(
        statusId: Value(1),
        iconPath: Value("res/icons/attribute_culture.png"),
        name: Value("Culture"),
        level: Value(1),
        exp: Value(0),
      ),
      const AttributeTableCompanion(
        statusId: Value(1),
        iconPath: Value("res/icons/attribute_charisma.png"),
        name: Value("Charisma"),
        level: Value(1),
        exp: Value(0),
      ),
      const AttributeTableCompanion(
        statusId: Value(1),
        iconPath: Value("res/icons/attribute_environment.png"),
        name: Value("Environment"),
        level: Value(1),
        exp: Value(0),
      ),
      const AttributeTableCompanion(
        statusId: Value(1),
        iconPath: Value("res/icons/attribute_intellect.png"),
        name: Value("Intellect"),
        level: Value(1),
        exp: Value(0),
      ),
    ];

    for (var attribute in defaultAttributes) {
      await database.insertAttribute(attribute);
    }
  }

  Future<void> loadStatus() async {
    _status = await database.getStatus(1);
    notifyListeners();
  }

  Future<void> loadAttributes() async {
    _attributes = await database.getAllAttributes(statusId);
    notifyListeners();
  }

  Future<void> insertStatus(StatusModel status) async {
    database.insertStatus(StatusTableCompanion(
      level: Value(status.level),
      exp: Value(status.exp),
    ));
    notifyListeners();
  }

  Future<void> updateStatus(StatusModel status) async {
    _status = status;
    notifyListeners();
    database.updateStatus(status);
  }

  Future<void> removeStatus(StatusModel status) async {
    database.deleteStatus(status);
  }

  double getExpPercent() {
    return _status.exp / getLifeLevelMaxExp(_status.level);
  }

  int getLifeLevelMaxExp(int level) {
    return level * lifeLevelMaxExp;
  }

  int getAttributeMaxExp(int level) {
    return level * attributeMaxExp;
  }

  String getAttributeName(String key, BuildContext context) {
    switch (key) {
      case "Strength":
        return AppLocalizations.of(context)!.strength;
      case "Talent":
        return AppLocalizations.of(context)!.talent;
      case "Culture":
        return AppLocalizations.of(context)!.culture;
      case "Charisma":
        return AppLocalizations.of(context)!.charisma;
      case "Environment":
        return AppLocalizations.of(context)!.environment;
      case "Intellect":
        return AppLocalizations.of(context)!.intellect;
      default:
        return "Unknown";
    }
  }
}
