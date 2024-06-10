import 'package:drift/drift.dart';

// the challenge that user has bought
@DataClassName("ChallengeModel")
class ChallengeTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  TextColumn get imagePath => text()();

  TextColumn get bossName => text()();

  IntColumn get hp => integer()();

  IntColumn get attack => integer()();

  IntColumn get defense => integer()();

  IntColumn get rewardGold => integer()();
}
