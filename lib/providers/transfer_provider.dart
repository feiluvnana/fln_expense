import 'package:drift/drift.dart';
import 'package:flnexpense/services/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getAllTransferProvider = StreamProvider<List<TransferData>>((ref) async* {
  yield* ref.watch(dbProvider).transferDao.getAll();
});

final transferServiceProvider =
    NotifierProvider<TransferServiceNotifier, void>(TransferServiceNotifier.new);

class TransferServiceNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<void> insert(
      {required WalletData toWallet,
      WalletData? fromWallet,
      required int moneyAmount,
      required DateTime createdAt}) async {
    final db = ref.read(dbProvider);
    await db.transferDao.add(TransferCompanion.insert(
        toWalletId: toWallet.id,
        fromWalletId: Value(fromWallet?.id),
        moneyAmount: moneyAmount,
        createdAt: createdAt));

    await db.walletDao.put(toWallet.copyWith(moneyAmount: moneyAmount + toWallet.moneyAmount));

    if (fromWallet != null) {
      await db.walletDao
          .put(fromWallet.copyWith(moneyAmount: fromWallet.moneyAmount - moneyAmount));
    }
  }
}
