import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/model/store/equipment_model.dart';
import 'package:liferpg/model/store/item_model.dart';
import 'package:liferpg/model/store/property_model.dart';
import 'package:liferpg/viewmodel/status_viewmodel.dart';

import 'challenge_viewmodel.dart';

class StoreViewModel extends ChangeNotifier {
  static final StoreViewModel _instance = StoreViewModel._internal();

  factory StoreViewModel() => _instance;

  StoreViewModel._internal();

  List<PropertyModel> _properties = [];

  List<EquipmentModel> _equipments = [];

  List<ItemModel> _items = [];

  final List<StoreChallengeModel> _challenges = [
    StoreChallengeModel(
        id: 1,
        name: "mechanicalCastle",
        description: "",
        imagePath: "res/icons/boss/mechanical_castle.png",
        imageInStorePath: "res/icons/boss/mechanical_castle_store.png",
        bossName: "",
        totalHp: 1000,
        attack: 100,
        defense: 100,
        price: 400,
        rewardGold: 1000,
        curHp: 1000,
        log: []),
    StoreChallengeModel(
        id: 2,
        name: "ghostShip",
        description: "",
        imagePath: "res/icons/boss/ghost_ship.png",
        imageInStorePath: "res/icons/boss/ghost_ship_store.png",
        bossName: "",
        totalHp: 80,
        attack: 120,
        defense: 20,
        price: 150,
        rewardGold: 500,
        curHp: 80,
        log: []),
  ];

  UnmodifiableListView<PropertyModel> get properties =>
      UnmodifiableListView(_properties);

  UnmodifiableListView<EquipmentModel> get equipments =>
      UnmodifiableListView(_equipments);

  UnmodifiableListView<ItemModel> get items => UnmodifiableListView(_items);

  UnmodifiableListView<StoreChallengeModel> get challenges =>
      UnmodifiableListView(_challenges);

  final database = AppDatabase();

  Future<void> initOnFirstRun() async {
    // late List<PropertyModel> initialProperties;
    // if (kDebugMode) {
    //   initialProperties = [
    //     PropertyModel(id: 1, moneyType: MoneyType.gold, amount: 1000),
    //     PropertyModel(id: 2, moneyType: MoneyType.diamond, amount: 100),
    //   ];
    // } else {
    //   initialProperties = [
    //     PropertyModel(id: 1, moneyType: MoneyType.gold, amount: 0),
    //     PropertyModel(id: 2, moneyType: MoneyType.diamond, amount: 0),
    //   ];
    // }
    const initialEquipments = [
      EquipmentModel(
          id: 1,
          equipmentType: EquipmentType.armor,
          moneyType: MoneyType.gold,
          price: 500,
          stock: 10),
      EquipmentModel(
          id: 2,
          equipmentType: EquipmentType.bow,
          moneyType: MoneyType.gold,
          price: 50,
          stock: 100),
      EquipmentModel(
          id: 3,
          equipmentType: EquipmentType.boots,
          moneyType: MoneyType.gold,
          price: 100,
          stock: 20),
      EquipmentModel(
          id: 6,
          equipmentType: EquipmentType.magicHat,
          moneyType: MoneyType.gold,
          price: 200,
          stock: 5),
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
          price: 50,
          stock: 1),
      EquipmentModel(
          id: 11,
          equipmentType: EquipmentType.sword,
          moneyType: MoneyType.gold,
          price: 200,
          stock: 10),
    ];
    const initialItems = [
      ItemModel(
          id: 1,
          type: ItemType.fruit,
          iconPath: "res/icons/kyrise/fruit_01a.png",
          moneyType: MoneyType.gold,
          price: 10,
          stock: 100,
          boughtNum: 0,
          isCustomized: false),
      ItemModel(
          id: 2,
          type: ItemType.secretGift,
          iconPath: "res/icons/kyrise/gift_01e.png",
          moneyType: MoneyType.gold,
          price: 200,
          stock: 100,
          boughtNum: 0,
          isCustomized: false),
      ItemModel(
          id: 3,
          type: ItemType.key,
          iconPath: "res/icons/kyrise/key_01e.png",
          moneyType: MoneyType.gold,
          price: 200,
          stock: 100,
          boughtNum: 0,
          isCustomized: false),
      ItemModel(
          id: 4,
          type: ItemType.potion,
          iconPath: "res/icons/kyrise/potion_01a.png",
          moneyType: MoneyType.gold,
          price: 10,
          stock: 100,
          boughtNum: 0,
          isCustomized: false),
    ];

    await _insertEquipments(initialEquipments);
    await _insertItems(initialItems);

    _equipments = await database.getAllEquipments();
    _items = await database.getAllItems();
    notifyListeners();
  }

  // Future<void> _insertProperties(List<PropertyModel> properties) async {
  //   await database.insertProperties(properties
  //       .map((e) => PropertyTableCompanion(
  //             id: Value(e.id),
  //             moneyType: Value(e.moneyType),
  //             amount: Value(e.amount),
  //           ))
  //       .toList());
  // }
  //
  // Future<void> updateProperty(PropertyModel property) async {
  //   await database.updateProperty(property);
  //   await loadProperties();
  // }

  Future<void> updateProperty(int delta) async {
    final property = _properties
        .firstWhere((property) => property.moneyType == MoneyType.gold);
    final statusViewModel = StatusViewModel();
    await statusViewModel.updateProperty(PropertyModel(
        id: property.id,
        moneyType: property.moneyType,
        amount: property.amount + delta));
    property.amount += delta;
    notifyListeners();
  }

  Future<void> buyChallenge(StoreChallengeModel challenge) async {
    final property = _properties
        .firstWhere((property) => property.moneyType == MoneyType.gold);
    final statusViewModel = StatusViewModel();
    final challengeViewModel = ChallengeViewModel();
    if (property.amount >= challenge.price) {
      await statusViewModel.updateProperty(PropertyModel(
          id: property.id,
          moneyType: property.moneyType,
          amount: property.amount - challenge.price));
      property.amount -= challenge.price;
      await challengeViewModel.insertChallenge(challenge);
    }
    notifyListeners();
  }

  Future<void> buy(EquipmentModel equipment) async {
    final property = _properties
        .firstWhere((property) => property.moneyType == equipment.moneyType);
    final statusViewModel = StatusViewModel();
    if (property.amount >= equipment.price) {
      await statusViewModel.updateProperty(PropertyModel(
          id: property.id,
          moneyType: property.moneyType,
          amount: property.amount - equipment.price));
      property.amount -= equipment.price;
      await updateEquipment(EquipmentModel(
          id: equipment.id,
          equipmentType: equipment.equipmentType,
          moneyType: equipment.moneyType,
          price: equipment.price,
          stock: equipment.stock - 1));

      switch (equipment.equipmentType) {
        case EquipmentType.bow:
        case EquipmentType.magicBook:
        case EquipmentType.sword:
          statusViewModel.addWeapon(equipment.id);
          break;
        case EquipmentType.armor:
        case EquipmentType.magicHat:
        case EquipmentType.boots:
        case EquipmentType.necklace:
          statusViewModel.addArmor(equipment.id);
          break;
        // case EquipmentType.fruit:
        //   statusViewModel.updateStatus(StatusType.fruit, 1);
        //   break;
        // case EquipmentType.secretGift:
        //   statusViewModel.updateStatus(StatusType.secretGift, 1);
        //   break;
        // case EquipmentType.key:
        //   statusViewModel.updateStatus(StatusType.key, 1);
        //   break;
        // case EquipmentType.potion:
        //   statusViewModel.updateStatus(StatusType.potion, 1);
        //   break;
        default:
          break;
      }
      notifyListeners();
    }
  }

  Future<void> loadProperties() async {
    StatusViewModel statusViewModel = StatusViewModel();
    _properties = statusViewModel.getProperties();
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

  Future<void> addCustomizedItem(
      String name, String description, int price, String iconPath,
      {MoneyType moneyType = MoneyType.gold, int stock = 100}) async {
    final item = ItemTableCompanion(
      name: Value(name),
      description: Value(description),
      iconPath: Value(iconPath),
      moneyType: Value(moneyType),
      price: Value(price),
      stock: Value(stock),
      boughtNum: const Value(0),
      isCustomized: const Value(true),
    );
    await database.insertItem(item);
    await loadItems();
  }

  Future<void> loadItems() async {
    _items = await database.getAllItems();
    notifyListeners();
  }

  Future<void> deleteItem(ItemModel customizedItem) async {
    await database.deleteItem(customizedItem);
    await loadItems();
  }

  Future<void> _insertItems(List<ItemModel> items) async {
    await database.insertItems(items
        .map((e) => ItemTableCompanion(
              id: Value(e.id),
              type: Value(e.type),
              iconPath: Value(e.iconPath),
              moneyType: Value(e.moneyType),
              price: Value(e.price),
              stock: Value(e.stock),
              boughtNum: Value(e.boughtNum),
            ))
        .toList());
  }
}
