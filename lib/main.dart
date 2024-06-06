import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/theme.dart';
import 'package:liferpg/view/home_view.dart';

void main() {


  runApp(const LifeRPG());
}

class LifeRPG extends StatelessWidget {
  const LifeRPG({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MaterialTheme().light(),
      darkTheme: MaterialTheme().dark(),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}
