import 'package:flutter/material.dart';
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

  Image icon(context) {
    switch (this) {
      case Attribute.strength:
        return Image(
            image: const AssetImage('res/icons/attribute_strength.png'),
            width: Theme.of(context).iconTheme.size,
            height: Theme.of(context).iconTheme.size);
      case Attribute.talent:
        return Image(
            image: const AssetImage('res/icons/attribute_talent.png'),
            width: Theme.of(context).iconTheme.size,
            height: Theme.of(context).iconTheme.size);
      case Attribute.culture:
        return Image(
            image: const AssetImage('res/icons/attribute_culture.png'),
            width: Theme.of(context).iconTheme.size,
            height: Theme.of(context).iconTheme.size);
      case Attribute.charisma:
        return Image(
            image: const AssetImage('res/icons/attribute_charisma.png'),
            width: Theme.of(context).iconTheme.size,
            height: Theme.of(context).iconTheme.size);
      case Attribute.environment:
        return Image(
            image: const AssetImage('res/icons/attribute_environment.png'),
            width: Theme.of(context).iconTheme.size,
            height: Theme.of(context).iconTheme.size);
      case Attribute.intelligence:
        return Image(
            image: const AssetImage('res/icons/attribute_intelligence.png'),
            width: Theme.of(context).iconTheme.size,
            height: Theme.of(context).iconTheme.size);
    }
  }
}
