import 'package:flutter/foundation.dart';
import 'attribute_model.dart';

/// 代表一个人生状态信息
class StatusModel extends ChangeNotifier {
  int level;            // 当前人生等级
  Map<int, int> levelExpMap;   // 每个等级对应的经验值
  int exp;             // 当前等级经验值
  Map<String, AttributeModel> attributes;   // 一系列属性

  StatusModel({
    required this.level,
    required this.levelExpMap,
    required this.exp,
    required this.attributes,
  });
}