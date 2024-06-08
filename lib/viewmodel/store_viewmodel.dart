import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/model/store/equipment_model.dart';
import 'package:liferpg/model/store/item_model.dart';

class StoreViewModel extends ChangeNotifier {
  static final StoreViewModel _instance = StoreViewModel._internal();
  factory StoreViewModel() => _instance;
  StoreViewModel._internal();

  List<PropertyModel> _properties = [];
  UnmodifiableListView<PropertyModel> get properties =>
      UnmodifiableListView(_properties);

  List<EquipmentModel> _equipments = [];
  UnmodifiableListView<EquipmentModel> get equipments =>
      UnmodifiableListView(_equipments);

  List<ItemModel> _items = [];
  UnmodifiableListView<ItemModel> get items => UnmodifiableListView(_items);

  List<InstanceDungeonModel> _instanceDungeons = [];
  UnmodifiableListView<InstanceDungeonModel> get instanceDungeons =>
      UnmodifiableListView(_instanceDungeons);

  final database = AppDatabase();

  Future<void> initOnFirstRun() async {
    late List<PropertyModel> initialProperties;
    if (kDebugMode) {
      initialProperties = const [
        PropertyModel(id: 1, moneyType: MoneyType.gold, amount: 1000),
        PropertyModel(id: 2, moneyType: MoneyType.diamond, amount: 100),
      ];
    } else {
      initialProperties = const [
        PropertyModel(id: 1, moneyType: MoneyType.gold, amount: 0),
        PropertyModel(id: 2, moneyType: MoneyType.diamond, amount: 0),
      ];
    }
    const initialEquipments = [
      EquipmentModel(
          id: 1,
          equipmentType: EquipmentType.armor,
          moneyType: MoneyType.gold,
          price: 100,
          stock: 10),
      EquipmentModel(
          id: 2,
          equipmentType: EquipmentType.arrow,
          moneyType: MoneyType.gold,
          price: 10,
          stock: 100),
      EquipmentModel(
          id: 3,
          equipmentType: EquipmentType.boots,
          moneyType: MoneyType.gold,
          price: 50,
          stock: 20),
      EquipmentModel(
          id: 5,
          equipmentType: EquipmentType.secretGift,
          moneyType: MoneyType.gold,
          price: 1000,
          stock: 1),
      EquipmentModel(
          id: 6,
          equipmentType: EquipmentType.magicHat,
          moneyType: MoneyType.gold,
          price: 500,
          stock: 5),
      EquipmentModel(
          id: 7,
          equipmentType: EquipmentType.key,
          moneyType: MoneyType.gold,
          price: 200,
          stock: 10),
      EquipmentModel(
          id: 8,
          equipmentType: EquipmentType.magicBook,
          moneyType: MoneyType.gold,
          price: 300,
          stock: 5),
      EquipmentModel(
          id: 9,
          equipmentType: EquipmentType.necklace,
          moneyType: MoneyType.gold,
          price: 150,
          stock: 1),
      EquipmentModel(
          id: 11,
          equipmentType: EquipmentType.sword,
          moneyType: MoneyType.gold,
          price: 200,
          stock: 10),
    ];
    const List<ItemModel> initialItems = [
      ItemModel(
          id: 1,
          itemType: ItemType.redPotion,
          moneyType: MoneyType.diamond,
          price: 5,
          stock: 100)
    ];
    const List<InstanceDungeonModel> initialInstanceDungeons = [];
    await _insertProperties(initialProperties);
    await _insertEquipments(initialEquipments);
    await _insertItems(initialItems);
    await _insertInstanceDungeons(initialInstanceDungeons);

    _properties = await database.getAllProperties();
    _equipments = await database.getAllEquipments();
    _items = await database.getAllItems();

    notifyListeners();
  }

  Future<void> _insertProperties(List<PropertyModel> properties) async {
    await database.insertProperties(properties
        .map((e) => PropertyTableCompanion(
              id: Value(e.id),
              moneyType: Value(e.moneyType),
              amount: Value(e.amount),
            ))
        .toList());
  }

  Future<void> _insertItems(List<ItemModel> items) async {
    await database.insertItems(items
        .map((e) => ItemTableCompanion(
              id: Value(e.id),
              itemType: Value(e.itemType),
              stock: Value(e.stock),
              price: Value(e.price),
              moneyType: Value(e.moneyType),
            ))
        .toList());
  }

  Future<void> _insertInstanceDungeons(
      List<InstanceDungeonModel> instanceDungeons) async {
    await database.insertInstanceDungeons(instanceDungeons
        .map((e) => InstanceDungeonTableCompanion(
              id: Value(e.id),
              instanceDungeonType: Value(e.instanceDungeonType),
            ))
        .toList());
  }

  Future<void> updateProperty(PropertyModel property) async {
    await database.updateProperty(property);
    await loadProperties();
  }

  Future<void> buy(dynamic item) async {
    final property = _properties
        .firstWhere((property) => property.moneyType == item.moneyType);
    if (property.amount >= item.price) {
      if (item is EquipmentModel) {
        await updateProperty(PropertyModel(
            id: property.id,
            moneyType: property.moneyType,
            amount: property.amount - item.price));
        await updateEquipment(EquipmentModel(
            id: item.id,
            equipmentType: item.equipmentType,
            moneyType: item.moneyType,
            price: item.price,
            stock: item.stock - 1));
        await addToBackpack(item.equipmentType);
      } else if (item is ItemModel) {
        await updateProperty(PropertyModel(
            id: property.id,
            moneyType: property.moneyType,
            amount: property.amount - item.price));
        await updateItem(ItemModel(
            id: item.id,
            itemType: item.itemType,
            moneyType: item.moneyType,
            price: item.price,
            stock: item.stock - 1));
        await addToBackpack(item.itemType);
      } else {
        throw Exception('Unsupported item type');
      }
    }
  }

  Future<void> updateItem(ItemModel item) async {
    await database.updateItem(item);
    await loadItems();
  }

  Future<void> loadItems() async {
    _items = await database.getAllItems();
    notifyListeners();
  }

  Future<void> addToBackpack(Enum item) async {
    if (await database.isInBackpack(item)) {
      await database.updateBackpack(item);
    } else {
      await database.insertBackpack(item);
    }
  }

  Future<void> loadProperties() async {
    _properties = await database.getAllProperties();
    notifyListeners();
  }

  Future<void> _insertEquipments(List<EquipmentModel> equipments) async {
    await database.insertEquipments(equipments
        .map((e) => EquipmentTableCompanion(
              id: Value(e.id),
              equipmentType: Value(e.equipmentType),
              moneyType: Value(e.moneyType),
              price: Value(e.price),
              stock: Value(e.stock),
            ))
        .toList());
  }

  Future<void> updateEquipment(EquipmentModel equipment) async {
    await database.updateEquipment(equipment);
    await loadEquipments();
  }

  Future<void> loadEquipments() async {
    _equipments = await database.getAllEquipments();
    notifyListeners();
  }
}
