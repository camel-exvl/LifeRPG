import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:liferpg/database/database.dart';

class TaskViewModel extends ChangeNotifier {
  final database = AppDatabase();
  List<TaskModel> _tasks = [];

  UnmodifiableListView<TaskModel> get tasks => UnmodifiableListView(_tasks);

  Future<void> loadTasks() async {
    _tasks = await database.getAllTasks();
    notifyListeners();
  }

  void insertTask(TaskModel task) {
    database
        .insertTask(TaskTableCompanion(
      order: Value(task.order),
      title: Value(task.title),
      description: Value(task.description),
      difficulty: Value(task.difficulty),
      category: Value(task.category),
      scheduleType: Value(task.scheduleType),
      scheduleValue: Value(task.scheduleValue),
      scheduleDays: Value(task.scheduleDays),
      finishedCount: Value(task.finishedCount),
      lastFinishedAt: Value(task.lastFinishedAt),
      createdAt: Value(task.createdAt),
    ))
        .then((value) {
      task = task.copyWith(id: value);
      _tasks.add(task);
      notifyListeners();
    });
    notifyListeners();
  }

  void updateTask(TaskModel task) {
    _tasks[_tasks.indexWhere((element) => element.id == task.id)] = task;
    database.updateTask(task);
    notifyListeners();
  }

  void removeTask(TaskModel task) {
    _tasks.remove(task);
    database.deleteTask(task);
    notifyListeners();
  }

  void reorderTasks(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final task = _tasks.removeAt(oldIndex);
    _tasks.insert(newIndex, task);

    database.reorderTasks(_tasks, oldIndex, newIndex);
    notifyListeners();
  }
}
