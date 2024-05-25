import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/view/habit_view.dart';

class TargetView extends StatefulWidget {
  const TargetView({super.key});

  @override
  State<TargetView> createState() => _TargetViewState();
}

class _TargetViewState extends State<TargetView> {
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
        body: const TabBarView(
          children: <Widget>[HabitView(), Placeholder()],
        ),
      ),
    );
  }
}
