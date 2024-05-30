import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../database/database.dart';
import '../model/common_model.dart';
import '../model/habit_model.dart';
import '../viewmodel/habit_viewmodel.dart';

class HabitEditView extends StatefulWidget {
  const HabitEditView(
      {super.key,
      required this.viewModel,
      required this.isAdd,
      this.order,
      this.habit});

  final HabitViewModel viewModel;
  final bool isAdd;
  final int? order;
  final HabitModel? habit;

  @override
  State<HabitEditView> createState() => _HabitEditViewState();
}

class _HabitEditViewState extends State<HabitEditView> {
  final _globalKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  late Difficulty _difficultyValue;
  late Category _categoryValue;
  late HabitType _habitTypeValue;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.habit?.title ?? '';
    _descriptionController.text = widget.habit?.description ?? '';
    _difficultyValue = widget.habit?.difficulty ?? Difficulty.easy;
    _categoryValue = widget.habit?.category ?? Category.general;
    _habitTypeValue = widget.habit?.type ?? HabitType.good;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isAdd
            ? AppLocalizations.of(context)!.addHabit
            : AppLocalizations.of(context)!.editHabit),
        actions: <Widget>[
          if (!widget.isAdd)
            TextButton(
              onPressed: () {
                widget.viewModel.removeHabit(widget.habit!);
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.delete),
            ),
          TextButton(
            onPressed: () {
              if (_globalKey.currentState!.validate()) {
                if (widget.isAdd) {
                  widget.viewModel.insertHabit(HabitModel(
                      id: 0,
                      order: widget.order!,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      difficulty: _difficultyValue,
                      category: _categoryValue,
                      type: _habitTypeValue,
                      finishedCount: 0,
                      lastFinishedAt: DateTime(0),
                      createdAt: DateTime.now()));
                } else {
                  widget.viewModel.updateHabit(HabitModel(
                      id: widget.habit!.id,
                      order: widget.habit!.order,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      difficulty: _difficultyValue,
                      category: _categoryValue,
                      type: _habitTypeValue,
                      finishedCount: widget.habit!.finishedCount,
                      lastFinishedAt: widget.habit!.lastFinishedAt,
                      createdAt: widget.habit!.createdAt));
                }
                Navigator.of(context).pop();
              }
            },
            child: Text(AppLocalizations.of(context)!.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Form(
          key: _globalKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: _titleController,
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
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.description),
                  maxLines: null),
              DropdownButtonFormField<Category>(
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.category),
                items: Category.values
                    .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.localizedString(context))))
                    .toList(),
                value: _categoryValue,
                onChanged: (Category? value) {
                  setState(() {
                    _categoryValue = value!;
                  });
                },
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(AppLocalizations.of(context)!.difficulty)),
              SegmentedButton<Difficulty>(
                  segments: Difficulty.values
                      .map((difficulty) => ButtonSegment(
                          value: difficulty,
                          label: Text(difficulty.localizedString(context))))
                      .toList(),
                  selected: <Difficulty>{_difficultyValue},
                  onSelectionChanged: (selected) {
                    setState(() {
                      _difficultyValue = selected.first;
                    });
                  },
                  showSelectedIcon: false),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(AppLocalizations.of(context)!.habitType),
              ),
              SegmentedButton<HabitType>(
                  segments: HabitType.values
                      .map((habitType) => ButtonSegment(
                          value: habitType,
                          label: Text(habitType.localizedString(context))))
                      .toList(),
                  selected: <HabitType>{_habitTypeValue},
                  onSelectionChanged: (selected) {
                    setState(() {
                      _habitTypeValue = selected.first;
                    });
                  },
                  showSelectedIcon: false),
            ],
          ),
        )),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
