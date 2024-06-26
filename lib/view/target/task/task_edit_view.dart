import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:liferpg/model/target/task_model.dart';
import 'package:liferpg/view/target/dialog/confirm_dialog.dart';
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
  final int? order; // only used when adding a new task
  final TaskModel? task;

  @override
  State<TaskEditView> createState() => _TaskEditViewState();
}

class _TaskEditViewState extends State<TaskEditView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  late TaskModel _initialTask;
  late Difficulty _difficultyValue;
  late Category _categoryValue;
  late RepeatType _repeatTypeValue;
  late int _repeatValue;
  late List<int> _repeatDaysOfWeek; // sunday..saturday
  late List<int> _repeatDaysOfMonth;
  late DateTime? _deadline;

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    _titleController.text = widget.task?.title ?? '';
    _descriptionController.text = widget.task?.description ?? '';
    _difficultyValue = widget.task?.difficulty ?? Difficulty.easy;
    _categoryValue = widget.task?.category ?? Category.general;
    _repeatTypeValue = widget.task?.repeatType ?? RepeatType.none;
    _repeatValue = widget.task?.repeatValue ?? 1;
    _repeatDaysOfWeek = _repeatTypeValue == RepeatType.weekly
        ? List.from(
            widget.task?.repeatDays ?? [date.weekday == 7 ? 0 : date.weekday])
        : [date.weekday == 7 ? 0 : date.weekday];
    _repeatDaysOfMonth = _repeatTypeValue == RepeatType.monthly
        ? List.from(widget.task?.repeatDays ?? [date.day])
        : [date.day];
    _deadline = widget.task?.deadline;
    _initialTask = _getCurrentTask();
  }

  TaskModel _getCurrentTask() {
    return widget.task?.copyWith(
            title: _titleController.text,
            description: _descriptionController.text,
            difficulty: _difficultyValue,
            category: _categoryValue,
            repeatType: _repeatTypeValue,
            repeatValue: _repeatValue,
            repeatDays: _repeatTypeValue == RepeatType.weekly
                ? List.from(_repeatDaysOfWeek)
                : _repeatTypeValue == RepeatType.monthly
                    ? List.from(_repeatDaysOfMonth)
                    : [],
            deadline: Value(_deadline)) ??
        TaskModel(
            id: 0,
            order: widget.order ?? 0,
            title: _titleController.text,
            description: _descriptionController.text,
            difficulty: _difficultyValue,
            category: _categoryValue,
            repeatType: _repeatTypeValue,
            repeatValue: _repeatValue,
            repeatDays: _repeatTypeValue == RepeatType.weekly
                ? List.from(_repeatDaysOfWeek)
                : _repeatTypeValue == RepeatType.monthly
                    ? List.from(_repeatDaysOfMonth)
                    : [],
            deadline: _deadline,
            finishedCount: 0,
            rewardCoefficient: 1.0,
            lastFinishedAt: DateTime(0),
            nextScheduledAt: DateTime(0),
            createdAt: DateTime.now());
  }

  Future<bool> _onPopInvoked() async {
    if (!_initialTask.isEqual(_getCurrentTask())) {
      final ret = await DiscardChangeDialog().show(context) ?? false;
      return ret;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        final ret = await _onPopInvoked();
        if (context.mounted && ret) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.isAdd
              ? AppLocalizations.of(context)!.addTask
              : AppLocalizations.of(context)!.editTask),
          actions: <Widget>[
            if (!widget.isAdd)
              TextButton(
                onPressed: () {
                  DeleteDialog(onDelete: () {
                    widget.viewModel.removeTask(widget.task!);
                    Navigator.of(context).pop();
                  }).show(context);
                },
                child: Text(AppLocalizations.of(context)!.delete),
              ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (widget.isAdd) {
                    widget.viewModel.insertTask(_getCurrentTask());
                  } else {
                    widget.viewModel.updateTask(_getCurrentTask());
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
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      icon: Image(
                        image: const AssetImage('res/icons/title.png'),
                        width: Theme.of(context).iconTheme.size,
                        height: Theme.of(context).iconTheme.size,
                      ),
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
                        icon: Image(
                          image: const AssetImage('res/icons/description.png'),
                          width: Theme.of(context).iconTheme.size,
                          height: Theme.of(context).iconTheme.size,
                        ),
                        labelText: AppLocalizations.of(context)!.description),
                    maxLines: null),
                DropdownButtonFormField<Category>(
                  decoration: InputDecoration(
                      icon: Image(
                        image: const AssetImage('res/icons/category.png'),
                        width: Theme.of(context).iconTheme.size,
                        height: Theme.of(context).iconTheme.size,
                      ),
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
                        child: Row(children: [
                          Image(
                              image:
                                  const AssetImage('res/icons/difficulty.png'),
                              width: Theme.of(context).iconTheme.size,
                              height: Theme.of(context).iconTheme.size),
                          Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                  AppLocalizations.of(context)!.difficulty))
                        ]))),
                SegmentedButton<Difficulty>(
                    segments: Difficulty.values
                        .map((difficulty) => ButtonSegment(
                            icon: Image(
                                image: AssetImage(difficulty.iconPath()),
                                width: Theme.of(context).iconTheme.size,
                                height: Theme.of(context).iconTheme.size),
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
                      leading: Image(
                        image: const AssetImage('res/icons/repeat.png'),
                        width: Theme.of(context).iconTheme.size,
                        height: Theme.of(context).iconTheme.size,
                      ),
                      title: Text(AppLocalizations.of(context)!.repeat),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(repeatHint(
                              context,
                              _repeatTypeValue,
                              _repeatValue,
                              _repeatDaysOfWeek,
                              _repeatDaysOfMonth)),
                          if (_repeatTypeValue == RepeatType.none)
                            Text((_deadline == null
                                ? AppLocalizations.of(context)!.noDeadline
                                : "${AppLocalizations.of(context)!.deadline}: ${DateFormat('yyyy-MM-dd HH:mm').format(_deadline!)}")),
                        ],
                      ),
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
                                      deadline: _deadline,
                                    )))
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              _repeatTypeValue = value['repeatTypeValue'];
                              _repeatValue = value['repeatValue'];
                              _repeatDaysOfWeek = value['repeatDaysOfWeek'];
                              _repeatDaysOfMonth = value['repeatDaysOfMonth'];
                              _deadline = value['deadline'];
                            });
                          }
                        });
                      },
                    )),
              ],
            ),
          )),
        ),
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
