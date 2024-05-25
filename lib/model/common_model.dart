import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Difficulty { easy, medium, hard }

enum Category { general, art, career, health, fun, learning, social }

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