import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:liferpg/view/challenge/challenge_select_view.dart';
import 'package:liferpg/viewmodel/challenge_viewmodel.dart';
import 'package:liferpg/viewmodel/status_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../model/challenge/challenge_model.dart';
import '../../model/common_model.dart';

class ChallengeView extends StatefulWidget {
  const ChallengeView({super.key});

  @override
  State<ChallengeView> createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChallengeViewModel(),
      child: Consumer<ChallengeViewModel>(builder: (context, viewModel, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                QuestSwitchView(viewModel: viewModel),
                const Divider(),
                BossInfoView(viewModel: viewModel),
                const Divider(),
                if (viewModel.curChallenge != null)
                  ChallengeLogView(viewModel: viewModel)
              ],
            ),
          ),
        );
      }),
    );
  }
}

class QuestSwitchView extends StatefulWidget {
  const QuestSwitchView({super.key, required this.viewModel});

  final ChallengeViewModel viewModel;

  @override
  State<QuestSwitchView> createState() => _QuestSwitchViewState();
}

class _QuestSwitchViewState extends State<QuestSwitchView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (widget.viewModel.curChallenge != null)
          Wrap(children: [
            Image(
              image: AssetImage(widget.viewModel.curChallenge!.imagePath),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                  '${AppLocalizations.of(context)!.curChallenge}: ${getChallengeLocalizedString(context, widget.viewModel.curChallenge!).name}',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
          ]),
        const SizedBox(height: 8.0),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ChallengeSelectView(viewModel: widget.viewModel)));
          },
          child: Text(widget.viewModel.curChallenge != null
              ? AppLocalizations.of(context)!.switchChallenge
              : AppLocalizations.of(context)!.selectChallenge),
        ),
      ],
    );
  }
}

class BossInfoView extends StatefulWidget {
  const BossInfoView({super.key, required this.viewModel});

  final ChallengeViewModel viewModel;

  @override
  State<BossInfoView> createState() => _BossInfoViewState();
}

class _BossInfoViewState extends State<BossInfoView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StatusViewModel(),
        child: Consumer<StatusViewModel>(
            builder: (context, statusViewModel, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppLocalizations.of(context)!.knight,
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 8.0),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image:
                                        const AssetImage('res/icons/heart.png'),
                                    height: Theme.of(context).iconTheme.size,
                                    width: Theme.of(context).iconTheme.size,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: widget.viewModel.hp /
                                          widget.viewModel.maxHp,
                                      semanticsLabel:
                                          AppLocalizations.of(context)!
                                              .knightHp,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiaryContainer,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .outlineVariant,
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      '${widget.viewModel.hp}/${widget.viewModel.maxHp}')),
                            ],
                          ),
                          Row(
                            children: [
                              Image(
                                image: const AssetImage(attackPowerIconPath),
                                height: Theme.of(context).iconTheme.size,
                                width: Theme.of(context).iconTheme.size,
                              ),
                              const SizedBox(width: 8.0),
                              Text('${statusViewModel.attack}'),
                            ],
                          ),
                          Row(
                            children: [
                              Image(
                                image: const AssetImage(defensePowerIconPath),
                                height: Theme.of(context).iconTheme.size,
                                width: Theme.of(context).iconTheme.size,
                              ),
                              const SizedBox(width: 8.0),
                              Text('${statusViewModel.defense}'),
                            ],
                          ),
                        ]),
                  ),
                  const VerticalDivider(),
                  if (widget.viewModel.curChallenge != null)
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                getChallengeLocalizedString(
                                        context, widget.viewModel.curChallenge!)
                                    .bossName,
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: const AssetImage(
                                          'res/icons/heart.png'),
                                      height: Theme.of(context).iconTheme.size,
                                      width: Theme.of(context).iconTheme.size,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: widget
                                                .viewModel.curChallenge!.curHp /
                                            widget.viewModel.curChallenge!
                                                .totalHp,
                                        semanticsLabel:
                                            AppLocalizations.of(context)!
                                                .bossHp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiaryContainer,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .outlineVariant,
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        '${widget.viewModel.curChallenge!.curHp}/${widget.viewModel.curChallenge!.totalHp}')),
                              ],
                            ),
                            Row(
                              children: [
                                Image(
                                  image: const AssetImage(attackPowerIconPath),
                                  height: Theme.of(context).iconTheme.size,
                                  width: Theme.of(context).iconTheme.size,
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                    '${widget.viewModel.curChallenge!.attack}'),
                              ],
                            ),
                            Row(
                              children: [
                                Image(
                                  image: const AssetImage(defensePowerIconPath),
                                  height: Theme.of(context).iconTheme.size,
                                  width: Theme.of(context).iconTheme.size,
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                    '${widget.viewModel.curChallenge!.defense}'),
                              ],
                            ),
                          ]),
                    )
                ]),
          );
        }));
  }
}

class ChallengeLogView extends StatefulWidget {
  const ChallengeLogView({super.key, required this.viewModel});

  final ChallengeViewModel viewModel;

  @override
  State<ChallengeLogView> createState() => _ChallengeLogViewState();
}

class _ChallengeLogViewState extends State<ChallengeLogView> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list =
        widget.viewModel.curChallenge!.log.reversed.toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> log = list[index];
                return ListTile(
                  title: Text(log["attack"]
                      ? AppLocalizations.of(context)!.attackFromKnight(
                          getChallengeLocalizedString(
                                  context, widget.viewModel.curChallenge!)
                              .bossName,
                          log["damage"])
                      : AppLocalizations.of(context)!.attackFromBoss(
                          getChallengeLocalizedString(
                                  context, widget.viewModel.curChallenge!)
                              .bossName,
                          log["damage"])),
                  subtitle: Text(DateFormat("yyyy-MM-dd HH:mm:ss")
                      .format(DateTime.parse(log["time"]))),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
