import 'package:flutter/foundation.dart';

/// 代表一个属性状态信息
class AttributeModel extends ChangeNotifier {
  String iconPath; // 属性图标路径
  String name;     // 属性名
  Map<int, int> levelExpMap;   // 每个等级对应的经验值
  int level;       // 属性等级
  int exp;         // 当前等级的经验值

  AttributeModel({
    required this.iconPath,
    required this.name,
    required this.levelExpMap,
    required this.level,
    required this.exp,
  });
}