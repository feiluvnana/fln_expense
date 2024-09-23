import 'package:drift/drift.dart';

class IncomeCategory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get icon => integer()();
  TextColumn get iconType => text()();
}
