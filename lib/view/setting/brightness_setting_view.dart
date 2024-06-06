import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/viewmodel/setting_viewmodel.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/view/setting/dialog/restart_dialog.dart';

class BrightnessSettingView extends StatefulWidget {
  const BrightnessSettingView({super.key});

  @override
  State<BrightnessSettingView> createState() => _BrightnessSettingView();
}

class _BrightnessSettingView extends State<BrightnessSettingView> {
  final viewModel = SettingViewModel();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.brightness),
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
              title: Text(AppLocalizations.of(context)!.dayMode),
              trailing: viewModel.setting.brightnessType ==
                  BrightnessType.values.indexOf(BrightnessType.light)
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                SettingModel setting = viewModel.setting.copyWith(
                    brightnessType: BrightnessType.values
                        .indexOf(BrightnessType.light));

                RestartDialog(setting: setting).show(context);
              },
            ),
            ListTile(
                title: Text(AppLocalizations.of(context)!.nightMode),
                trailing: viewModel.setting.brightnessType ==
                    BrightnessType.values.indexOf(BrightnessType.dark)
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  SettingModel setting = viewModel.setting.copyWith(
                      brightnessType: BrightnessType.values
                          .indexOf(BrightnessType.dark));

                  RestartDialog(setting: setting).show(context);
                }),
            ListTile(
                title:
                Text(AppLocalizations.of(context)!.followingSystem),
                trailing: viewModel.setting.brightnessType ==
                    BrightnessType.values
                        .indexOf(BrightnessType.system)
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  SettingModel setting = viewModel.setting.copyWith(
                      brightnessType: BrightnessType.values
                          .indexOf(BrightnessType.system));

                  RestartDialog(setting: setting).show(context);
                }),
          ],
        ),
      ),
    );
  }
}
