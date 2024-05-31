import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiscardChangeDialog {
  final VoidCallback onDiscard;

  const DiscardChangeDialog({required this.onDiscard});

  Future<void> show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.discardChanges),
          content: Text(AppLocalizations.of(context)!.discardChangesMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () {
                onDiscard();
                Navigator.of(context).pop();
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
          title: Text(AppLocalizations.of(context)!.delete),
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
