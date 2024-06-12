import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/viewmodel/store_viewmodel.dart';
import 'dart:math' as math;

import '../model/common_model.dart';
import '../model/reward/reward_request_model.dart';
import '../model/reward/reward_response_model.dart';
import '../model/store/property_model.dart';
import '../model/target/habit_model.dart';
import '../model/store/equipment_model.dart';

class StatusViewModel extends ChangeNotifier {
  static final StatusViewModel _instance = StatusViewModel._internal();

  factory StatusViewModel() => _instance;

  StatusViewModel._internal();

  static const int baseAttack = 50;
  static const int expAttackCoefficient = 5;
  static const int baseDefense = 50;
  static const int expDefenseCoefficient = 5;
  static const int maxHP = 100;
  static const int easyExp = 12;
  static const int mediumExp = 24;
  static const int hardExp = 36;
  static const int easyGold = 15;
  static const int mediumGold = 25;
  static const int hardGold = 35;
  static const int bonusRepeatEasyExp = 1;
  static const int bonusRepeatMediumExp = 2;
  static const int bonusRepeatHardExp = 3;
  static const int bonusRepeatEasyGold = 1;
  static const int bonusRepeatMediumGold = 2;
  static const int bonusRepeatHardGold = 3;
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
      diamond: 0,
      hp: 100,
      weaponIds: "",
      armorIds: "",
      weaponIndex: null,
      armorIndex: null,
      achievementIds: "");
  List<AttributeModel> _attributes = [];
  List<EquipmentModel> _weapons = [];
  List<EquipmentModel> _armors = [];
  List<AchievementModel> _achievements = [];
  int attack = 0;
  int defense = 0;

  StatusModel get status => _status;

  UnmodifiableListView<AttributeModel> get attributes =>
      UnmodifiableListView(_attributes);

  UnmodifiableListView<EquipmentModel> get weapons =>
      UnmodifiableListView(_weapons);

  UnmodifiableListView<EquipmentModel> get armors =>
      UnmodifiableListView(_armors);

  UnmodifiableListView<AchievementModel> get achievements =>
      UnmodifiableListView(_achievements);

  Future<void> initOnFirstRun() async {
    await insertStatus(_status);

    _attributes = [
      AttributeModel(
        id: 1,
        statusId: _status.id,
        iconPath: "res/icons/attribute_strength.png",
        name: "strength",
        level: 1,
        exp: 0,
      ),
      AttributeModel(
        id: 2,
        statusId: _status.id,
        iconPath: "res/icons/attribute_talent.png",
        name: "talent",
        level: 1,
        exp: 0,
      ),
      AttributeModel(
        id: 3,
        statusId: _status.id,
        iconPath: "res/icons/attribute_culture.png",
        name: "culture",
        level: 1,
        exp: 0,
      ),
      AttributeModel(
        id: 4,
        statusId: _status.id,
        iconPath: "res/icons/attribute_charisma.png",
        name: "charisma",
        level: 1,
        exp: 0,
      ),
      AttributeModel(
        id: 5,
        statusId: _status.id,
        iconPath: "res/icons/attribute_environment.png",
        name: "environment",
        level: 1,
        exp: 0,
      ),
      AttributeModel(
        id: 6,
        statusId: _status.id,
        iconPath: "res/icons/attribute_intelligence.png",
        name: "intelligence",
        level: 1,
        exp: 0,
      ),
    ];
    _achievements = [
      const AchievementModel(
        id: 1,
        nameZH: "初次出击",
        nameEN: "First Strike",
        descriptionZH: "你已经成功完成了你的第一个任务，这是你旅程的第一步。",
        descriptionEN:
            "You have successfully completed your first task, this is the first step of your journey.",
      ),
      const AchievementModel(
        id: 2,
        nameZH: "习惯成自然",
        nameEN: "Habitual Success",
        descriptionZH: "你已经连续5次完成了一个习惯，这显示了你的毅力和决心。",
        descriptionEN:
            "You have completed a habit 5 times in a row, demonstrating your perseverance and determination.",
      ),
      const AchievementModel(
        id: 3,
        nameZH: "人生升级",
        nameEN: "Life Upgrade",
        descriptionZH: "你的人生等级已经达到2级，你的经验和技能正在不断增长。",
        descriptionEN:
            "Your life level has reached level 2, your experience and skills are constantly growing.",
      ),
      const AchievementModel(
        id: 4,
        nameZH: "力量觉醒",
        nameEN: "Power Awakening",
        descriptionZH: "你的力量等级已经达到2级，你的体能和力量正在不断增强。",
        descriptionEN:
            "Your power level has reached level 2, your physical strength and power are constantly increasing.",
      ),
      const AchievementModel(
        id: 5,
        nameZH: "才华横溢",
        nameEN: "Talent Overflow",
        descriptionZH: "你的才能等级已经达到2级，你的天赋和技巧正在不断提升。",
        descriptionEN:
            "Your talent level has reached level 2, your talents and skills are constantly improving.",
      ),
      const AchievementModel(
        id: 6,
        nameZH: "文化熏陶",
        nameEN: "Cultural Infusion",
        descriptionZH: "你的文化等级已经达到2级，你的知识和理解正在不断深化。",
        descriptionEN:
            "Your culture level has reached level 2, your knowledge and understanding are constantly deepening.",
      ),
      const AchievementModel(
        id: 7,
        nameZH: "魅力四射",
        nameEN: "Charismatic Radiance",
        descriptionZH: "你的魅力等级已经达到2级，你的吸引力和影响力正在不断增强。",
        descriptionEN:
            "Your charm level has reached level 2, your attractiveness and influence are constantly increasing.",
      ),
      const AchievementModel(
        id: 8,
        nameZH: "环境适应",
        nameEN: "Environmental Adaptation",
        descriptionZH: "你的环境等级已经达到2级，你的适应能力和环境意识正在不断提升。",
        descriptionEN:
            "Your environment level has reached level 2, your adaptability and environmental awareness are constantly improving.",
      ),
      const AchievementModel(
        id: 9,
        nameZH: "智力飞跃",
        nameEN: "Intellectual Leap",
        descriptionZH: "你的智力等级已经达到2级，你的思维和理解正在不断提升。",
        descriptionEN:
            "Your intelligence level has reached level 2, your thinking and understanding are constantly improving.",
      )
    ];
    notifyListeners();

    for (var attribute in _attributes) {
      await insertAttribute(attribute);
    }
    for (var achievement in _achievements) {
      await insertAchievement(achievement);
    }
  }

  Future<void> loadAll() async {
    await loadStatus();
    await loadAttributes();
    await loadWeaponList();
    await loadArmorList();
  }

  Future<void> loadStatus() async {
    _status = await database.getStatus(1);
    attack = await calculateAttack();
    defense = await calculateDefense();
    _achievements = await database.getAllAchievements();
    notifyListeners();
  }

  Future<void> loadAttributes() async {
    _attributes = await database.getAllAttributes(_status.id);
    notifyListeners();
  }

  Future<void> insertStatus(StatusModel status) async {
    database.insertStatus(status.toCompanion(false));
  }

  Future<void> updateStatus(StatusModel status) async {
    _status = status;
    notifyListeners();
    database.updateStatus(status);
  }

  Future<void> removeStatus(StatusModel status) async {
    database.deleteStatus(status);
  }

  Future<void> saveStatus() async {
    await updateStatus(_status);
  }

  Future<void> insertAttribute(AttributeModel attribute) async {
    database.insertAttribute(attribute.toCompanion(false));
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

  Future<void> saveAttribute() async {
    for (var attribute in _attributes) {
      await updateAttribute(attribute);
    }
  }

  Future<void> insertAchievement(AchievementModel achievement) async {
    await database.insertAchievement(achievement.toCompanion(false));
  }

  Future<void> updateAchievement(AchievementModel achievement) async {
    _achievements[_achievements
        .indexWhere((element) => element.id == achievement.id)] = achievement;
    notifyListeners();
    await database.updateAchievement(achievement);
  }

  Future<void> removeAchievement(AchievementModel achievement) async {
    _achievements.remove(achievement);
    notifyListeners();
    await database.deleteAchievement(achievement);
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
      case "strength":
        return AppLocalizations.of(context)!.strength;
      case "talent":
        return AppLocalizations.of(context)!.talent;
      case "culture":
        return AppLocalizations.of(context)!.culture;
      case "charisma":
        return AppLocalizations.of(context)!.charisma;
      case "environment":
        return AppLocalizations.of(context)!.environment;
      case "intelligence":
        return AppLocalizations.of(context)!.intelligence;
      default:
        return "Unknown";
    }
  }

  RewardResponseModel getReward(RewardRequestModel request) {
    final response = RewardResponseModel();
    double rewardCoefficient = request.rewardCoefficient;
    int totalExp = 0;
    int bonusExp = 0;
    int totalGold = 0;
    int bonusGold = 0;
    int badCoefficient;

    request.finishedCount++; // 接受请求时还没有加1

    if (request.habitType == null || request.habitType == HabitType.good) {
      badCoefficient = 1;
    } else {
      badCoefficient = -1;
    }

    if (DateTime.now().difference(request.lastFinishedAt) < clickLimitation) {
      bonusExp = 0;
      rewardCoefficient *= penaltyCoefficient;
      if (rewardCoefficient < lowestRewardCoefficient) {
        rewardCoefficient = lowestRewardCoefficient;
      }
    }

    switch (request.difficulty) {
      case Difficulty.easy:
        totalExp = easyExp;
        totalGold = easyGold;
        bonusExp =
            (math.log(request.finishedCount) * bonusRepeatEasyExp).round();
        bonusGold =
            (math.log(request.finishedCount) * bonusRepeatEasyGold).round();
        break;
      case Difficulty.medium:
        totalExp = mediumExp;
        totalGold = mediumGold;
        bonusExp =
            (math.log(request.finishedCount) * bonusRepeatMediumExp).round();
        bonusGold =
            (math.log(request.finishedCount) * bonusRepeatMediumGold).round();
        break;
      case Difficulty.hard:
        totalExp = hardExp;
        totalGold = hardGold;
        bonusExp =
            (math.log(request.finishedCount) * bonusRepeatHardExp).round();
        bonusGold =
            (math.log(request.finishedCount) * bonusRepeatHardGold).round();
        break;
    }
    totalExp += bonusExp;
    totalGold += bonusGold;

    switch (request.category) {
      case Category.general:
        response.expMap.forEach((key, value) => response.expMap[key] =
            (badCoefficient * totalExp * rewardCoefficient / 6).round());
        break;
      case Category.art:
        response.expMap[Attribute.talent] =
            (badCoefficient * totalExp * 0.6 * rewardCoefficient).round();
        response.expMap[Attribute.culture] =
            (badCoefficient * totalExp * 0.2 * rewardCoefficient).round();
        response.expMap[Attribute.charisma] =
            (badCoefficient * totalExp * 0.2 * rewardCoefficient).round();
        break;
      case Category.career:
        response.expMap[Attribute.intelligence] =
            (badCoefficient * totalExp * 0.6 * rewardCoefficient).round();
        response.expMap[Attribute.talent] =
            (badCoefficient * totalExp * 0.4 * rewardCoefficient).round();
        break;
      case Category.health:
        response.expMap[Attribute.strength] =
            (badCoefficient * totalExp * 0.6 * rewardCoefficient).round();
        response.expMap[Attribute.charisma] =
            (badCoefficient * totalExp * 0.4 * rewardCoefficient).round();
        break;
      case Category.fun:
        response.expMap[Attribute.talent] =
            (badCoefficient * totalExp * 0.6 * rewardCoefficient).round();
        response.expMap[Attribute.intelligence] =
            (badCoefficient * totalExp * 0.4 * rewardCoefficient).round();
        break;
      case Category.learning:
        response.expMap[Attribute.intelligence] =
            (badCoefficient * totalExp * 0.6 * rewardCoefficient).round();
        response.expMap[Attribute.culture] =
            (badCoefficient * totalExp * 0.4 * rewardCoefficient).round();
        break;
      case Category.social:
        response.expMap[Attribute.environment] =
            (badCoefficient * totalExp * 0.6 * rewardCoefficient).round();
        response.expMap[Attribute.charisma] =
            (badCoefficient * totalExp * 0.4 * rewardCoefficient).round();
        break;
    }

    totalGold = (badCoefficient * totalGold * rewardCoefficient).round();
    response.gold = totalGold;
    response.penaltyCoefficient = rewardCoefficient;

    updateAfterReward(response);

    List<int> newAchievedAchievementIds = [];
    newAchievedAchievementIds.addAll(achievementTypeCount(request));
    newAchievedAchievementIds.addAll(achievementTypeLevel());

    for (var achievementId in newAchievedAchievementIds) {
      addAchievement(achievementId);
    }
    saveStatus();
    saveAttribute();

    // 商店页要更新
    StoreViewModel storeViewModel = StoreViewModel();
    storeViewModel.loadProperties();

    notifyListeners();
    return response;
  }

  void updateAfterReward(RewardResponseModel response) {
    int newGold = _status.gold + response.gold;
    int newLifeLevel = _status.level;
    int newLifeExp =
        _status.exp + response.expMap.values.reduce((a, b) => a + b);

    for (var entry in response.expMap.entries) {
      if (entry.value != 0) {
        int newAttributeExp = entry.value +
            _attributes
                .firstWhere((element) => element.name == entry.key.name)
                .exp;
        int newAttributeLevel = _attributes
            .firstWhere((element) => element.name == entry.key.name)
            .level;
        if (newAttributeExp < 0) {
          newLifeExp -= newAttributeExp;
          newAttributeExp = 0;
        } else {
          while (newAttributeExp >= getAttributeMaxExp(newAttributeLevel)) {
            newAttributeExp -= getAttributeMaxExp(newAttributeLevel);
            newAttributeLevel++;
          }
        }
        final newAttribute = _attributes
            .firstWhere((element) => element.name == entry.key.name)
            .copyWith(
              level: newAttributeLevel,
              exp: newAttributeExp,
            );
        _attributes[_attributes.indexWhere(
            (element) => element.id == newAttribute.id)] = newAttribute;
      }
    }

    while (newLifeExp < 0) {
      newLifeLevel--;
      newLifeExp += getLifeLevelMaxExp(newLifeLevel);
    }
    while (newLifeExp >= getLifeLevelMaxExp(newLifeLevel)) {
      newLifeExp -= getLifeLevelMaxExp(newLifeLevel);
      newLifeLevel++;
    }
    final newStatus = _status.copyWith(
      level: newLifeLevel,
      exp: newLifeExp,
      gold: newGold,
    );
    _status = newStatus;
  }

  void addWeapon(int newWeaponId) {
    if (_status.weaponIds.isEmpty) {
      _status = _status.copyWith(weaponIds: newWeaponId.toString());
      updateStatus(_status);
    } else {
      var weaponIds = _status.weaponIds.split(",");
      weaponIds.add(newWeaponId.toString());
      _status = _status.copyWith(weaponIds: weaponIds.join(","));
      updateStatus(_status);
    }
  }

  List<int> getWeaponIds() {
    if (_status.weaponIds.isEmpty) {
      return [];
    }
    return _status.weaponIds
        .split(",")
        .where((item) => item.isNotEmpty)
        .map(int.parse)
        .toList();
  }

  Future<void> loadWeaponList() async {
    if (_status.weaponIds.isEmpty) {
      _weapons = [];
    } else {
      final weaponList = <EquipmentModel>[];
      for (var weaponId in _status.weaponIds
          .split(",")
          .where((item) => item.isNotEmpty)
          .map(int.parse)
          .toList()) {
        weaponList.add(await database.getEquipmentById(weaponId));
      }
      _weapons = weaponList;
      notifyListeners();
    }
  }

  Future<void> equipWeapon(int weaponIndex) async {
    _status = _status.copyWith(weaponIndex: Value<int?>(weaponIndex));
    attack = await calculateAttack();
    defense = await calculateDefense();
    notifyListeners();
    updateStatus(_status);
  }

  Future<void> removeWeapon() async {
    _status = _status.copyWith(weaponIndex: const Value<int?>(null));
    attack = await calculateAttack();
    defense = await calculateDefense();
    notifyListeners();
    updateStatus(_status);
  }

  void addArmor(int newArmorId) {
    if (_status.armorIds.isEmpty) {
      _status = _status.copyWith(armorIds: newArmorId.toString());
      updateStatus(_status);
    } else {
      var armorIds = _status.armorIds.split(",");
      armorIds.add(newArmorId.toString());
      _status = _status.copyWith(armorIds: armorIds.join(","));
      updateStatus(_status);
    }
  }

  List<int> getArmorIds() {
    if (_status.weaponIds.isEmpty) {
      return [];
    }
    return _status.armorIds
        .split(",")
        .where((item) => item.isNotEmpty)
        .map(int.parse)
        .toList();
  }

  Future<void> loadArmorList() async {
    if (_status.armorIds.isEmpty) {
      _armors = [];
    } else {
      final armorList = <EquipmentModel>[];
      for (var armorId in _status.armorIds
          .split(",")
          .where((item) => item.isNotEmpty)
          .map(int.parse)
          .toList()) {
        armorList.add(await database.getEquipmentById(armorId));
      }
      _armors = armorList;
      notifyListeners();
    }
  }

  Future<void> equipArmor(int armorIndex) async {
    _status = _status.copyWith(armorIndex: Value<int?>(armorIndex));
    attack = await calculateAttack();
    defense = await calculateDefense();
    notifyListeners();
    updateStatus(_status);
  }

  Future<void> removeArmor() async {
    _status = _status.copyWith(armorIndex: const Value<int?>(null));
    attack = await calculateAttack();
    defense = await calculateDefense();
    notifyListeners();
    updateStatus(_status);
  }

  int getHP() {
    return _status.hp;
  }

  void updateHP(int hp_) {
    var newHP = _status.hp + hp_;
    if (newHP <= 0) {
      return;
    } else if (newHP >= maxHP) {
      newHP = maxHP;
    }
    _status = _status.copyWith(hp: newHP);
    updateStatus(_status);
  }

  Future<int> calculateAttack() async {
    int expAttack = _status.level * expAttackCoefficient;
    int weaponAttack = _status.weaponIndex == null
        ? 0
        : await database
            .getEquipmentById(getWeaponIds()[_status.weaponIndex!])
            .then((value) => value.equipmentType.attackPower);
    return baseAttack + expAttack + weaponAttack;
  }

  Future<int> calculateDefense() async {
    int expDefense = _status.level * expDefenseCoefficient;
    int armorDefense = _status.armorIndex == null
        ? 0
        : await database
            .getEquipmentById(getArmorIds()[_status.armorIndex!])
            .then((value) => value.equipmentType.defensePower);
    return baseDefense + expDefense + armorDefense;
  }

  int getAttack() {
    return attack;
  }

  int getDefense() {
    return defense;
  }

  List<PropertyModel> getProperties() {
    return [
      PropertyModel(
        id: 1,
        moneyType: MoneyType.gold,
        amount: _status.gold,
      ),
      // PropertyModel(
      //   id: 2,
      //   moneyType: MoneyType.diamond,
      //   amount: _status.diamond,
      // ),
    ];
  }

  Future<void> updateProperty(PropertyModel property) async {
    if (property.moneyType == MoneyType.gold) {
      _status = _status.copyWith(gold: property.amount);
    } else if (property.moneyType == MoneyType.diamond) {
      _status = _status.copyWith(diamond: property.amount);
    }
    updateStatus(_status);
  }

  Set<int> getAchievedAchievementIds() {
    return _status.achievementIds.isEmpty
        ? {}
        : _status.achievementIds
            .split(",")
            .where((item) => item.isNotEmpty)
            .map(int.parse)
            .toSet();
  }

  List<AchievementModel> getDisplayAchievements() {
    int count = 8;
    Set<int> achievedAchievementIds = getAchievedAchievementIds();
    if (_achievements.length < count) {
      count = _achievements.length;
    }

    List<AchievementModel> temp = [];

    for (var i = 0; i < _achievements.length; i++) {
      if (achievedAchievementIds.contains(_achievements[i].id)) {
        temp.add(_achievements[i]);
      }
      if (temp.length == count) {
        return temp;
      }
    }

    for (var i = 0; i < _achievements.length; i++) {
      temp.add(_achievements
          .where((element) => !achievedAchievementIds.contains(element.id))
          .elementAt(i));
      if (temp.length == count) {
        return temp;
      }
    }
    return temp;
  }

  void addAchievement(int newAchievementId) {
    if (_status.achievementIds.isEmpty) {
      _status = _status.copyWith(achievementIds: newAchievementId.toString());
      updateStatus(_status);
    } else {
      var achievementIds = _status.achievementIds.split(",");
      achievementIds.add(newAchievementId.toString());
      _status = _status.copyWith(achievementIds: achievementIds.join(","));
      updateStatus(_status);
    }
  }

  List<int> achievementTypeCount(RewardRequestModel request) {
    List<int> ret = [];
    if (request.habitType == null) {
      if (!getAchievedAchievementIds().contains(1)) {
        ret.add(1);
      }
    } else {
      if (request.finishedCount == 5) {
        if (!getAchievedAchievementIds().contains(2)) {
          ret.add(2);
        }
      }
    }
    return ret;
  }

  List<int> achievementTypeLevel() {
    Set<int> achievedAchievementIds = getAchievedAchievementIds();
    List<int> ret = [];

    if (_status.level == 2) {
      if (!achievedAchievementIds.contains(3)) {
        ret.add(3);
      }
    }
    for (var attribute in _attributes) {
      if (attribute.level == 2) {
        switch (attribute.name) {
          case "strength":
            if (!achievedAchievementIds.contains(4)) {
              ret.add(4);
            }
            break;
          case "talent":
            if (!achievedAchievementIds.contains(5)) {
              ret.add(5);
            }
            break;
          case "culture":
            if (!achievedAchievementIds.contains(6)) {
              ret.add(6);
            }
            break;
          case "charisma":
            if (!achievedAchievementIds.contains(7)) {
              ret.add(7);
            }
            break;
          case "environment":
            if (!achievedAchievementIds.contains(8)) {
              ret.add(8);
            }
            break;
          case "intelligence":
            if (!achievedAchievementIds.contains(9)) {
              ret.add(9);
            }
            break;
        }
      }
    }
    return ret;
  }
}
