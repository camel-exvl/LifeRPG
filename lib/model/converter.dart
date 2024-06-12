import 'dart:convert';

import 'package:drift/drift.dart';

class JsonArrayConverter
    extends TypeConverter<List<Map<String, dynamic>>, String> {
  const JsonArrayConverter();

  @override
  List<Map<String, dynamic>> fromSql(String fromDb) {
    return (json.decode(fromDb) as List)
        .map((item) => item as Map<String, dynamic>)
        .toList();
  }

  @override
  String toSql(List<Map<String, dynamic>> value) {
    return json.encode(value);
  }
}
