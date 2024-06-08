import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:liferpg/database/database.dart';

class BackpackViewmodel extends ChangeNotifier {
  final database = AppDatabase();

  List<Enum> _backpackItems = [];

  UnmodifiableListView<Enum> get backpackItems =>
      UnmodifiableListView(_backpackItems);

  Future<void> loadBackpackItems() async {
    _backpackItems = await database.getAllBackpackType();
    notifyListeners();
  }
}
