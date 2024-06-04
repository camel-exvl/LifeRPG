import 'package:drift/drift.dart';

@DataClassName("StoreModel")
class StoreTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  IntColumn get price => integer()();

  TextColumn get iconPath => text()();

  IntColumn get stock => integer()();
}
