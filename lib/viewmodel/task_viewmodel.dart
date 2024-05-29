import 'dart:collection';
import 'dart:math';

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

    for (var i = min(oldIndex, newIndex); i <= max(oldIndex, newIndex); i++) {
      _tasks[i] = _tasks[i].copyWith(order: i);
      database.updateTask(_tasks[i]);
    }
    notifyListeners();
  }
}
