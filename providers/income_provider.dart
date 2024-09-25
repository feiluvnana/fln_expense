import 'package:drift/drift.dart';
import 'package:flnexpense/services/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getAllIncomeProvider = StreamProvider<List<IncomeData>>((ref) async* {
  yield* ref.watch(dbProvider).incomeDao.getAll();
});
final getIncomeByDateProvider =
    StreamProvider.family<List<IncomeData>, DateTime>((ref, date) async* {
  yield* ref.watch(dbProvider).incomeDao.getByDate(date);
});
final getIncomeByWalletProvider =
    StreamProvider.family<List<IncomeData>, WalletData>((ref, wallet) async* {
  yield* ref.watch(dbProvider).incomeDao.getByWallet(wallet);
});
final getIncomeByMonthProvider =
    StreamProvider.family<List<IncomeData>, DateTime>((ref, month) async* {
  yield* ref.watch(dbProvider).incomeDao.getByMonth(month);
});
final getIncomeChartHeightByMonthProvider =
    StreamProvider.family<double, DateTime>((ref, month) async* {
  yield* ref.watch(dbProvider).statisticsDao.getBiggestIncomeMoneyAmountByMonth(month);
});

final incomeServiceProvider =
    NotifierProvider<IncomeServiceNotifier, void>(IncomeServiceNotifier.new);

class IncomeServiceNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<void> insert(
      {required WalletData wallet,
      required IncomeCategoryData incomeCategory,
      required int moneyAmount,
      String? note,
      required DateTime createdAt}) async {
    final db = ref.watch(dbProvider);
    await db.incomeDao.add(IncomeCompanion.insert(
        walletId: wallet.id,
        incomeCategoryId: incomeCategory.id,
        moneyAmount: moneyAmount,
        note: Value(note),
        createdAt: createdAt));
    await db.walletDao.put(wallet.copyWith(moneyAmount: wallet.moneyAmount + moneyAmount));
  }
}
