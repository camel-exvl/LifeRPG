import 'package:drift/drift.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ItemType {
  fruit,
  secretGift,
  key,
  potion,
}

@DataClassName("ItemModel")
class ItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get type => intEnum<ItemType>().nullable()();

  TextColumn get iconPath => text().nullable()();

  // default is MoneyType.gold
  IntColumn get moneyType =>
      intEnum<MoneyType>().withDefault(Constant(MoneyType.gold.index))();

  IntColumn get price => integer()();

  IntColumn get stock => integer()();

  IntColumn get boughtNum => integer().withDefault(const Constant(0))();

  BoolColumn get isCustomized => boolean().withDefault(const Constant(false))();

  TextColumn get name => text().nullable()();

  TextColumn get description => text().nullable()();

  // IntColumn get attackPower => integer().withDefault(const Constant(0))();

  // IntColumn get defensePower => integer().withDefault(const Constant(0))();
}

extension ItemTypeExtension on ItemType {
  String name(context) {
    switch (this) {
      case ItemType.fruit:
        return AppLocalizations.of(context)!.fruit;
      case ItemType.secretGift:
        return AppLocalizations.of(context)!.secretGift;
      case ItemType.key:
        return AppLocalizations.of(context)!.key;
      case ItemType.potion:
        return AppLocalizations.of(context)!.potion;
    }
  }

  String description(context) {
    switch (this) {
      case ItemType.fruit:
        return AppLocalizations.of(context)!.fruitDescription;
      case ItemType.secretGift:
        return AppLocalizations.of(context)!.secretGiftDescription;
      case ItemType.key:
        return AppLocalizations.of(context)!.keyDescription;
      case ItemType.potion:
        return AppLocalizations.of(context)!.potionDescription;
    }
  }
}
