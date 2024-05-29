import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../database/database.dart';
import '../model/common_model.dart';
import '../viewmodel/task_viewmodel.dart';

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

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.task?.title ?? '';
    _descriptionController.text = widget.task?.description ?? '';
    _difficultyValue = widget.task?.difficulty ?? Difficulty.easy;
    _categoryValue = widget.task?.category ?? Category.general;
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
