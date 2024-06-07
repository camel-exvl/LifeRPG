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
    const initialProperties = [
      PropertyModel(id: 1, moneyType: MoneyType.gold, amount: 0),
      PropertyModel(id: 2, moneyType: MoneyType.diamond, amount: 0),
    ];
    const initalEquipments = [
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
    await _insertProperties(initialProperties);
    await _insertEquipments(initalEquipments);
    _properties = await database.getAllProperties();
    _equipments = await database.getAllEquipments();
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

  Future<void> updateProperty(PropertyModel property) async {
    await database.updateProperty(property);
    await loadProperties();
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
