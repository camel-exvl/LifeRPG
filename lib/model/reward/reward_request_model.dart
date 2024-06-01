import 'package:liferpg/model/target/common_model.dart';

class RewardRequestModel {
  Difficulty difficulty;
  Category category;
  int finishedCount;
  DateTime lastFinishedAt;
  double rewardCoefficient;

  RewardRequestModel({
    required this.difficulty,
    required this.category,
    required this.finishedCount,
    required this.lastFinishedAt,
    required this.rewardCoefficient,
  });
}