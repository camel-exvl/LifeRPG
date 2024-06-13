import 'dart:math';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Difficulty { easy, medium, hard }

enum Category { general, art, career, health, fun, learning, social }

enum Attribute {
  strength,
  talent,
  culture,
  charisma,
  environment,
  intelligence
}

enum MoneyType { gold, diamond }

enum LanguageType { system, en, zh }

enum BrightnessType { system, light, dark }

const attackPowerIconPath = 'res/icons/kyrise/sword_02c.png';

const defensePowerIconPath = 'res/icons/kyrise/shield_03b.png';

const hpIconPath = 'res/icons/heart.png';

extension DifficultyExtension on Difficulty {
  String localizedString(context) {
    switch (this) {
      case Difficulty.easy:
        return AppLocalizations.of(context)!.easy;
      case Difficulty.medium:
        return AppLocalizations.of(context)!.medium;
      case Difficulty.hard:
        return AppLocalizations.of(context)!.hard;
    }
  }

  String iconPath() {
    switch (this) {
      case Difficulty.easy:
        return 'res/icons/easy.png';
      case Difficulty.medium:
        return 'res/icons/medium.png';
      case Difficulty.hard:
        return 'res/icons/hard.png';
    }
  }

  double attackRatio(int finishedCount) {
    switch (this) {
      case Difficulty.easy:
        return 0.8 + log(finishedCount) / 12;
      case Difficulty.medium:
        return 1.0 + log(finishedCount) / 10;
      case Difficulty.hard:
        return 1.2 + log(finishedCount) / 8;
    }
  }
}

extension CategoryExtension on Category {
  String localizedString(context) {
    switch (this) {
      case Category.general:
        return AppLocalizations.of(context)!.general;
      case Category.art:
        return AppLocalizations.of(context)!.art;
      case Category.career:
        return AppLocalizations.of(context)!.career;
      case Category.health:
        return AppLocalizations.of(context)!.health;
      case Category.fun:
        return AppLocalizations.of(context)!.fun;
      case Category.learning:
        return AppLocalizations.of(context)!.learning;
      case Category.social:
        return AppLocalizations.of(context)!.social;
    }
  }
}

extension AttributeExtension on Attribute {
  String localizedString(context) {
    switch (this) {
      case Attribute.strength:
        return AppLocalizations.of(context)!.strength;
      case Attribute.talent:
        return AppLocalizations.of(context)!.talent;
      case Attribute.culture:
        return AppLocalizations.of(context)!.culture;
      case Attribute.charisma:
        return AppLocalizations.of(context)!.charisma;
      case Attribute.environment:
        return AppLocalizations.of(context)!.environment;
      case Attribute.intelligence:
        return AppLocalizations.of(context)!.intelligence;
    }
  }

  String iconPath() {
    switch (this) {
      case Attribute.strength:
        return 'res/icons/attribute_strength.png';
      case Attribute.talent:
        return 'res/icons/attribute_talent.png';
      case Attribute.culture:
        return 'res/icons/attribute_culture.png';
      case Attribute.charisma:
        return 'res/icons/attribute_charisma.png';
      case Attribute.environment:
        return 'res/icons/attribute_environment.png';
      case Attribute.intelligence:
        return 'res/icons/attribute_intelligence.png';
    }
  }
}

extension MoneyTypeExtension on MoneyType {
  String get iconPath {
    switch (this) {
      case MoneyType.gold:
        return 'res/icons/kyrise/coin_04d.png';
      case MoneyType.diamond:
        return 'res/icons/kyrise/crystal_01e.png';
    }
  }
}
