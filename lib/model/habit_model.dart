import 'package:flutter/cupertino.dart';
import 'package:liferpg/model/common_model.dart';

class HabitModel {
  final String id;
  final String title;
  final String description;
  final Difficulty difficulty;
  final Category category;

  HabitModel({
    required this.title,
    required this.description,
    required this.difficulty,
    required this.category,
  }) : id = UniqueKey().toString();
}
