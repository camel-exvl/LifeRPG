import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/common_model.dart';

class StoreViewModel extends ChangeNotifier {
  static final StoreViewModel _instance = StoreViewModel._internal();
  factory StoreViewModel() => _instance;
  StoreViewModel._internal();

  List<PropertyModel> _properties = [];
  UnmodifiableListView<PropertyModel> get properties =>
      UnmodifiableListView(_properties);

  List<StoreModel> _storeItems = [];
  UnmodifiableListView<StoreModel> get storeItems =>
      UnmodifiableListView(_storeItems);

  final database = AppDatabase();

  Future<void> initOnFirstRun() async {
    _properties = const [
      PropertyModel(id: 1, moneyType: MoneyType.gold, amount: 0),
      PropertyModel(id: 2, moneyType: MoneyType.diamond, amount: 0),
    ];
    _storeItems = const [];

    for (final property in _properties) {
      await _insertProperty(property);
    }
    for (final storeItem in _storeItems) {
      await _insertStore(storeItem);
    }
    notifyListeners();
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

  Future<void> _insertStore(StoreModel storeItem) async {
    await database.insertStore(StoreTableCompanion(
        id: Value(storeItem.id),
        name: Value(storeItem.name),
        assetName: Value(storeItem.assetName),
        description: Value(storeItem.description),
        moneyType: Value(storeItem.moneyType),
        price: Value(storeItem.price),
        stock: Value(storeItem.stock)));
  }
}
