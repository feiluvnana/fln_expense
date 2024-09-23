import 'package:drift/drift.dart';
import 'package:flnexpense/services/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getAllExpenseProvider = StreamProvider<List<ExpenseData>>((ref) async* {
  yield* ref.watch(dbProvider).expenseDao.getAll();
});
final getExpenseByWalletProvider =
    StreamProvider.family<List<ExpenseData>, WalletData>((ref, wallet) async* {
  yield* ref.watch(dbProvider).expenseDao.getByWallet(wallet);
});
final getExpenseByDateProvider =
    StreamProvider.family<List<ExpenseData>, DateTime>((ref, date) async* {
  yield* ref.watch(dbProvider).expenseDao.getByDate(date);
});
final getExpenseByMonthProvider =
    StreamProvider.family<List<ExpenseData>, DateTime>((ref, month) async* {
  yield* ref.watch(dbProvider).expenseDao.getByMonth(month);
});
final getExpenseChartHeightByMonthProvider =
    StreamProvider.family<double, DateTime>((ref, month) async* {
  yield* ref.watch(dbProvider).statisticsDao.getBiggestExpenseMoneyAmountByMonth(month);
});

final expenseServiceProvider =
    NotifierProvider<ExpenseServiceNotifier, void>(ExpenseServiceNotifier.new);

class ExpenseServiceNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<void> insert(
      {required WalletData wallet,
      required ExpenseCategoryData expenseCategory,
      required int moneyAmount,
      String? note,
      required DateTime createdAt}) async {
    final db = ref.watch(dbProvider);
    await db.expenseDao.add(ExpenseCompanion.insert(
        walletId: wallet.id,
        note: Value(note),
        expenseCategoryId: expenseCategory.id,
        moneyAmount: moneyAmount,
        createdAt: createdAt));
    await db.walletDao.put(wallet.copyWith(moneyAmount: wallet.moneyAmount - moneyAmount));
  }
}
