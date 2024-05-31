import 'package:flutter/material.dart';
import 'package:liferpg/viewmodel/habit_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../database/database.dart';
import '../../../model/habit_model.dart';
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
                        icon: habit.type == HabitType.good
                            ? const Icon(Icons.add)
                            : const Icon(Icons.remove),
                        onPressed: () {},
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
              child: const Icon(Icons.add),
            ),
          );
        }));
  }

  @override
  bool get wantKeepAlive => true; // keep the state of the widget
}
