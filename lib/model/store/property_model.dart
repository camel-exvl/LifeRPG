// import 'package:drift/drift.dart';
// import 'package:liferpg/model/common_model.dart';
//
// @DataClassName("PropertyModel")
// class PropertyTable extends Table {
//   IntColumn get id => integer().autoIncrement()();
//
//   IntColumn get moneyType => intEnum<MoneyType>()();
//
//   IntColumn get amount => integer()();
// }

import 'package:liferpg/model/common_model.dart';

class PropertyModel {
  int id;
  MoneyType moneyType;
  int amount;

  PropertyModel({required this.id, required this.moneyType, required this.amount});
}
