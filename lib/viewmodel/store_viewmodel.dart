import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/model/store/equipment_model.dart';

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

  final database = AppDatabase();

  Future<void> initOnFirstRun() async {
    _properties = const [
      PropertyModel(id: 1, moneyType: MoneyType.gold, amount: 0),
      PropertyModel(id: 2, moneyType: MoneyType.diamond, amount: 0),
    ];
    _equipments = const [
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
          id: 4,
          equipmentType: EquipmentType.fruit,
          moneyType: MoneyType.gold,
          price: 5,
          stock: 50),
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
          stock: 10),
      EquipmentModel(
          id: 10,
          equipmentType: EquipmentType.potion,
          moneyType: MoneyType.gold,
          price: 50,
          stock: 20),
      EquipmentModel(
          id: 11,
          equipmentType: EquipmentType.sword,
          moneyType: MoneyType.gold,
          price: 200,
          stock: 10),
    ];
    // _equipments = const [];
    notifyListeners();
    for (final property in _properties) {
      await _insertProperty(property);
    }
    for (final equipment in _equipments) {
      await _insertEquipment(equipment);
    }
  }

  Future<void> _insertProperty(PropertyModel property) async {
    await database.insertProperty(PropertyTableCompanion(
      id: Value(property.id),
      moneyType: Value(property.moneyType),
      amount: Value(property.amount),
    ));
  }

  Future<void> updateProperty(PropertyModel property) async {
    await database.updateProperty(property);
    final properties = await database.getAllProperties();
    _properties = properties;
    notifyListeners();
  }

  Future<void> _insertEquipment(EquipmentModel equipment) async {
    await database.insertEquipment(EquipmentTableCompanion(
        id: Value(equipment.id),
        equipmentType: Value(equipment.equipmentType),
        moneyType: Value(equipment.moneyType),
        price: Value(equipment.price),
        stock: Value(equipment.stock)));
  }
}
