import 'package:flnexpense/services/database/database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getWalletByIdProvider = StreamProvider.autoDispose.family<WalletData, int>((ref, id) async* {
  yield* ref.watch(dbProvider).walletDao.getById(id);
});
final getAllWalletProvider = StreamProvider.autoDispose<List<WalletData>>((ref) async* {
  yield* ref.watch(dbProvider).walletDao.getAll();
});

final walletServiceProvider =
    NotifierProvider.autoDispose<WalletServiceNotifier, void>(WalletServiceNotifier.new);

class WalletServiceNotifier extends AutoDisposeNotifier<void> {
  @override
  void build() {
    return;
  }

  Future<void> insert(
      {required dynamic iconData, required String name, required int moneyAmount}) async {
    final db = ref.read(dbProvider);
    final wallet = WalletCompanion.insert(
        name: name,
        icon: (iconData as IconData).codePoint,
        iconType: iconData.runtimeType.toString(),
        moneyAmount: moneyAmount);
    final id = await db.walletDao.add(wallet);
    await db.transferDao.add(TransferCompanion.insert(
        toWalletId: id, moneyAmount: moneyAmount, createdAt: DateTime.now()));
  }

  Future<void> update(
      {required dynamic iconData,
      required String name,
      required int moneyAmount,
      required int oldId}) async {
    final db = ref.read(dbProvider);
    final wallet = WalletData(
        id: oldId,
        name: name,
        icon: (iconData as IconData).codePoint,
        iconType: iconData.runtimeType.toString(),
        moneyAmount: moneyAmount);
    await db.walletDao.put(wallet);
    await db.transferDao.add(TransferCompanion.insert(
        toWalletId: oldId, moneyAmount: moneyAmount, createdAt: DateTime.now()));
  }

  Future<void> delete(WalletData entity) {
    return ref.read(dbProvider).walletDao.del(entity.id);
  }
}
