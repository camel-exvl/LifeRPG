import 'package:liferpg/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AchievementDialog {
  final AchievementModel achievement;
  final bool isAchieved;

  AchievementDialog({required this.achievement, required this.isAchieved});

  Future<bool?> show(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                title: Text(
                  Localizations.localeOf(context).languageCode == 'en'
                      ? achievement.nameEN
                      : achievement.nameZH,
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(isAchieved
                          ? 'res/icons/achievement_achieved.png'
                          : 'res/icons/achievement_not_achieved.png'),
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      WidgetsBinding.instance.platformDispatcher.locale
                                  .languageCode ==
                              'en'
                          ? achievement.descriptionEN
                          : achievement.descriptionZH,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Implement the purchase logic here
                          // For example, you can deduct money from the user's account and update the stock
                          // Then close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.confirm),
                      )
                    ],
                  )
                ]));
  }
}
