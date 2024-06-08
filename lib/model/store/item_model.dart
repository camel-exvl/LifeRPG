import 'package:drift/drift.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/common_model.dart';

enum ItemType { redPotion }

@DataClassName("ItemModel")
class ItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemType => intEnum<ItemType>()();
  IntColumn get moneyType => intEnum<MoneyType>()();
  IntColumn get price => integer()();
  IntColumn get stock => integer()();
}

extension ItemTypeExtension on ItemType {
  String name(context) {
    switch (this) {
      case ItemType.redPotion:
        return AppLocalizations.of(context)!.redPotion;
    }
  }

  String get iconPath {
    switch (this) {
      case ItemType.redPotion:
        return 'res/icons/kyrise/potion_01a.png';
    }
  }

  String description(context) {
    switch (this) {
      case ItemType.redPotion:
        return AppLocalizations.of(context)!.redPotionDescription;
    }
  }

  int get defensePower {
    switch (this) {
      case ItemType.redPotion:
        return 1;
    }
  }

  int get attackPower {
    switch (this) {
      case ItemType.redPotion:
        return 1;
    }
  }

  String get attackPowerIconPath => 'res/icons/kyrise/sword_02c.png';

  String get defensePowerIconPath => 'res/icons/kyrise/shield_03b.png';
}
