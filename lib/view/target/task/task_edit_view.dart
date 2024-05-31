import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/task_model.dart';
import 'package:liferpg/view/target/task/task_repeat_edit_view.dart';

import '../../../database/database.dart';
import '../../../model/common_model.dart';
import '../../../viewmodel/task_viewmodel.dart';

class TaskEditView extends StatefulWidget {
  const TaskEditView(
      {super.key,
      required this.viewModel,
      required this.isAdd,
      this.order,
      this.task});

  final TaskViewModel viewModel;
  final bool isAdd;
  final int? order;
  final TaskModel? task;

  @override
  State<TaskEditView> createState() => _TaskEditViewState();
}

class _TaskEditViewState extends State<TaskEditView> {
  final _globalKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  late Difficulty _difficultyValue;
  late Category _categoryValue;
  late RepeatType _repeatTypeValue;
  late int _repeatValue;
  late List<int> _repeatDaysOfWeek; // sunday..saturday
  late List<int> _repeatDaysOfMonth;

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    _titleController.text = widget.task?.title ?? '';
    _descriptionController.text = widget.task?.description ?? '';
    _difficultyValue = widget.task?.difficulty ?? Difficulty.easy;
    _categoryValue = widget.task?.category ?? Category.general;
    _repeatTypeValue = widget.task?.scheduleType ?? RepeatType.none;
    _repeatValue = widget.task?.scheduleValue ?? 1;
    _repeatDaysOfWeek = _repeatTypeValue == RepeatType.weekly
        ? widget.task?.scheduleDays ?? [date.weekday == 7 ? 0 : date.weekday]
        : [date.weekday == 7 ? 0 : date.weekday];
    _repeatDaysOfMonth = _repeatTypeValue == RepeatType.monthly
        ? widget.task?.scheduleDays ?? [date.day]
        : [date.day];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isAdd
            ? AppLocalizations.of(context)!.addTask
            : AppLocalizations.of(context)!.editTask),
        actions: <Widget>[
          if (!widget.isAdd)
            TextButton(
              onPressed: () {
                widget.viewModel.removeTask(widget.task!);
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.delete),
            ),
          TextButton(
            onPressed: () {
              if (_globalKey.currentState!.validate()) {
                if (widget.isAdd) {
                  widget.viewModel.insertTask(TaskModel(
                      id: 0,
                      order: widget.order!,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      difficulty: _difficultyValue,
                      category: _categoryValue,
                      scheduleType: _repeatTypeValue,
                      scheduleValue: _repeatValue,
                      scheduleDays: _repeatTypeValue == RepeatType.weekly
                          ? _repeatDaysOfWeek
                          : _repeatTypeValue == RepeatType.monthly
                              ? _repeatDaysOfMonth
                              : [],
                      finishedCount: 0,
                      lastFinishedAt: DateTime(0),
                      createdAt: DateTime.now()));
                } else {
                  widget.viewModel.updateTask(TaskModel(
                      id: widget.task!.id,
                      order: widget.task!.order,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      difficulty: _difficultyValue,
                      category: _categoryValue,
                      scheduleType: _repeatTypeValue,
                      scheduleValue: _repeatValue,
                      scheduleDays: _repeatTypeValue == RepeatType.weekly
                          ? _repeatDaysOfWeek
                          : _repeatTypeValue == RepeatType.monthly
                              ? _repeatDaysOfMonth
                              : [],
                      finishedCount: widget.task!.finishedCount,
                      lastFinishedAt: widget.task!.lastFinishedAt,
                      createdAt: widget.task!.createdAt));
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
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.difficulty,
                      ))),
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
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(AppLocalizations.of(context)!.repeat),
                    subtitle: Text(repeatHint(context, _repeatTypeValue,
                        _repeatValue, _repeatDaysOfWeek, _repeatDaysOfMonth)),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => TaskRepeatEditView(
                                    repeatTypeValue: _repeatTypeValue,
                                    repeatValue: _repeatValue,
                                    repeatDaysOfWeek: _repeatDaysOfWeek,
                                    repeatDaysOfMonth: _repeatDaysOfMonth,
                                  )))
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            _repeatTypeValue = value['repeatTypeValue'];
                            _repeatValue = value['repeatValue'];
                            _repeatDaysOfWeek = value['repeatDaysOfWeek'];
                            _repeatDaysOfMonth = value['repeatDaysOfMonth'];
                          });
                        }
                      });
                    },
                  )),
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

String repeatHint(BuildContext context, RepeatType repeatTypeValue,
    int repeatValue, List<int> repeatDaysOfWeek, List<int> repeatDaysOfMonth) {
  switch (repeatTypeValue) {
    case RepeatType.none:
      return AppLocalizations.of(context)!.noRepeat;
    case RepeatType.daily:
      return AppLocalizations.of(context)!.repeatHintWithoutDay(
          repeatTypeValue.localizedString(context), repeatValue);
    case RepeatType.weekly:
      return AppLocalizations.of(context)!.repeatHintWithDay(
        repeatDaysOfWeek
            .map((day) => DayOfWeek.values[day].localizedString(context))
            .join(', '),
        repeatTypeValue.localizedString(context),
        repeatValue,
      );
    case RepeatType.monthly:
      return AppLocalizations.of(context)!.repeatHintWithDay(
          repeatDaysOfMonth.join(', '),
          repeatTypeValue.localizedString(context),
          repeatValue);
    case RepeatType.yearly:
      return AppLocalizations.of(context)!.repeatHintWithoutDay(
          repeatTypeValue.localizedString(context), repeatValue);
  }
}
