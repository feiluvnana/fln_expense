import 'package:drift/drift.dart';

class Transfer extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get toWalletId => integer()();
  IntColumn get fromWalletId => integer().nullable()();
  IntColumn get moneyAmount => integer()();
  DateTimeColumn get createdAt => dateTime()();
}
