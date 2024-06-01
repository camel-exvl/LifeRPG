import 'package:liferpg/model/common_model.dart';

import '../target/habit_model.dart';

class RewardRequestModel {
  Difficulty difficulty;
  Category category;
  int finishedCount;
  DateTime lastFinishedAt;
  double rewardCoefficient;
  HabitType? habitType;

  RewardRequestModel({
    required this.difficulty,
    required this.category,
    required this.finishedCount,
    required this.lastFinishedAt,
    required this.rewardCoefficient,
    required this.habitType,
  });
}
