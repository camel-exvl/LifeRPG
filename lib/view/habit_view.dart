import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/viewmodel/habit_viewmodel.dart';
import 'package:provider/provider.dart';

import '../model/common_model.dart';
import '../model/habit_model.dart';

class HabitView extends StatefulWidget {
  const HabitView({super.key});

  @override
  State<HabitView> createState() => _HabitViewState();
}

class _HabitViewState extends State<HabitView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HabitViewModel(),
        child: Consumer<HabitViewModel>(builder: (context, viewModel, child) {
          return Scaffold(
            body: ListView.builder(
              itemCount: viewModel.habits.length,
              itemBuilder: (context, index) {
                HabitModel habit = viewModel.habits[index];
                return ListTile(
                  title: Text(habit.title),
                  subtitle: Text(habit.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      // model.completeHabit(habit);
                    },
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddHabitDialog(viewModel: viewModel);
                    });
              },
              child: const Icon(Icons.add),
            ),
          );
        }));
  }
}

class AddHabitDialog extends StatefulWidget {
  const AddHabitDialog({super.key, required this.viewModel});

  final HabitViewModel viewModel;

  @override
  State<AddHabitDialog> createState() => _AddHabitDialogState();
}

class _AddHabitDialogState extends State<AddHabitDialog> {
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.addHabit),
      content: Form(
        key: globalKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.title),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.titleRequired;
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.description),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.descriptionRequired;
                }
                return null;
              },
            ),
            DropdownButtonFormField<Difficulty>(
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.difficulty),
              items: Difficulty.values
                  .map((difficulty) => DropdownMenuItem(
                        value: difficulty,
                        child: Text(difficulty.toString()),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return AppLocalizations.of(context)!.difficultyRequired;
                }
                return null;
              },
              onChanged: (Difficulty? value) {},
            ),
            DropdownButtonFormField<Category>(
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.category),
              items: Category.values
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.toString()),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return AppLocalizations.of(context)!.categoryRequired;
                }
                return null;
              },
              onChanged: (Category? value) {},
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        TextButton(
          onPressed: () {
            if (globalKey.currentState!.validate()) {
              widget.viewModel.addHabit(HabitModel(
                title: 'title',
                description: 'description',
                difficulty: Difficulty.easy,
                category: Category.health,
              ));
              Navigator.of(context).pop();
            }
          },
          child: Text(AppLocalizations.of(context)!.add),
        ),
      ],
    );
  }
}
