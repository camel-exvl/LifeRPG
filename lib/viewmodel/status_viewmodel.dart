import 'package:flutter/material.dart';
import '../model/status_model.dart';
import '../model/attribute_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatusViewModel extends ChangeNotifier {
  StatusModel statusModel;

  StatusViewModel() : statusModel = StatusModel(
    level: 1,
    levelExpMap: {1: 100, 2: 200, 3: 300},
    exp: 10,
    attributes: {
      "Strength":
      AttributeModel(
        iconPath: 'res/icons/attribute_strength.png',
        name: "Strength",
        levelExpMap: {1: 100, 2: 200, 3: 300},
        level: 1,
        exp: 10,
      ),
      "Talent":
      AttributeModel(
        iconPath: 'res/icons/attribute_talent.png',
        name: 'Talent',
        levelExpMap: {1: 100, 2: 200, 3: 300},
        level: 1,
        exp: 10,
      ),
      "Culture":
      AttributeModel(
        iconPath: 'res/icons/attribute_culture.png',
        name: 'Culture',
        levelExpMap: {1: 100, 2: 200, 3: 300},
        level: 1,
        exp: 20,
      ),
      "Charisma":
      AttributeModel(
        iconPath: 'res/icons/attribute_charisma.png',
        name: 'Charisma',
        levelExpMap: {1: 100, 2: 200, 3: 300},
        level: 1,
        exp: 30,
      ),
      "Environment":
      AttributeModel(
        iconPath: 'res/icons/attribute_environment.png',
        name: 'Environment',
        levelExpMap: {1: 100, 2: 200, 3: 300},
        level: 1,
        exp: 40,
      ),
      "Intellect":
      AttributeModel(
        iconPath: 'res/icons/attribute_intellect.png',
        name: 'Intellect',
        levelExpMap: {1: 100, 2: 200, 3: 300},
        level: 2,
        exp: 40,
      ),
    },
  );

  double getExpPercent() {
    return statusModel.exp / (statusModel.levelExpMap[statusModel.level] ?? 99999);
  }

  String getAttributeName(String key, BuildContext context) {
    switch(key) {
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