import 'package:flutter/material.dart';
import 'package:liferpg/viewmodel/habit_viewmodel.dart';
import 'package:provider/provider.dart';

import '../model/habit_model.dart';
import 'habit_edit_view.dart';

class HabitView extends StatefulWidget {
  const HabitView({super.key});

  @override
  State<HabitView> createState() => _HabitViewState();
}

class _HabitViewState extends State<HabitView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
        create: (context) => HabitViewModel(),
        child: Consumer<HabitViewModel>(builder: (context, viewModel, child) {
          return Scaffold(
            body: ReorderableListView.builder(
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
                            viewModel: viewModel, isAdd: false, habit: habit)));
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                );
              },
              onReorder: (int oldIndex, int newIndex) {
                viewModel.reorderHabit(oldIndex, newIndex);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        HabitEditView(viewModel: viewModel, isAdd: true)));
              },
              child: const Icon(Icons.add),
            ),
          );
        }));
  }

  @override
  bool get wantKeepAlive => true; // keep the state of the widget
}
