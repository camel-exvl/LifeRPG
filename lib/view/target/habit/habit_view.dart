import 'package:flutter/material.dart';
import 'package:liferpg/view/target/dialog/finish_dialog.dart';
import 'package:liferpg/view/target/dialog/frequent_finish_warning_dialog.dart';
import 'package:liferpg/viewmodel/habit_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../database/database.dart';
import '../../../model/target/habit_model.dart';
import 'habit_edit_view.dart';

class HabitView extends StatefulWidget {
  const HabitView({super.key});

  @override
  State<HabitView> createState() => _HabitViewState();
}

class _HabitViewState extends State<HabitView>
    with AutomaticKeepAliveClientMixin {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      // wait for the widget to be built
      _refreshIndicatorKey.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
        create: (context) => HabitViewModel(),
        child: Consumer<HabitViewModel>(builder: (context, viewModel, child) {
          return Scaffold(
            body: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () {
                  return viewModel.loadHabits();
                },
                child: ReorderableListView.builder(
                  itemCount: viewModel.habits.length,
                  itemBuilder: (context, index) {
                    HabitModel habit = viewModel.habits[index];
                    return ListTile(
                      key: ValueKey(habit.id),
                      title: Text(habit.title),
                      subtitle: Text(habit.description),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HabitEditView(
                                viewModel: viewModel,
                                isAdd: false,
                                habit: habit)));
                      },
                      trailing: IconButton(
                        icon: Image(
                          image: habit.type == HabitType.good
                              ? const AssetImage('res/icons/finish.png')
                              : const AssetImage('res/icons/finish_bad.png'),
                          width: Theme.of(context).iconTheme.size,
                          height: Theme.of(context).iconTheme.size,
                        ),
                        onPressed: () async {
                          final response =
                              await viewModel.finishHabit(context, habit);
                          if (context.mounted) {
                            await FinishDialog().show(context, response);
                          }
                          if (context.mounted &&
                              habit.type == HabitType.good &&
                              response.penaltyCoefficient < 0.8) {
                            FrequentFinishWarningDialog().show(context);
                          }
                        },
                      ),
                    );
                  },
                  onReorder: (int oldIndex, int newIndex) {
                    viewModel.reorderHabits(oldIndex, newIndex);
                  },
                )),
            floatingActionButton: FloatingActionButton(
              heroTag: 'HabitView',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HabitEditView(
                        viewModel: viewModel,
                        isAdd: true,
                        order: viewModel.habits.length)));
              },
              backgroundColor: Theme.of(context).colorScheme.surface,
              elevation: 0,
              child: const Image(
                image: AssetImage('res/icons/add.png'),
              ),
            ),
          );
        }));
  }

  @override
  bool get wantKeepAlive => true; // keep the state of the widget
}
