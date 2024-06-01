import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';

import '../model/common_model.dart';
import '../model/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  static final TaskViewModel instance = TaskViewModel._internal();

  TaskViewModel._internal();

  factory TaskViewModel() => instance;

  final database = AppDatabase();
  List<TaskModel> _tasks = [];

  UnmodifiableListView<TaskModel> get tasks => UnmodifiableListView(_tasks);

  Future<void> initOnFirstRun(BuildContext context) async {
    var tasks = [
      // health
      TaskTableCompanion(
        order: const Value(0),
        title: Value(AppLocalizations.of(context)!.defaultTaskJoggingTitle),
        description:
            Value(AppLocalizations.of(context)!.defaultTaskJoggingDescription),
        difficulty: const Value(Difficulty.easy),
        category: const Value(Category.health),
        repeatType: const Value(RepeatType.daily),
        repeatValue: const Value(1),
        repeatDays: const Value([]),
        deadline: const Value(null),
        finishedCount: const Value(0),
        lastFinishedAt: Value(DateTime(0)),
        createdAt: Value(DateTime.now()),
      ),
      // learning
      TaskTableCompanion(
        order: const Value(1),
        title: Value(AppLocalizations.of(context)!.defaultTaskReadBookTitle),
        description: const Value(""),
        difficulty: const Value(Difficulty.medium),
        category: const Value(Category.learning),
        repeatType: const Value(RepeatType.weekly),
        repeatValue: const Value(1),
        repeatDays: const Value([0, 6]),
        deadline: const Value(null),
        finishedCount: const Value(0),
        lastFinishedAt: Value(DateTime(0)),
        createdAt: Value(DateTime.now()),
      ),
      // career
      TaskTableCompanion(
        order: const Value(2),
        title:
            Value(AppLocalizations.of(context)!.defaultTaskFinishProjectTitle),
        description: Value(
            AppLocalizations.of(context)!.defaultTaskFinishProjectDescription),
        difficulty: const Value(Difficulty.hard),
        category: const Value(Category.career),
        repeatType: const Value(RepeatType.none),
        repeatValue: const Value(0),
        repeatDays: const Value([]),
        deadline: Value(DateTime.now().add(const Duration(days: 7))),
        finishedCount: const Value(0),
        lastFinishedAt: Value(DateTime(0)),
        createdAt: Value(DateTime.now()),
      ),
    ];

    for (var task in tasks) {
      await database.insertTask(task);
    }
  }

  Future<void> loadTasks() async {
    _tasks = await database.getAllTasks();
    notifyListeners();
  }

  Future<void> insertTask(TaskModel task) async {
    database
        .insertTask(TaskTableCompanion(
      order: Value(task.order),
      title: Value(task.title),
      description: Value(task.description),
      difficulty: Value(task.difficulty),
      category: Value(task.category),
      repeatType: Value(task.repeatType),
      repeatValue: Value(task.repeatValue),
      repeatDays: Value(task.repeatDays),
      deadline: Value(task.deadline),
      finishedCount: Value(task.finishedCount),
      lastFinishedAt: Value(task.lastFinishedAt),
      createdAt: Value(task.createdAt),
    ))
        .then((value) {
      task = task.copyWith(id: value);
      _tasks.add(task);
      notifyListeners();
    });
  }

  Future<void> updateTask(TaskModel task) async {
    _tasks[_tasks.indexWhere((element) => element.id == task.id)] = task;
    notifyListeners();
    database.updateTask(task);
  }

  Future<void> removeTask(TaskModel task) async {
    _tasks.remove(task);
    notifyListeners();
    database.deleteTask(task);
  }

  Future<void> reorderTasks(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final task = _tasks.removeAt(oldIndex);
    _tasks.insert(newIndex, task);
    notifyListeners();

    database.reorderTasks(_tasks, oldIndex, newIndex);
  }
}
