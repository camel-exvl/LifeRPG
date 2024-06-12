import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/viewmodel/status_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:liferpg/view/status/dialog/achievement_dialog.dart';
import 'package:liferpg/database/database.dart';

class AchievementView extends StatefulWidget {
  const AchievementView({super.key});

  @override
  State<AchievementView> createState() => _AchievementView();
}

class _AchievementView extends State<AchievementView> {
  final viewModel = StatusViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<StatusViewModel>(builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.achievement),
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
              elevation: 2,
              child: GridView.builder(
                itemCount: viewModel.achievements.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  Set<int> achievedIds = viewModel.getAchievedAchievementIds();
                  return AchievementItemCard(
                      achievement: viewModel.achievements[index],
                      isAchieved: achievedIds
                          .contains(viewModel.achievements[index].id));
                },
              ),
            ),
          );
        }));
  }
}

class AchievementItemCard extends StatelessWidget {
  final AchievementModel achievement;
  final bool isAchieved;

  const AchievementItemCard(
      {super.key, required this.achievement, required this.isAchieved});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          AchievementDialog(achievement: achievement, isAchieved: isAchieved)
              .show(context);
        },
        child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Expanded(flex: 2, child: Container()),
              Expanded(
                flex: 6,
                child: Image.asset(isAchieved
                    ? 'res/icons/achievement_achieved.png'
                    : 'res/icons/achievement_not_achieved.png'),
              ),
              Expanded(
                  flex: 6,
                  child: Center(
                    child: Text(
                      Localizations.localeOf(context).languageCode == 'en'
                          ? achievement.nameEN
                          : achievement.nameZH,
                      textAlign: TextAlign.center,
                    ),
                  )),
            ])));
  }
}
