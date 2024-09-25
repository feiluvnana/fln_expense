import 'dart:async';

import 'package:flnexpense/core/adapters/wallet_adapter.dart';
import 'package:flnexpense/core/entities/wallet_entity.dart';
import 'package:flnexpense/services/database/database.dart';

class DriftDbAdapter implements IWalletAdapter {
  final FlnExpenseDatabase _db;

  DriftDbAdapter(this._db);

  @override
  FutureOr<int> createWallet(WalletEntity wallet) async {
    try {
      return await _db.into(_db.wallet).insert(WalletCompanion.insert(
          name: wallet.name,
          icon: wallet.icon,
          moneyAmount: wallet.moneyAmount));
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<int> deleteWallet(int id) async {
    try {
      return (_db.delete(_db.wallet)..where((tbl) => tbl.id.equals(id))).go();
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<List<WalletEntity>> readWallet() {
    try {
      return _db.select(_db.wallet).get().then((value) => value
          .map((e) => WalletEntity((u) => u
            ..id = e.id
            ..name = e.name
            ..icon = e.icon
            ..moneyAmount = e.moneyAmount))
          .toList());
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<int> updateWallet(WalletEntity wallet) async {
    try {
      final result = await _db.update(_db.wallet).replace(WalletData(
          id: wallet.id,
          name: wallet.name,
          icon: wallet.icon,
          moneyAmount: wallet.moneyAmount));
      return result ? 0 : -1;
    } catch (e) {
      rethrow;
    }
  }
}
