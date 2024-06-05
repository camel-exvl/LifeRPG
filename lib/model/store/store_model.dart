import 'package:drift/drift.dart';

import '../common_model.dart';

@DataClassName("StoreModel")
class StoreTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get assetName => text()();

  TextColumn get description => text()();

  IntColumn get moneyType => intEnum<MoneyType>()();

  IntColumn get price => integer()();

  IntColumn get stock => integer()();
}
