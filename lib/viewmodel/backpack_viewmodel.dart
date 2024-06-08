import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/backpack/backpack_model.dart';

class BackpackViewmodel extends ChangeNotifier {
  final database = AppDatabase();

  List<BackpackModel> _backpackModels = [];
  List<Enum> _backpackTypes = [];

  UnmodifiableListView<Enum> get backpackTypes =>
      UnmodifiableListView(_backpackTypes);

  int getAmount(Enum item) {
    return _backpackModels
        .where((element) {
          int itemId = item.index;
          BackpackItemType type = BackpackItemTypeExtension.type(item);
          return element.itemId == itemId && element.type == type;
        })
        .map((e) => e.amount)
        .fold(0, (previousValue, element) => previousValue + element);
  }

  Future<void> loadBackpack() async {
    _backpackModels = await database.getAllBackpackModel();
    _backpackTypes = await database.getAllBackpackType();
    notifyListeners();
  }
}
