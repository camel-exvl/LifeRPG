import 'package:flutter/material.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:drift/drift.dart';

class SettingViewModel extends ChangeNotifier {
  static final SettingViewModel _instance = SettingViewModel._internal();

  factory SettingViewModel() => _instance;

  SettingViewModel._internal();

  final database = AppDatabase();
  SettingModel _setting = SettingModel(
    languageType: LanguageType.values.indexOf(LanguageType.system),
    brightnessType: BrightnessType.values.indexOf(BrightnessType.system),
  );

  Future<void> initOnFirstRun() async {
    await insertSetting(_setting);
  }

  Future<void> loadSetting() async {
    _setting = await database.getSetting();
    notifyListeners();
  }

  Future<void> insertSetting(SettingModel setting) async {
    database.insertSetting(SettingTableCompanion(
      languageType: Value(setting.languageType),
      brightnessType: Value(setting.brightnessType),
    ));
  }

  Future<void> updateSetting(SettingModel setting) async {
    _setting = setting;
    database.updateSetting(setting);
  }

  Future<void> deleteSetting(SettingModel setting) async {
    database.deleteSetting(setting);
  }
}