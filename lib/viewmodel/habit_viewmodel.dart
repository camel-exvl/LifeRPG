import 'dart:collection';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:liferpg/database/habit_database.dart';

class HabitViewModel extends ChangeNotifier {
  final database = AppDatabase();
  List<HabitModel> _habits = [];

  UnmodifiableListView<HabitModel> get habits => UnmodifiableListView(_habits);

  Future<void> loadHabits() async {
    _habits = await database.getAllHabits();
    notifyListeners();
  }

  void insertHabit(HabitModel habit) {
    database
        .insertHabit(HabitTableCompanion(
      order: Value(habit.order),
      title: Value(habit.title),
      description: Value(habit.description),
      difficulty: Value(habit.difficulty),
      category: Value(habit.category),
      type: Value(habit.type),
      finishedCount: Value(habit.finishedCount),
      lastFinishedAt: Value(habit.lastFinishedAt),
      createdAt: Value(habit.createdAt),
    ))
        .then((value) {
      habit = habit.copyWith(id: value);
      _habits.add(habit);
      notifyListeners();
    });
    notifyListeners();
  }

  void updateHabit(HabitModel habit) {
    _habits[_habits.indexWhere((element) => element.id == habit.id)] = habit;
    database.updateHabit(habit);
    notifyListeners();
  }

  void removeHabit(HabitModel habit) {
    _habits.remove(habit);
    database.deleteHabit(habit);
    notifyListeners();
  }

  void reorderHabits(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final habit = _habits.removeAt(oldIndex);
    _habits.insert(newIndex, habit);

    for (var i = min(oldIndex, newIndex); i <= max(oldIndex, newIndex); i++) {
      _habits[i] = _habits[i].copyWith(order: i);
      database.updateHabit(_habits[i]);
    }
    notifyListeners();
  }
}
