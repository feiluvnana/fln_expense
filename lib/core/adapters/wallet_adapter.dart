import 'dart:async';

import 'package:flnexpense/core/entities/wallet_entity.dart';

abstract interface class IWalletAdapter {
  FutureOr<int> createWallet(WalletEntity wallet);
  FutureOr<List<WalletEntity>> readWallet();
  FutureOr<int> updateWallet(WalletEntity wallet);
  FutureOr<int> deleteWallet(int id);
}
