import 'dart:collection';

import 'package:flutter/material.dart';

import '../model/habit_model.dart';

class HabitViewModel extends ChangeNotifier {
  final List<HabitModel> _habits = [];

  UnmodifiableListView<HabitModel> get habits => UnmodifiableListView(_habits);

  void addHabit(HabitModel habit) {
    _habits.add(habit);
    notifyListeners();
  }

  void removeHabit(HabitModel habit) {
    _habits.remove(habit);
    notifyListeners();
  }

  void editHabit(HabitModel habit) {
    _habits[_habits.indexWhere((element) => element.id == habit.id)] = habit;
    notifyListeners();
  }
}
