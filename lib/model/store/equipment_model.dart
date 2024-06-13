import 'package:drift/drift.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';

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

  int get attackPower {
    switch (this) {
      case EquipmentType.armor:
        return 10;
      case EquipmentType.arrow:
        return 5;
      case EquipmentType.boots:
        return 2;
      case EquipmentType.fruit:
        return 0;
      case EquipmentType.secretGift:
        return 0;
      case EquipmentType.magicHat:
        return 3;
      case EquipmentType.key:
        return 0;
      case EquipmentType.magicBook:
        return 7;
      case EquipmentType.necklace:
        return 1;
      case EquipmentType.potion:
        return 0;
      case EquipmentType.sword:
        return 15;
    }
  }

  int get defensePower {
    switch (this) {
      case EquipmentType.armor:
        return 20;
      case EquipmentType.arrow:
        return 0;
      case EquipmentType.boots:
        return 5;
      case EquipmentType.fruit:
        return 0;
      case EquipmentType.secretGift:
        return 0;
      case EquipmentType.magicHat:
        return 8;
      case EquipmentType.key:
        return 0;
      case EquipmentType.magicBook:
        return 10;
      case EquipmentType.necklace:
        return 3;
      case EquipmentType.potion:
        return 0;
      case EquipmentType.sword:
        return 5;
    }
  }

  String get attackPowerIconPath => 'res/icons/kyrise/sword_02c.png';

  String get defensePowerIconPath => 'res/icons/kyrise/shield_03b.png';
}

class StoreChallengeModel extends ChallengeModel {
  String imageInStorePath;

  int price;

  StoreChallengeModel({
    required this.imageInStorePath,
    required this.price,
    required super.id,
    required super.name,
    required super.description,
    required super.imagePath,
    required super.bossName,
    required super.totalHp,
    required super.curHp,
    required super.attack,
    required super.defense,
    required super.rewardGold,
    required super.log,
  });
}
