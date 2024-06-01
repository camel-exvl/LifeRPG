import 'package:liferpg/model/common_model.dart';

class RewardResponseModel {
  final Map<Attribute, int> expMap = {
    Attribute.strength: 0,
    Attribute.talent: 0,
    Attribute.culture: 0,
    Attribute.charisma: 0,
    Attribute.environment: 0,
    Attribute.intelligence: 0,
  };
  int gold = 0;
  double penaltyCoefficient = 1.0;
}
