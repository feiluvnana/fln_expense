import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flnexpense/services/database/tables/wallet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Wallet])
class FlnExpenseDatabase extends _$FlnExpenseDatabase {
  FlnExpenseDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
        name: 'flnexpense',
        web: DriftWebOptions(
            sqlite3Wasm: Uri.parse("sqlite3.wasm"),
            driftWorker: Uri.parse("drift_worker.js")));
  }
}

final dbProvider = Provider((ref) {
  return FlnExpenseDatabase();
});
