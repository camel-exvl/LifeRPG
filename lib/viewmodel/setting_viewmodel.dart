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
    id: 1,
    languageType: LanguageType.values.indexOf(LanguageType.system),
    brightnessType: BrightnessType.values.indexOf(BrightnessType.system),
  );

  SettingModel get setting => _setting;

  Future<void> initOnFirstRun() async {
    await insertSetting(_setting);
  }

  Future<void> loadSetting() async {
    _setting = await database.getSetting();
    notifyListeners();
  }

  Future<void> insertSetting(SettingModel setting) async {
    await database.insertSetting(SettingTableCompanion(
      languageType: Value(setting.languageType),
      brightnessType: Value(setting.brightnessType),
    ));
  }

  Future<void> updateSetting(SettingModel setting) async {
    _setting = setting;
    notifyListeners();
    await database.updateSetting(setting);
  }

  Future<void> deleteSetting(SettingModel setting) async {
    await database.deleteSetting(setting);
  }

  ThemeMode getThemeMode() {
    switch (BrightnessType.values[_setting.brightnessType]) {
      case BrightnessType.light:
        return ThemeMode.light;
      case BrightnessType.dark:
        return ThemeMode.dark;
      case BrightnessType.system:
      default:
        return ThemeMode.system;
    }
  }
  Locale getLocale() {
    switch (LanguageType.values[_setting.languageType]) {
      case LanguageType.zh:
        return const Locale('zh');
      case LanguageType.en:
        return const Locale('en');
      case LanguageType.system:
      default:
      return WidgetsBinding.instance.platformDispatcher.locale;
    }
  }
}
