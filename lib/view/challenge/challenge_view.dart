import 'package:flutter/material.dart';

class ChallengeView extends StatefulWidget {
  const ChallengeView({super.key});

  @override
  State<ChallengeView> createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          QuestSwitchView(),
          Divider(),
          BossInfoView(),
          Divider(),
          ChallengeLogView()
        ],
      ),
    );
  }
}

class QuestSwitchView extends StatefulWidget {
  const QuestSwitchView({super.key});

  @override
  State<QuestSwitchView> createState() => _QuestSwitchViewState();
}

class _QuestSwitchViewState extends State<QuestSwitchView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Image(
          image: AssetImage('res/icons/boss/dragon_lair.png'),
        ),
        Text('当前副本：龙之巢穴', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8.0),
        OutlinedButton(
          onPressed: () {},
          child: const Text('切换副本'),
        ),
      ],
    );
  }
}

class BossInfoView extends StatefulWidget {
  const BossInfoView({super.key});

  @override
  State<BossInfoView> createState() => _BossInfoViewState();
}

class _BossInfoViewState extends State<BossInfoView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('骑士', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8.0),
            Column(
              children: [
                Row(
                  children: [
                    const Text('生命值: '),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.5,
                        semanticsLabel: '50%',
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                        backgroundColor:
                            Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                  ],
                ),
                const Align(
                    alignment: Alignment.centerRight, child: Text('500/1000')),
              ],
            ),
            const Text('攻击力: 100'),
            const Text('防御力: 50'),
          ]),
        ),
        const VerticalDivider(),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('龙', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8.0),
            Column(
              children: [
                Row(
                  children: [
                    const Text('生命值: '),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.5,
                        semanticsLabel: '50%',
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                        backgroundColor:
                            Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                  ],
                ),
                const Align(
                    alignment: Alignment.centerRight, child: Text('500/1000')),
              ],
            ),
            const Text('攻击力: 100'),
            const Text('防御力: 50'),
          ]),
        )
      ]),
    );
  }
}

class ChallengeLogView extends StatefulWidget {
  const ChallengeLogView({super.key});

  @override
  State<ChallengeLogView> createState() => _ChallengeLogViewState();
}

class _ChallengeLogViewState extends State<ChallengeLogView> {
  @override
  Widget build(BuildContext context) {
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
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  title: Text('骑士对龙造成了100点伤害'),
                  subtitle: Text('2021-09-01 12:00:00'),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
