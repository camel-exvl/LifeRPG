import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/view/habit_view.dart';

class TargetView extends StatefulWidget {
  const TargetView({super.key});

  @override
  State<TargetView> createState() => _TargetViewState();
}

class _TargetViewState extends State<TargetView> {
  final PageStorageBucket _bucket = PageStorageBucket();
  final List<Widget> _views = const <Widget>[
    HabitView(
      key: PageStorageKey('HabitView'),
    ),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.targetsTab),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: AppLocalizations.of(context)!.habitsTab),
              Tab(text: AppLocalizations.of(context)!.tasksTab),
            ],
          ),
        ),
        body: TabBarView(
          children: _views.map((Widget view) {
            return PageStorage(
              bucket: _bucket,
              child: view,
            );
          }).toList(),
        ),
      ),
    );
  }
}
