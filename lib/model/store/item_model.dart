import 'package:drift/drift.dart';

enum ItemType { egg }

@DataClassName("ItemModel")
class ItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemsType => intEnum<ItemType>()();
}
