import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';

class StatusViewModel extends ChangeNotifier {
  static final StatusViewModel _instance = StatusViewModel._internal();

  factory StatusViewModel() => _instance;

  StatusViewModel._internal();

  final int lifeLevelMaxExp = 500;
  final int attributeMaxExp = 100;
  final database = AppDatabase();
  StatusModel _status = const StatusModel(
    id: 1,
    level: 1,
    exp: 0,
  );
  List<AttributeModel> _attributes = [];

  StatusModel get status => _status;

  UnmodifiableListView<AttributeModel> get attributes =>
      UnmodifiableListView(_attributes);

  Future<void> initOnFirstRun() async {
    await insertStatus(_status);

    _attributes = [
      AttributeModel(
        id: 1,
        statusId: _status.id,
        iconPath: "res/icons/attribute_strength.png",
        name: "Strength",
        level: 1,
        exp: 0,
      ),
      AttributeModel(
        id: 2,
        statusId: _status.id,
        iconPath: "res/icons/attribute_talent.png",
        name: "Talent",
        level: 1,
        exp: 0,
      ),
      AttributeModel(
        id: 3,
        statusId: _status.id,
        iconPath: "res/icons/attribute_culture.png",
        name: "Culture",
        level: 1,
        exp: 0,
      ),
      AttributeModel(
        id: 4,
        statusId: _status.id,
        iconPath: "res/icons/attribute_charisma.png",
        name: "Charisma",
        level: 1,
        exp: 0,
      ),
      AttributeModel(
        id: 5,
        statusId: _status.id,
        iconPath: "res/icons/attribute_environment.png",
        name: "Environment",
        level: 1,
        exp: 0,
      ),
      AttributeModel(
        id: 6,
        statusId: _status.id,
        iconPath: "res/icons/attribute_intellect.png",
        name: "Intellect",
        level: 1,
        exp: 0,
      ),
    ];
    notifyListeners();

    for (var attribute in _attributes) {
      await insertAttribute(attribute);
    }
  }

  Future<void> loadStatus() async {
    _status = await database.getStatus(1);
    notifyListeners();
  }

  Future<void> loadAttributes() async {
    _attributes = await database.getAllAttributes(_status.id);
    notifyListeners();
  }

  Future<void> insertStatus(StatusModel status) async {
    database.insertStatus(StatusTableCompanion(
      level: Value(status.level),
      exp: Value(status.exp),
    ));
  }

  Future<void> updateStatus(StatusModel status) async {
    _status = status;
    notifyListeners();
    database.updateStatus(status);
  }

  Future<void> removeStatus(StatusModel status) async {
    database.deleteStatus(status);
  }

  Future<void> insertAttribute(AttributeModel attribute) async {
    database.insertAttribute(AttributeTableCompanion(
      statusId: Value(attribute.statusId),
      iconPath: Value(attribute.iconPath),
      name: Value(attribute.name),
      level: Value(attribute.level),
      exp: Value(attribute.exp),
    ));
  }

  Future<void> updateAttribute(AttributeModel attribute) async {
    _attributes[_attributes
        .indexWhere((element) => element.id == attribute.id)] = attribute;
    notifyListeners();
    database.updateAttribute(attribute);
  }

  Future<void> removeAttribute(AttributeModel attribute) async {
    _attributes.remove(attribute);
    notifyListeners();
    database.deleteAttribute(attribute);
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
