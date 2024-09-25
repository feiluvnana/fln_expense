import 'dart:async';

import 'package:flnexpense/core/adapters/wallet_adapter.dart';
import 'package:flnexpense/core/entities/wallet_entity.dart';
import 'package:flnexpense/services/database/adapters/drift_db_adapters.dart';
import 'package:flnexpense/services/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final walletProvider =
    AsyncNotifierProvider<WalletNotifier, List<WalletEntity>>(
        WalletNotifier.new);

class WalletNotifier extends AsyncNotifier<List<WalletEntity>> {
  late final IWalletAdapter _walletAdapter;

  @override
  FutureOr<List<WalletEntity>> build() async {
    _walletAdapter = DriftDbAdapter(ref.read(dbProvider));
    return _walletAdapter.readWallet();
  }

  Future<int> createWallet(WalletEntity wallet) async {
    try {
      final result = await _walletAdapter.createWallet(wallet);
      state = AsyncValue.data([...state.value!, wallet]);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> updateWallet(WalletEntity wallet) async {
    if (state.hasValue) return -1;
    try {
      return await _walletAdapter.updateWallet(wallet);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> deleteWallet(int id) async {
    if (state.hasValue) return -1;
    try {
      return await _walletAdapter.deleteWallet(id);
    } catch (e) {
      rethrow;
    }
  }
}
