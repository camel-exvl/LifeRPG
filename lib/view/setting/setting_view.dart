import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/view/setting/brightness_setting_view.dart';
import 'package:liferpg/view/setting/language_setting_view.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingView();
}

class _SettingView extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.setting),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(AppLocalizations.of(context)!.language),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Image.asset(
                  "res/icons/right_arrow.png",
                  width: (Theme.of(context).textTheme.headlineSmall?.fontSize ??
                          15) *
                      1.0,
                  height:
                      (Theme.of(context).textTheme.headlineSmall?.fontSize ??
                              15) *
                          1.0,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageSettingView()),
                );
              },
            ),
            ListTile(
              title: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(AppLocalizations.of(context)!.brightness)),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Image.asset(
                  "res/icons/right_arrow.png",
                  width: (Theme.of(context).textTheme.headlineSmall?.fontSize ??
                          15) *
                      1.0,
                  height:
                      (Theme.of(context).textTheme.headlineSmall?.fontSize ??
                              15) *
                          1.0,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BrightnessSettingView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
