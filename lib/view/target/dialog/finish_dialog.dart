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
              if (rewardResponse.gold != 0)
                Row(
                  children: [
                    // TODO: Replace Icon with Image.asset
                    Icon(
                      Icons.star,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    // Image(
                    //   image: const AssetImage('res/icons/gold.png'),
                    //   width: Theme.of(context).iconTheme.size,
                    //   height: Theme.of(context).iconTheme.size,
                    // ),
                    const Spacer(),
                    Text(AppLocalizations.of(context)!.gold),
                    const Spacer(),
                    Text(rewardResponse.gold > 0
                        ? "+ ${rewardResponse.gold.toString()}"
                        : "- ${(-rewardResponse.gold).toString()}"),
                  ],
                ),
              for (var exp in rewardResponse.expMap.entries)
                if (exp.value != 0)
                  Row(
                    children: [
                      Image(
                        image: AssetImage(exp.key.iconPath()),
                        width: Theme.of(context).iconTheme.size,
                        height: Theme.of(context).iconTheme.size,
                      ),
                      const Spacer(),
                      Text(exp.key.localizedString(context)),
                      const Spacer(),
                      Text(exp.value > 0
                          ? "+ ${exp.value.toString()}"
                          : "- ${(-exp.value).toString()}"),
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
