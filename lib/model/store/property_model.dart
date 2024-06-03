import 'package:drift/drift.dart';
import 'package:liferpg/model/common_model.dart';

@DataClassName("PropertyModel")
class PropertyTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get moneyType => intEnum<MoneyType>()();

  IntColumn get amount => integer()();
}
