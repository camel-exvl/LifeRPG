import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/viewmodel/setting_viewmodel.dart';
import 'package:restart_app/restart_app.dart';

class RestartDialog {
  SettingViewModel viewModel = SettingViewModel();
  SettingModel setting;

  RestartDialog({required this.setting});

  Future<bool?> show(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.restartApp),
          content: Text(AppLocalizations.of(context)!.restartAppMessage),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.confirm),
              onPressed: () async {
                await viewModel.updateSetting(setting);
                Restart.restartApp();
              },
            ),
          ],
        );
      },
    );
  }
}