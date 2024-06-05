import 'package:drift/drift.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../common_model.dart';

enum EquipmentType {
  armor,
  arrow,
  boots,
  fruit,
  secretGift,
  magicHat,
  key,
  magicBook,
  necklace,
  potion,
  sword,
}

@DataClassName("EquipmentModel")
class EquipmentTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get equipmentType => intEnum<EquipmentType>()();

  IntColumn get moneyType => intEnum<MoneyType>()();

  IntColumn get price => integer()();

  IntColumn get stock => integer()();
}

extension EquipmentTypeExtension on EquipmentType {
  String name(context) {
    switch (this) {
      case EquipmentType.armor:
        return AppLocalizations.of(context)!.armor;
      case EquipmentType.arrow:
        return AppLocalizations.of(context)!.arrow;

      case EquipmentType.boots:
        return AppLocalizations.of(context)!.boots;
      case EquipmentType.fruit:
        return AppLocalizations.of(context)!.fruit;
      case EquipmentType.secretGift:
        return AppLocalizations.of(context)!.secretGift;
      case EquipmentType.magicHat:
        return AppLocalizations.of(context)!.magicHat;
      case EquipmentType.key:
        return AppLocalizations.of(context)!.key;
      case EquipmentType.magicBook:
        return AppLocalizations.of(context)!.magicBook;
      case EquipmentType.necklace:
        return AppLocalizations.of(context)!.necklace;
      case EquipmentType.potion:
        return AppLocalizations.of(context)!.potion;
      case EquipmentType.sword:
        return AppLocalizations.of(context)!.sword;
    }
  }

  String get iconPath {
    switch (this) {
      case EquipmentType.armor:
        return 'res/icons/kyrise/armor_01b.png';
      case EquipmentType.arrow:
        return 'res/icons/kyrise/arrow_01e.png';
      case EquipmentType.boots:
        return 'res/icons/kyrise/boots_01c.png';
      case EquipmentType.fruit:
        return 'res/icons/kyrise/fruit_01a.png';
      case EquipmentType.secretGift:
        return 'res/icons/kyrise/gift_01e.png';
      case EquipmentType.magicHat:
        return 'res/icons/kyrise/hat_01a.png';
      case EquipmentType.key:
        return 'res/icons/kyrise/key_02d.png';
      case EquipmentType.magicBook:
        return 'res/icons/kyrise/book_02g.png';
      case EquipmentType.necklace:
        return 'res/icons/kyrise/necklace_01d.png';
      case EquipmentType.potion:
        return 'res/icons/kyrise/potion_01a.png';
      case EquipmentType.sword:
        return 'res/icons/kyrise/sword_02c.png';
    }
  }

  String description(context) {
    switch (this) {
      case EquipmentType.armor:
        return AppLocalizations.of(context)!.armorDescription;
      case EquipmentType.arrow:
        return AppLocalizations.of(context)!.arrowDescription;
      case EquipmentType.boots:
        return AppLocalizations.of(context)!.bootsDescription;
      case EquipmentType.fruit:
        return AppLocalizations.of(context)!.fruitDescription;
      case EquipmentType.secretGift:
        return AppLocalizations.of(context)!.secretGiftDescription;
      case EquipmentType.magicHat:
        return AppLocalizations.of(context)!.magicHatDescription;
      case EquipmentType.key:
        return AppLocalizations.of(context)!.keyDescription;
      case EquipmentType.magicBook:
        return AppLocalizations.of(context)!.magicBookDescription;
      case EquipmentType.necklace:
        return AppLocalizations.of(context)!.necklaceDescription;
      case EquipmentType.potion:
        return AppLocalizations.of(context)!.potionDescription;
      case EquipmentType.sword:
        return AppLocalizations.of(context)!.swordDescription;
    }
  }
}
