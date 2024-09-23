import 'package:drift/drift.dart';

class Income extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get walletId => integer()();
  IntColumn get incomeCategoryId => integer()();
  IntColumn get moneyAmount => integer()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}
