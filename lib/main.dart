import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/theme.dart';
import 'package:liferpg/view/home_view.dart';
import 'package:liferpg/view/onboarding_view.dart';
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
  late bool isSettingInit;
  late Future<void> _initFuture;

  Future<void> initOnFirstRun() async {
    WidgetsFlutterBinding.ensureInitialized(); // 确保初始化
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSettingInit = prefs.getBool('is_setting_init') ?? true;

    if (isSettingInit) {
      prefs.setBool('is_setting_init', false);
      await viewModel.initOnFirstRun();
    }
  }

  Future<void> loading() async {
    await initOnFirstRun();
    await viewModel.loadSetting();
  }

  @override
  void initState() {
    super.initState();
    _initFuture = loading();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<SettingViewModel>(builder: (context, viewModel, child) {
          return FutureBuilder(
              future: _initFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return MaterialApp(
                    theme: MaterialTheme().light(),
                    darkTheme: MaterialTheme().dark(),
                    themeMode: viewModel.getThemeMode(),
                    home: const Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                } else {
                  return MaterialApp(
                    onGenerateTitle: (context) =>
                        AppLocalizations.of(context)!.appName,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: viewModel.getLocale(),
                    theme: MaterialTheme().light(),
                    darkTheme: MaterialTheme().dark(),
                    themeMode: viewModel.getThemeMode(),
                    home: isSettingInit
                        ? const OnBoardingView()
                        : const HomeView(),
                  );
                }
              });
        }));
  }
}
