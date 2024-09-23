import 'package:drift/drift.dart';

class Expense extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get walletId => integer()();
  IntColumn get expenseCategoryId => integer()();
  IntColumn get moneyAmount => integer()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}
