import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';

class ChallengeViewModel extends ChangeNotifier {
  static final ChallengeViewModel instance = ChallengeViewModel._internal();

  ChallengeViewModel._internal() {
    loadData();
  }

  factory ChallengeViewModel() => instance;

  final database = AppDatabase();
  List<ChallengeModel> _challenges = [];

  UnmodifiableListView<ChallengeModel> get challenges =>
      UnmodifiableListView(_challenges);

  Future<void> initOnFirstRun(BuildContext context) async {
    // TODO: insert one challenge at first time
  }

  Future<void> loadData() async {
    _challenges = await database.getAllChallenges();
    notifyListeners();
  }

  Future<void> insertChallenge(ChallengeModel challenge) async {
    database
        .insertChallenge(ChallengeTableCompanion(
      name: Value(challenge.name),
      description: Value(challenge.description),
      imagePath: Value(challenge.imagePath),
      bossName: Value(challenge.bossName),
      hp: Value(challenge.hp),
      attack: Value(challenge.attack),
      defense: Value(challenge.defense),
      rewardGold: Value(challenge.rewardGold),
    ))
        .then((value) {
      challenge = challenge.copyWith(id: value);
      _challenges.add(challenge);
      notifyListeners();
    });
  }

  Future<void> updateChallenge(ChallengeModel challenge) async {
    _challenges[_challenges
        .indexWhere((element) => element.id == challenge.id)] = challenge;
    notifyListeners();
    database.updateChallenge(challenge);
  }

  Future<void> removeChallenge(ChallengeModel challenge) async {
    _challenges.removeWhere((element) => element.id == challenge.id);
    notifyListeners();
    database.deleteChallenge(challenge);
  }
}
