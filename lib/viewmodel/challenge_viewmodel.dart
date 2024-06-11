import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/database.dart';

class ChallengeViewModel extends ChangeNotifier {
  static final ChallengeViewModel instance = ChallengeViewModel._internal();

  ChallengeViewModel._internal() {
    loadData();
  }

  factory ChallengeViewModel() => instance;

  final database = AppDatabase();
  List<ChallengeModel> _challenges = [];
  ChallengeModel? curChallenge;

  UnmodifiableListView<ChallengeModel> get challenges =>
      UnmodifiableListView(_challenges);

  Future<void> initOnFirstRun(BuildContext context) async {
    final challenges = [
      const ChallengeModel(
          id: 0,
          name: "dragonLair",
          description: "",
          imagePath: 'res/icons/boss/dragon_lair.png',
          bossName: "",
          totalHp: 100,
          curHp: 100,
          attack: 10,
          defense: 5,
          rewardGold: 100)
    ];

    for (var challenge in challenges) {
      await insertChallenge(challenge);
    }
  }

  Future<void> loadData() async {
    _challenges = await database.getAllChallenges();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? curChallengeID = prefs.getInt('cur_challenge');
    if (curChallengeID != null) {
      curChallenge = await database.getChallengeById(curChallengeID);
    }
    notifyListeners();
  }

  Future<void> setCurChallenge(int? id) async {
    if (id == null) {
      curChallenge = null;
    } else {
      curChallenge = await database.getChallengeById(id);
    }
    notifyListeners();
  }

  Future<void> insertChallenge(ChallengeModel challenge) async {
    database
        .insertChallenge(ChallengeTableCompanion(
      name: Value(challenge.name),
      description: Value(challenge.description),
      imagePath: Value(challenge.imagePath),
      bossName: Value(challenge.bossName),
      totalHp: Value(challenge.totalHp),
      curHp: Value(challenge.curHp),
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
