import 'package:drift/drift.dart';

class Wallet extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get icon => integer()();
  TextColumn get iconType => text()();
  IntColumn get moneyAmount => integer()();
}
