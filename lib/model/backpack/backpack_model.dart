import 'package:drift/drift.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/store/equipment_model.dart';
import 'package:liferpg/model/store/instance_dungeon_model.dart';
import 'package:liferpg/model/store/item_model.dart';

enum BackpackItemType {
  equipment,
  item,
  instanceDungeon,
}

extension BackpackItemTypeExtension on BackpackItemType {
  static BackpackItemType type(Enum item) {
    switch (item) {
      case EquipmentType _:
        return BackpackItemType.equipment;
      case ItemType _:
        return BackpackItemType.item;
      case InstanceDungeonType _:
        return BackpackItemType.instanceDungeon;
      default:
        throw ArgumentError('Invalid backpack item type');
    }
  }

  static Enum getEnumFromBackpackModel(BackpackModel backpackModel) {
    switch (backpackModel.type) {
      case BackpackItemType.equipment:
        return EquipmentType.values[backpackModel.itemId];
      case BackpackItemType.item:
        return ItemType.values[backpackModel.itemId];
      case BackpackItemType.instanceDungeon:
        return InstanceDungeonType.values[backpackModel.itemId];
      default:
        throw ArgumentError('Invalid backpack item type index');
    }
  }
}

@DataClassName("BackpackModel")
class BackpackTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get type => intEnum<BackpackItemType>()();
  IntColumn get itemId => integer()();
  IntColumn get amount => integer().withDefault(const Constant(1))();
}
