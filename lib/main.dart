import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/theme.dart';
import 'package:liferpg/view/home_view.dart';
import 'package:liferpg/viewmodel/setting_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const LifeRPG());
}

class LifeRPG extends StatefulWidget {
  const LifeRPG({super.key});

  @override
  State<LifeRPG> createState() => _LifeRPG();
}

class _LifeRPG extends State<LifeRPG> {
  final viewModel = SettingViewModel();

  Future<void> initOnFirstRun() async {
    WidgetsFlutterBinding.ensureInitialized(); // 确保初始化
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isSettingInit = prefs.getBool('is_setting_init');

    if (isSettingInit == null || isSettingInit == true) {
      prefs.setBool('is_setting_init', false);
      await viewModel.initOnFirstRun();
    }
  }

  Future<void> loadSetting() async {
    await initOnFirstRun();
    await viewModel.loadSetting();
  }

  @override
  void initState() {
    super.initState();
    loadSetting();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<SettingViewModel>(builder: (context, viewModel, child) {
          return MaterialApp(
            onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: viewModel.getLocale(),
            theme: MaterialTheme().light(),
            darkTheme: MaterialTheme().dark(),
            themeMode: viewModel.getThemeMode(),
            home: const HomeView(),
          );
        }));
  }
}
