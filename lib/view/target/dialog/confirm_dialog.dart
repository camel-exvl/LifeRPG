import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiscardChangeDialog {
  Future<bool?> show(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(AppLocalizations.of(context)!.unsavedChanges),
            Image(
              image: const AssetImage('res/icons/warning.png'),
              width: Theme.of(context).iconTheme.size,
              height: Theme.of(context).iconTheme.size,
            )
          ]),
          content: Text(AppLocalizations.of(context)!.discardChangesMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(AppLocalizations.of(context)!.discard),
            ),
          ],
        );
      },
    );
  }
}

class DeleteDialog {
  final VoidCallback onDelete;

  const DeleteDialog({required this.onDelete});

  Future<void> show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(AppLocalizations.of(context)!.delete),
            Image(
              image: const AssetImage('res/icons/warning.png'),
              width: Theme.of(context).iconTheme.size,
              height: Theme.of(context).iconTheme.size,
            )
          ]),
          content: Text(AppLocalizations.of(context)!.deleteMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () {
                onDelete();
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.delete),
            ),
          ],
        );
      },
    );
  }
}
