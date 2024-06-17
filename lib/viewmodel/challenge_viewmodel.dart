import 'dart:collection';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liferpg/model/common_model.dart';
import 'package:liferpg/model/target/habit_model.dart';
import 'package:liferpg/viewmodel/status_viewmodel.dart';
import 'package:liferpg/viewmodel/store_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/database.dart';
import '../model/challenge/challenge_model.dart';
import '../model/reward/reward_request_model.dart';
import '../model/reward/reward_response_model.dart';
import '../view/target/dialog/finish_dialog.dart';

class ChallengeViewModel extends ChangeNotifier {
  static final ChallengeViewModel instance = ChallengeViewModel._internal();

  ChallengeViewModel._internal() {
    loadData();
  }

  factory ChallengeViewModel() => instance;

  final database = AppDatabase();
  List<ChallengeModel> _challenges = [];
  StatusViewModel statusViewModel = StatusViewModel();
  int hp = 10;
  int maxHp = 10;

  UnmodifiableListView<ChallengeModel> get challenges =>
      UnmodifiableListView(_challenges);
  ChallengeModel? curChallenge;

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
          attack: 60,
          defense: 50,
          rewardGold: 100,
          log: [])
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
    hp = statusViewModel.getHP();
    maxHp = statusViewModel.getMaxHp();
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
    if (_challenges.any((element) => element.name == challenge.name)) {
      return;
    }
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
            log: Value(challenge.log)))
        .then((value) {
      challenge = challenge.copyWith(id: value);
      _challenges.add(challenge);
      notifyListeners();
    });
  }

  Future<void> updateChallenge(ChallengeModel challenge) async {
    _challenges[_challenges
        .indexWhere((element) => element.id == challenge.id)] = challenge;
    if (curChallenge != null && curChallenge!.id == challenge.id) {
      curChallenge = challenge;
    }
    notifyListeners();
    database.updateChallenge(challenge);
  }

  Future<void> removeChallenge(ChallengeModel challenge) async {
    _challenges.removeWhere((element) => element.id == challenge.id);
    notifyListeners();
    database.deleteChallenge(challenge);
  }

  Future<void> attackBoss(
      BuildContext context, RewardRequestModel request) async {
    if (curChallenge == null) {
      return;
    }
    double damageRatio = request.rewardCoefficient *
        request.difficulty.attackRatio(request.finishedCount + 1);
    if (request.habitType == HabitType.bad) {
      return attackKnight(damageRatio);
    }

    int damage =
        ((max(statusViewModel.attack - curChallenge!.defense, 1)) * damageRatio)
            .round();
    List<Map<String, dynamic>> updatedLog = curChallenge!.log;
    updatedLog.add(
        {"time": DateTime.now().toString(), "attack": true, "damage": damage});
    await updateChallenge(curChallenge!
        .copyWith(curHp: curChallenge!.curHp - damage, log: updatedLog));
    if (curChallenge!.curHp <= 0) {
      RewardResponseModel response = RewardResponseModel();
      response.gold = curChallenge!.rewardGold;
      if (context.mounted) {
        StoreViewModel().updateProperty(response.gold);
        await FinishDialog().show(context, response,
            "${AppLocalizations.of(context)!.challengeCompleted}: ${getChallengeLocalizedString(context, curChallenge!).name}");
        updateChallenge(
            curChallenge!.copyWith(curHp: curChallenge!.totalHp, log: []));
        setCurChallenge(null);
      }
    }
  }

  Future<void> attackKnight(double ratio) async {
    if (curChallenge == null) {
      return;
    }
    int damage =
        ((max(curChallenge!.attack - statusViewModel.defense, 1)) * ratio)
            .round();
    List<Map<String, dynamic>> updatedLog = curChallenge!.log;
    updatedLog.add(
        {"time": DateTime.now().toString(), "attack": false, "damage": damage});
    hp -= damage;
    statusViewModel.updateHP(-damage);
    await updateChallenge(curChallenge!.copyWith(log: updatedLog));
    if (hp <= 0) {
      hp = maxHp;
      statusViewModel.updateHP(maxHp);
      updateChallenge(
          curChallenge!.copyWith(curHp: curChallenge!.totalHp, log: []));
      setCurChallenge(null);
    }
  }
}
