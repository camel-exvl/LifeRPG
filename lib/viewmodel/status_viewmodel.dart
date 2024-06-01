import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';

import '../model/reward/reward_request_model.dart';
import '../model/reward/reward_response_model.dart';
import '../model/target/common_model.dart';

class StatusViewModel extends ChangeNotifier {
  static final StatusViewModel _instance = StatusViewModel._internal();

  factory StatusViewModel() => _instance;

  StatusViewModel._internal();

  static const int easyExp = 12;
  static const int mediumExp = 24;
  static const int hardExp = 36;
  static const int easyGold = 15;
  static const int mediumGold = 25;
  static const int hardGold = 35;
  static const int maxRewardCount = 5;
  static const int bonusRepeatExp = 3;
  static const int bonusRepeatGold = 5;
  static const double lowestRewardCoefficient = 0.6;
  static const Duration clickLimitation = Duration(minutes: 5);
  static const double penaltyCoefficient = 0.95;
  static const int lifeLevelMaxExp = 500;
  static const int attributeMaxExp = 100;

  final database = AppDatabase();
  StatusModel _status = const StatusModel(
    id: 1,
    level: 1,
    exp: 0,
    gold: 0,
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
      gold: Value(status.gold),
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

  RewardResponseModel getReward(RewardRequestModel request) {
    final response = RewardResponseModel();
    double rewardCoefficient = request.rewardCoefficient;
    int totalExp;
    int bonusExp = 0;
    int totalGold = 0;
    int bonusGold = 0;

    if (DateTime.now().difference(request.lastFinishedAt) < clickLimitation) {
      bonusExp = 0;
      rewardCoefficient *= penaltyCoefficient;
      if (rewardCoefficient < lowestRewardCoefficient) {
        rewardCoefficient = lowestRewardCoefficient;
      }
    } else {
      bonusExp = request.finishedCount > maxRewardCount
          ? maxRewardCount * bonusRepeatExp
          : request.finishedCount * bonusRepeatExp;
      bonusGold = request.finishedCount > maxRewardCount
          ? maxRewardCount * bonusRepeatGold
          : request.finishedCount * bonusRepeatGold;
    }

    switch (request.difficulty) {
      case Difficulty.easy:
        totalExp = easyExp;
        totalGold = easyGold;
        break;
      case Difficulty.medium:
        totalExp = mediumExp;
        totalGold = mediumGold;
        break;
      case Difficulty.hard:
        totalExp = hardExp;
        totalGold = hardGold;
        break;
    }
    totalExp += bonusExp;
    totalGold += bonusGold;

    switch (request.category) {
      case Category.general:
        response.expMap.forEach((key, value) =>
            response.expMap[key] = (totalExp * rewardCoefficient / 6).round());
        break;
      case Category.art:
        response.expMap["Talent"] =
            (totalExp * 0.6 * rewardCoefficient).round();
        response.expMap["Culture"] =
            (totalExp * 0.2 * rewardCoefficient).round();
        response.expMap["Charisma"] =
            (totalExp * 0.2 * rewardCoefficient).round();
        break;
      case Category.career:
        response.expMap["Intellect"] =
            (totalExp * 0.6 * rewardCoefficient).round();
        response.expMap["Talent"] =
            (totalExp * 0.4 * rewardCoefficient).round();
        break;
      case Category.health:
        response.expMap["Strength"] =
            (totalExp * 0.6 * rewardCoefficient).round();
        response.expMap["Charisma"] =
            (totalExp * 0.4 * rewardCoefficient).round();
        break;
      case Category.fun:
        response.expMap["Talent"] =
            (totalExp * 0.6 * rewardCoefficient).round();
        response.expMap["Intellect"] =
            (totalExp * 0.4 * rewardCoefficient).round();
        break;
      case Category.learning:
        response.expMap["Intellect"] =
            (totalExp * 0.6 * rewardCoefficient).round();
        response.expMap["Culture"] =
            (totalExp * 0.4 * rewardCoefficient).round();
        break;
      case Category.social:
        response.expMap["Environment"] =
            (totalExp * 0.6 * rewardCoefficient).round();
        response.expMap["Charisma"] =
            (totalExp * 0.4 * rewardCoefficient).round();
        break;
    }

    totalGold = (totalGold * rewardCoefficient).round();
    response.gold = totalGold;

    updateAfterReward(response);
    return response;
  }

  Future<void> updateAfterReward(RewardResponseModel response) async {
    int newGold = _status.gold + response.gold;
    int newLifeLevel = _status.level;
    int newLifeExp =
        _status.exp + response.expMap.values.reduce((a, b) => a + b);
    while (newLifeExp >= getLifeLevelMaxExp(newLifeLevel)) {
      newLifeExp -= getLifeLevelMaxExp(newLifeLevel);
      newLifeLevel++;
    }
    final newStatus = _status.copyWith(
      level: newLifeLevel,
      exp: newLifeExp,
      gold: newGold,
    );
    updateStatus(newStatus);

    for (var entry in response.expMap.entries) {
      if (entry.value != 0) {
        int newAttributeExp = entry.value +
            _attributes.firstWhere((element) => element.name == entry.key).exp;
        int newAttributeLevel = _attributes
            .firstWhere((element) => element.name == entry.key)
            .level;
        while (newAttributeExp >= getAttributeMaxExp(newAttributeLevel)) {
          newAttributeExp -= getAttributeMaxExp(newAttributeLevel);
          newAttributeLevel++;
        }
        final newAttribute = _attributes
            .firstWhere((element) => element.name == entry.key)
            .copyWith(
              level: newAttributeLevel,
              exp: newAttributeExp,
            );
        updateAttribute(newAttribute);
      }
    }
  }
}
