import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/model/reward/reward_response_model.dart';

class FinishDialog {
  Future<void> show(
      BuildContext context, RewardResponseModel rewardResponse) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: rewardResponse.gold > 0
              ? Text(AppLocalizations.of(context)!.congratulations)
              : Text(AppLocalizations.of(context)!.youCanDoBetter),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // TODO: Replace Icon with Image.asset
                  const Icon(Icons.star, color: Colors.yellow),
                  Text(
                      "${AppLocalizations.of(context)!.gold} + ${rewardResponse.gold.toString()}"),
                ],
              ),
              for (var exp in rewardResponse.expMap.entries)
                if (exp.value > 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      exp.key.icon(context),
                      Text(
                          "${exp.key.localizedString(context)} + ${exp.value}"),
                    ],
                  ),
            ],
          ),
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
