import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/model/reward/reward_response_model.dart';
import 'package:liferpg/viewmodel/challenge_viewmodel.dart';
import 'package:liferpg/viewmodel/status_viewmodel.dart';

import '../model/common_model.dart';
import '../model/reward/reward_request_model.dart';
import '../model/target/habit_model.dart';

class HabitViewModel extends ChangeNotifier {
  static final HabitViewModel instance = HabitViewModel._internal();

  HabitViewModel._internal();

  factory HabitViewModel() => instance;

  final database = AppDatabase();
  final _statusViewModel = StatusViewModel();
  final _challengeViewModel = ChallengeViewModel();
  List<HabitModel> _habits = [];

  UnmodifiableListView<HabitModel> get habits => UnmodifiableListView(_habits);

  Future<void> initOnFirstRun(BuildContext context) async {
    final habits = [
      // learning
      HabitModel(
        id: 0,
        order: 0,
        title: AppLocalizations.of(context)!.defaultHabitReadingTitle,
        description:
            AppLocalizations.of(context)!.defaultHabitReadingDescription,
        difficulty: Difficulty.easy,
        category: Category.learning,
        type: HabitType.good,
        finishedCount: 0,
        rewardCoefficient: 1.0,
        lastFinishedAt: DateTime(0),
        createdAt: DateTime.now(),
      ),
      // art
      HabitModel(
        id: 0,
        order: 1,
        title: AppLocalizations.of(context)!.defaultHabitPlayGuitarTitle,
        description:
            AppLocalizations.of(context)!.defaultHabitPlayGuitarDescription,
        difficulty: Difficulty.medium,
        category: Category.art,
        type: HabitType.good,
        finishedCount: 0,
        rewardCoefficient: 1.0,
        lastFinishedAt: DateTime(0),
        createdAt: DateTime.now(),
      ),
      // health
      HabitModel(
        id: 0,
        order: 2,
        title: AppLocalizations.of(context)!.defaultHabitSmokeCigaretteTitle,
        description: "",
        difficulty: Difficulty.hard,
        category: Category.health,
        type: HabitType.bad,
        finishedCount: 0,
        rewardCoefficient: 1.0,
        lastFinishedAt: DateTime(0),
        createdAt: DateTime.now(),
      ),
    ];

    for (var habit in habits) {
      await insertHabit(habit);
    }
  }

  Future<void> loadHabits() async {
    _habits = await database.getAllHabits();
    notifyListeners();
  }

  Future<void> insertHabit(HabitModel habit) async {
    database
        .insertHabit(HabitTableCompanion(
      order: Value(habit.order),
      title: Value(habit.title),
      description: Value(habit.description),
      difficulty: Value(habit.difficulty),
      category: Value(habit.category),
      type: Value(habit.type),
      finishedCount: Value(habit.finishedCount),
      rewardCoefficient: Value(habit.rewardCoefficient),
      lastFinishedAt: Value(habit.lastFinishedAt),
      createdAt: Value(habit.createdAt),
    ))
        .then((value) {
      habit = habit.copyWith(id: value);
      _habits.add(habit);
      notifyListeners();
    });
  }

  Future<void> updateHabit(HabitModel habit) async {
    _habits[_habits.indexWhere((element) => element.id == habit.id)] = habit;
    notifyListeners();
    database.updateHabit(habit);
  }

  Future<void> removeHabit(HabitModel habit) async {
    _habits.remove(habit);
    notifyListeners();
    database.deleteHabit(habit);
  }

  Future<void> reorderHabits(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final habit = _habits.removeAt(oldIndex);
    _habits.insert(newIndex, habit);
    notifyListeners();

    database.reorderHabits(_habits, oldIndex, newIndex);
  }

  Future<RewardResponseModel> finishHabit(
      BuildContext context, HabitModel habit) async {
    RewardRequestModel request = RewardRequestModel(
      difficulty: habit.difficulty,
      category: habit.category,
      finishedCount: habit.finishedCount,
      lastFinishedAt: habit.lastFinishedAt,
      rewardCoefficient: habit.rewardCoefficient,
      habitType: habit.type,
    );
    final response = _statusViewModel.getReward(request);
    _challengeViewModel.attackBoss(context, request);

    habit = habit.copyWith(
      finishedCount: habit.finishedCount + 1,
      rewardCoefficient: response.penaltyCoefficient,
      lastFinishedAt: DateTime.now(),
    );
    updateHabit(habit);
    return response;
  }
}
