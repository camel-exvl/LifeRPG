import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/model/store/equipment_model.dart';
import 'package:liferpg/model/store/property_model.dart';
import 'package:liferpg/viewmodel/status_viewmodel.dart';

import 'challenge_viewmodel.dart';

class StoreViewModel extends ChangeNotifier {
  static final StoreViewModel _instance = StoreViewModel._internal();

  factory StoreViewModel() => _instance;

  StoreViewModel._internal();

  List<PropertyModel> _properties = [];

  List<EquipmentModel> _equipments = [];

  final List<EquipmentModel> _props = [
    const EquipmentModel(
        id: 4,
        equipmentType: EquipmentType.fruit,
        moneyType: MoneyType.gold,
        price: 5,
        stock: 50),
    const EquipmentModel(
        id: 5,
        equipmentType: EquipmentType.secretGift,
        moneyType: MoneyType.gold,
        price: 1000,
        stock: 1),
    const EquipmentModel(
        id: 7,
        equipmentType: EquipmentType.key,
        moneyType: MoneyType.gold,
        price: 200,
        stock: 10),
    const EquipmentModel(
        id: 10,
        equipmentType: EquipmentType.potion,
        moneyType: MoneyType.gold,
        price: 50,
        stock: 20),
  ];

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

  UnmodifiableListView<EquipmentModel> get props =>
      UnmodifiableListView(_props);

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
          id: 6,
          equipmentType: EquipmentType.magicHat,
          moneyType: MoneyType.gold,
          price: 500,
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
          price: 150,
          stock: 1),
      EquipmentModel(
          id: 11,
          equipmentType: EquipmentType.sword,
          moneyType: MoneyType.gold,
          price: 200,
          stock: 10),
    ];
    // await _insertProperties(initialProperties);
    await _insertEquipments(initialEquipments);
    // _properties = await database.getAllProperties();
    _equipments = await database.getAllEquipments();
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
        case EquipmentType.arrow:
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
}
