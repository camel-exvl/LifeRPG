import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/challenge/challenge_model.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database/database.dart';
import '../../viewmodel/challenge_viewmodel.dart';

class ChallengeSelectView extends StatefulWidget {
  const ChallengeSelectView({super.key, required this.viewModel});

  final ChallengeViewModel viewModel;

  @override
  State<ChallengeSelectView> createState() => _ChallengeSelectViewState();
}

class _ChallengeSelectViewState extends State<ChallengeSelectView> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context)!.selectChallenge)),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () {
            return widget.viewModel.loadData();
          },
          child: ListView.builder(
            itemCount: widget.viewModel.challenges.length,
            itemBuilder: (context, index) {
              ChallengeModel task = widget.viewModel.challenges[index];
              task = getChallengeLocalizedString(context, task);
              return ListTile(
                key: ValueKey(task.id),
                title: Text(task.name),
                subtitle: Column(
                  children: [
                    Text(task.description),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                                image: const AssetImage(hpIconPath),
                                height: Theme.of(context).iconTheme.size,
                                width: Theme.of(context).iconTheme.size),
                            const SizedBox(width: 8.0),
                            Text("${task.curHp}/${task.totalHp}"),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                                image: const AssetImage(attackPowerIconPath),
                                height: Theme.of(context).iconTheme.size,
                                width: Theme.of(context).iconTheme.size),
                            const SizedBox(width: 8.0),
                            Text("${task.attack}"),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                                image: const AssetImage(defensePowerIconPath),
                                height: Theme.of(context).iconTheme.size,
                                width: Theme.of(context).iconTheme.size),
                            const SizedBox(width: 8.0),
                            Text("${task.defense}"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setInt("cur_challenge", task.id);
                  await widget.viewModel.setCurChallenge(task.id);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
          heroTag: 'ChallengeSelectView',
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove("cur_challenge");
            await widget.viewModel.setCurChallenge(null);
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: const Icon(Icons.close)),
    );
  }
}
