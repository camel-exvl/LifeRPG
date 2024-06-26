import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/database/database.dart';
import 'package:liferpg/viewmodel/challenge_viewmodel.dart';
import 'package:liferpg/viewmodel/status_viewmodel.dart';

import '../model/common_model.dart';
import '../model/reward/reward_request_model.dart';
import '../model/reward/reward_response_model.dart';
import '../model/target/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  static final TaskViewModel instance = TaskViewModel._internal();

  TaskViewModel._internal();

  factory TaskViewModel() => instance;

  final database = AppDatabase();
  final _statusViewModel = StatusViewModel();
  final _challengeViewModel = ChallengeViewModel();
  List<TaskModel> _tasks = [];

  UnmodifiableListView<TaskModel> get tasks => UnmodifiableListView(_tasks);

  Future<void> initOnFirstRun(BuildContext context) async {
    final tasks = [
      // health
      TaskModel(
        id: 0,
        order: 0,
        title: AppLocalizations.of(context)!.defaultTaskJoggingTitle,
        description:
            AppLocalizations.of(context)!.defaultTaskJoggingDescription,
        difficulty: Difficulty.easy,
        category: Category.health,
        repeatType: RepeatType.daily,
        repeatValue: 1,
        repeatDays: [],
        deadline: null,
        finishedCount: 0,
        rewardCoefficient: 1.0,
        lastFinishedAt: DateTime(0),
        nextScheduledAt: DateTime.now(),
        createdAt: DateTime.now(),
      ),
      // learning
      TaskModel(
        id: 0,
        order: 1,
        title: AppLocalizations.of(context)!.defaultTaskReadBookTitle,
        description: "",
        difficulty: Difficulty.medium,
        category: Category.learning,
        repeatType: RepeatType.weekly,
        repeatValue: 1,
        repeatDays: [0, 6],
        deadline: null,
        finishedCount: 0,
        rewardCoefficient: 1.0,
        lastFinishedAt: DateTime(0),
        nextScheduledAt: DateTime.now(),
        createdAt: DateTime.now(),
      ),
      // career
      TaskModel(
        id: 0,
        order: 2,
        title: AppLocalizations.of(context)!.defaultTaskFinishProjectTitle,
        description:
            AppLocalizations.of(context)!.defaultTaskFinishProjectDescription,
        difficulty: Difficulty.hard,
        category: Category.career,
        repeatType: RepeatType.none,
        repeatValue: 0,
        repeatDays: [],
        deadline: DateTime.now().add(const Duration(days: 7)),
        finishedCount: 0,
        rewardCoefficient: 1.0,
        lastFinishedAt: DateTime(0),
        nextScheduledAt: DateTime.now(),
        createdAt: DateTime.now(),
      ),
    ];

    for (var task in tasks) {
      await insertTask(task);
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
      rewardCoefficient: Value(task.rewardCoefficient),
      nextScheduledAt: Value(task.nextScheduledAt),
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

  Future<RewardResponseModel> finishTask(
      BuildContext context, TaskModel task) async {
    RewardRequestModel request = RewardRequestModel(
      difficulty: task.difficulty,
      category: task.category,
      finishedCount: task.finishedCount,
      lastFinishedAt: task.lastFinishedAt,
      rewardCoefficient: task.rewardCoefficient,
      habitType: null,
    );
    final response = _statusViewModel.getReward(request);
    _challengeViewModel.attackBoss(context, request);
    if (task.repeatType == RepeatType.none) {
      // delete the task if it's not repeatable
      removeTask(task);
    } else {
      // update the task if it's repeatable
      final dateTime = DateTime.now();
      DateTime nextScheduledAt;
      switch (task.repeatType) {
        case RepeatType.daily:
          nextScheduledAt = DateTime(
              dateTime.year, dateTime.month, dateTime.day + task.repeatValue);
          break;
        case RepeatType.weekly:
          final currentDay = dateTime.weekday == 7 ? 0 : dateTime.weekday;
          final nextDay = task.repeatDays
              .firstWhere((element) => element > currentDay, orElse: () => -1);
          if (nextDay == -1) {
            nextScheduledAt = DateTime(dateTime.year, dateTime.month,
                task.repeatDays.first + 7 * task.repeatValue);
          } else {
            nextScheduledAt = DateTime(dateTime.year, dateTime.month,
                dateTime.day + nextDay - currentDay);
          }
          break;
        case RepeatType.monthly:
          final currentDay = dateTime.day;
          final nextDay = task.repeatDays
              .firstWhere((element) => element > currentDay, orElse: () => -1);
          if (nextDay == -1) {
            nextScheduledAt = DateTime(dateTime.year,
                dateTime.month + task.repeatValue, task.repeatDays.first);
          } else {
            nextScheduledAt = DateTime(dateTime.year, dateTime.month, nextDay);
          }
          break;
        case RepeatType.yearly:
          nextScheduledAt = DateTime(
              dateTime.year + task.repeatValue, dateTime.month, dateTime.day);
          break;
        default:
          throw Exception("Unknown repeat type");
      }
      task = task.copyWith(
        finishedCount: task.finishedCount + 1,
        nextScheduledAt: nextScheduledAt,
        rewardCoefficient: response.penaltyCoefficient,
        lastFinishedAt: DateTime.now(),
      );
      updateTask(task);
    }
    return response;
  }
}
