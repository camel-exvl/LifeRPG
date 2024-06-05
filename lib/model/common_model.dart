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

enum LanguageType { system, english, chinese }

enum BrightnessType { system, light, dark }

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
