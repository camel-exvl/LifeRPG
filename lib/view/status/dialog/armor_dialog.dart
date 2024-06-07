import 'package:liferpg/viewmodel/status_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArmorDialog {
  StatusViewModel viewModel = StatusViewModel();
  final int armorIndex;
  final bool isEquipped;

  ArmorDialog({required this.armorIndex, required this.isEquipped});

  Future<bool?> show(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text(AppLocalizations.of(context)!.restartApp),
          // content: Text(AppLocalizations.of(context)!.restartAppMessage),
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
                if (isEquipped) {
                  viewModel.removeArmor();
                } else {
                  viewModel.equipArmor(armorIndex);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
