import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FrequentFinishWarningDialog {
  Future<void> show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(AppLocalizations.of(context)!
                      .frequentFinishWarningTitle)),
              Image(
                image: const AssetImage('res/icons/warning.png'),
                width: Theme.of(context).iconTheme.size,
                height: Theme.of(context).iconTheme.size,
              )
            ],
          ),
          content:
              Text(AppLocalizations.of(context)!.frequentFinishWarningMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.confirm),
            ),
          ],
        );
      },
    );
  }
}
